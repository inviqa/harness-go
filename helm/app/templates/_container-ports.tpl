{{- define "container.ports" }}
  - name: {{ .Values.default_port.name | quote }}
    containerPort: {{ .Values.default_port.port }}
{{- end }}
