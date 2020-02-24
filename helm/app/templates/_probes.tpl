{{- define "probes" }}
readinessProbe:
  tcpSocket:
    port: {{ .Values.health_port }}
    initialDelaySeconds: 5
    periodSeconds: 10
livenessProbe:
  tcpSocket:
    port: {{ .Values.health_port }}
    initialDelaySeconds: 10
    periodSeconds: 10
{{- end }}
