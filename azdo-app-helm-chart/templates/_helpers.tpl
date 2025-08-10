{{- define "simple-flask-app.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "simple-flask-app.labels" -}}
app.kubernetes.io/name: {{ include "simple-flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}

{{- define "simple-flask-app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "simple-flask-app.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "simple-flask-app.serviceAccountName" -}}
{{- default (include "simple-flask-app.fullname" .) .Values.serviceAccount.name }}
{{- end }}
