{{- define "service.environment.secret" }}
{{ if .service.environment_secrets }}
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
  annotations:
    sealedsecrets.bitnami.com/cluster-wide: "true"
spec:
  encryptedData:
{{ index .service.environment_secrets | toYaml | nindent 4 -}}
{{ else }}
stringData:
{{ index .service.environment_secrets | toYaml | nindent 2 -}}
{{ end }}
{{ end }}
{{- end }}
