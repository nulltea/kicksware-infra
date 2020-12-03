apt-get install grml-rescueboot

cd /boot/grml

wget http://download.grml.org/grml64-small_2020.06.iso

update-grub

reboot

-- Grml Rescue System
-- advanced options
-- copy Grml to RAM

u # to set us keymap

return # (not a)

fsck.ext4 -f /dev/vda1

resize2fs -M /dev/vda1

parted /dev/vda

resizepart 1 50G # shrink existing partition /dev/vda1

mkpart primary 50001 100% # create new one /dev/vda3

set 3 lvm on # optional

print # verify

quit

fdisk -l /dev/vda # verify again

reboot

# configure node for client https://www.ibm.com/support/knowledgecenter/SSBS6K_3.2.0/manage_cluster/prepare_nodes.html

modprobe dm_thin_pool
echo dm_thin_pool | tee -a /etc/modules # verify output == dm_thin_pool

# insyall glusterfs-client https://docs.gluster.org/en/latest/Install-Guide/Install/ https://download.gluster.org/pub/gluster/glusterfs/7/LATEST/Debian/

wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/rsa.pub | apt-key add -

echo deb [arch=amd64] https://download.gluster.org/pub/gluster/glusterfs/7/7.1/Debian/buster/amd64/apt buster main > /etc/apt/sources.list.d/gluster.list

apt-get update

apt-get install glusterfs-client

/usr/sbin/glusterfs --version

# Add partition symlink

udevadm info --root --name=/dev/vda3

nano /lib/udev/rules.d/10-custom-icp.rules

ENV{DEVTYPE}=="partition", ENV{SUBSYSTEM}=="block", ENV{DEVPATH}=="/devices/pci0000:00/0000:00:06.0/virtio3/block/vda/vda3" SYMLINK+="disk/gluster-disk"

udevadm control --reload-rules && udevadm trigger --type=devices --action=change

ls -ltr /dev/disk/gluster-disk

# configure gluster topology & deamonset

kubectl get nodes -o wide

kubectl label node kicksware-k8s-3pivy storagenode=glusterfs

kubectl create clusterrolebinding gluster-fs-role --clusterrole=cluster-admin --user=gluster-fs --group=system:serviceaccounts

heketi-cli topology load --json=/etc/heketi-topology/topology.json
