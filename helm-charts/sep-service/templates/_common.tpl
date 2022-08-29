{{- define "common.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "common.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "common.addField" -}}
{{- $key := index . 0 }}
{{- $val := index . 1 }}
{{- if $val }}
{{- printf "%s: %s" $key  $val}}
{{- end }}
{{- end }}

{{- define "common.addMap" -}}
{{- $mapName := index . 0 }}
{{- $mapValues := index . 1 }}
{{- $indent := index . 2 }}
{{- $indent2 := index . 3 }}
{{- if $mapValues }}
{{ $mapName | indent $indent }}:
{{- range $key, $value := $mapValues }}
{{ $key | indent $indent2 }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }}