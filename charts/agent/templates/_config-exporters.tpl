{{- define "config.exporters.otlphttp.observe.base" -}}
otlphttp/observe/base:
    # These environment variables are provided by the observe-agent:
    # https://github.com/observeinc/observe-agent/blob/v2.0.1/internal/connections/confighandler.go#L91-L102
    endpoint: "${env:OBSERVE_COLLECTOR_URL}:4318"
    headers:
        authorization: "${env:OBSERVE_AUTHORIZATION_HEADER}"
        x-observe-target-package: "Kubernetes Explorer"
    sending_queue:
      enabled: {{ .Values.agent.config.global.exporters.sendingQueue.enabled }}
    retry_on_failure:
      enabled: {{ .Values.agent.config.global.exporters.retryOnFailure.enabled }}
      initial_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.initialInterval }}
      max_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.maxInterval }}
      max_elapsed_time: {{ .Values.agent.config.global.exporters.retryOnFailure.maxElapsedTime }}
    compression: zstd
{{- end -}}

{{- define "config.exporters.otlphttp.observe.entity" -}}
otlphttp/observe/entity:
    # These environment variables are provided by the observe-agent:
    # https://github.com/observeinc/observe-agent/blob/v2.0.1/internal/connections/confighandler.go#L91-L102
    logs_endpoint: "${env:OBSERVE_COLLECTOR_URL}:4319/v1/logs"
    headers:
      authorization: "${env:OBSERVE_AUTHORIZATION_HEADER}"
      x-observe-target-package: "Kubernetes Explorer"
    sending_queue:
      enabled: {{ .Values.agent.config.global.exporters.sendingQueue.enabled }}
    retry_on_failure:
      enabled: {{ .Values.agent.config.global.exporters.retryOnFailure.enabled }}
      initial_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.initialInterval }}
      max_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.maxInterval }}
      max_elapsed_time: {{ .Values.agent.config.global.exporters.retryOnFailure.maxElapsedTime }}
    compression: zstd
{{- end -}}

{{- define "config.exporters.otlphttp.observe.trace" -}}
otlphttp/observe/forward/trace:
    # These environment variables are provided by the observe-agent:
    # https://github.com/observeinc/observe-agent/blob/v2.0.1/internal/connections/confighandler.go#L91-L102
    endpoint: "${env:OBSERVE_COLLECTOR_URL}:4318"
    headers:
        authorization: "Bearer ${env:TRACE_TOKEN}"
        x-observe-target-package: "Tracing"
    sending_queue:
      enabled: {{ .Values.agent.config.global.exporters.sendingQueue.enabled }}
    retry_on_failure:
      enabled: {{ .Values.agent.config.global.exporters.retryOnFailure.enabled }}
      initial_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.initialInterval }}
      max_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.maxInterval }}
      max_elapsed_time: {{ .Values.agent.config.global.exporters.retryOnFailure.maxElapsedTime }}
    compression: zstd
{{- end -}}

{{- define "config.exporters.otlphttp.observe.metrics.otel" -}}
otlphttp/observe/otel_metrics:
    # These environment variables are provided by the observe-agent:
    # https://github.com/observeinc/observe-agent/blob/v2.0.1/internal/connections/confighandler.go#L91-L102
    endpoint: "${env:OBSERVE_COLLECTOR_URL}:4318"
    headers:
        authorization: "${env:OBSERVE_AUTHORIZATION_HEADER}"
        x-observe-target-package: "Metrics"
    sending_queue:
      enabled: {{ .Values.agent.config.global.exporters.sendingQueue.enabled }}
    retry_on_failure:
      enabled: {{ .Values.agent.config.global.exporters.retryOnFailure.enabled }}
      initial_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.initialInterval }}
      max_interval: {{ .Values.agent.config.global.exporters.retryOnFailure.maxInterval }}
      max_elapsed_time: {{ .Values.agent.config.global.exporters.retryOnFailure.maxElapsedTime }}
    compression: zstd
{{- end -}}

{{- define "config.exporters.prometheusremotewrite" -}}
otlphttp/prommetrics:
    # These environment variables are provided by the observe-agent:
    # https://github.com/observeinc/observe-agent/blob/v2.0.1/internal/connections/confighandler.go#L91-L102
    endpoint: "${env:OBSERVE_COLLECTOR_URL}:4320"
    headers:
        authorization: "${env:OBSERVE_AUTHORIZATION_HEADER}"
        x-observe-target-package: "Kubernetes Explorer"
    sending_queue:
      enabled: true
    retry_on_failure:
      enabled: true
      initial_interval: 1s
      max_interval: 30s
      max_elapsed_time: 5m
    compression: zstd
{{- end -}}

{{- define "config.exporters.debug" -}}
debug/override:
    verbosity: {{ .Values.agent.config.global.debug.verbosity }}
    sampling_initial: 2
    sampling_thereafter: 1
{{- end -}}

{{- define "config.exporters.nop" -}}
nop:
{{- end -}}
