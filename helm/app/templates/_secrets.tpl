{{- define "service.environment.secret" }}
{{ if and .service.enabled .service.environment_secrets }}
{{ if .Values.feature.sealed_secrets }}
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
{{ else }}
apiVersion: v1
kind: Secret
{{ end }}
metadata:
  name: {{ .Values.resourcePrefix }}{{ .service_name }}
{{ if .Values.feature.sealed_secrets }}
{{ if ne .Values.sealed_secrets.scope "strict" }}
  annotations:
    sealedsecrets.bitnami.com/{{ .Values.sealed_secrets.scope }}: "true"
{{ end }}
spec:
  encryptedData:
{{ index .service.environment_secrets | toYaml | nindent 4 -}}
{{ else }}
stringData:
{{ index .service.environment_secrets | toYaml | nindent 2 -}}
{{ end }}
{{ end }}
{{- end }}
