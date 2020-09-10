stack:
	docker-compose build;
	docker-compose down;
	docker-compose up -d;

mongo-backup:
	docker exec mongo mongodump -u $(MONGO_USER) -p $(MONGO_PASSWORD) --authenticationDatabase admin --db=sneakerResaleDB  --out=/backup || echo "mongo down - backup impossible";

mongo-restore:
	docker exec mongo mongorestore -u $(MONGO_USER) -p $(MONGO_PASSWORD) --authenticationDatabase admin ./backup;

nfs:
	helm upgrade --install nfs-server stable/nfs-server-provisioner -n storage -f nfs/values.yaml

gitlab-runner:
	kubectl create clusterrolebinding gitlab-runner-admin  --clusterrole=cluster-admin --user=gitlab-runner --group=system:serviceaccounts