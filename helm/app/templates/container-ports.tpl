{{- define "container.ports" }}
  - containerPort: {{ .Values.default_port.port }}
{{- end }}
