{{/*
Expand the name of the chart.
*/}}
{{- define "chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chart.labels" -}}
chart: {{ include "chart.chart" . }}
{{ include "chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
version: {{ .Chart.AppVersion | quote }}
{{- end }}
managed-by: {{ .Release.Service }}
project: {{ .Values.project }}
component: {{ .Values.component }}
release: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chart.selectorLabels" -}}
name: {{ include "chart.name" . }}
instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "chart.topology" -}}
{
  "clusters": [
    {
      "nodes": [
        {{- range $index, $value := .Values.topology -}}
        {{- if $index -}},{{- end }}
        {
          "node": {
            "hostnames": {
              "manage": [
                {{- range $index, $manage := $value.node.hostnames.manage }}
                {{- if $index -}},{{- end }}
                {{ $manage | quote }}
                {{- end }}
              ],
              "storage": [
                {{- range $index, $storage := $value.node.hostnames.storage -}}
                {{- if $index -}},{{- end }}
                {{ $storage | quote }}
                {{- end }}
              ]
            },
            "zone": {{ $value.node.zone }}
          },
          "devices": [
            {{- range $index, $devices := $value.devices -}}
            {{- if $index -}},{{- end }}
            {{ $devices | quote }}
            {{- end }}
          ]
        }
        {{- end -}}
      ]
    }
  ]
}
{{- end -}}