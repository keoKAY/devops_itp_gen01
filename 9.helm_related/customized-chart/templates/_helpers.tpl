{{- define "deploy-specs" }}
    affinity: 
        {{- toYaml .Values.affinity  | nindent 7 }}
    containers:
    {{- with .Values.container }}
      - name: {{ .name }}
        image: {{ .image }}
        ports:
        - containerPort: {{ .port }}
        env: 
    {{- range .env }}
        - name: {{.name }}
          value: {{.value}} 
    {{- end  }}
    {{- end }}
        {{- if .Values.resources }}
        resources: 
            {{- toYaml .Values.resources | nindent 8}}
        {{- end }}

{{- end }}