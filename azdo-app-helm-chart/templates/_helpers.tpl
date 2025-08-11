{{- define "azdo-app.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "azdo-app.labels" -}}
app.kubernetes.io/name: {{ include "azdo-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}

{{- define "azdo-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "azdo-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "azdo-app.serviceAccountName" -}}
{{- default (include "azdo-app.fullname" .) .Values.serviceAccount.name }}
{{- end }}
