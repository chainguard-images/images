#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# deploy fluent bit
cat <<EOF | kubectl apply -f -
apiVersion: fluentbit.fluent.io/v1alpha2
kind: FluentBit
metadata:
  name: fluent-bit
  namespace: fluent
  labels:
    app.kubernetes.io/name: fluent-bit
spec:
  image: cgr.dev/chainguard/fluent-bit:latest
  positionDB:
    hostPath:
      path: /var/lib/fluent-bit/
  resources:
    requests:
      cpu: 10m
      memory: 25Mi
    limits:
      cpu: 500m
      memory: 200Mi
  fluentBitConfigName: fluent-bit-only-config
  tolerations:
    - operator: Exists
EOF

# deploy fluentd
cat <<EOF | kubectl apply -f -
apiVersion: fluentd.fluent.io/v1alpha1
kind: Fluentd
metadata:
  name: fluentd
  namespace: fluent
  labels:
    app.kubernetes.io/name: fluentd
spec:
  globalInputs:
  - forward: 
      bind: 0.0.0.0
      port: 24224
  replicas: 1 
  image: cgr.dev/chainguard/fluentd:latest
  fluentdCfgSelector: 
    matchLabels:
      config.fluentd.fluent.io/enabled: "true"
EOF

# log using http into fluentd, output to stdout
cat <<EOF | kubectl apply -f -
apiVersion: fluentd.fluent.io/v1alpha1
kind: Fluentd
metadata:
  name: fluentd-http
  namespace: fluent
  labels:
    app.kubernetes.io/name: fluentd
spec:
  globalInputs:
    - http: 
        bind: 0.0.0.0
        port: 9880
  replicas: 1
  image: cgr.dev/chainguard/fluentd:latest
  fluentdCfgSelector: 
    matchLabels:
      config.fluentd.fluent.io/mode: "fluentd-only" 
---
apiVersion: fluentd.fluent.io/v1alpha1
kind: FluentdConfig
metadata:
  name: fluentd-only-config
  namespace: fluent
  labels:
    config.fluentd.fluent.io/mode: "fluentd-only" 
spec:
  outputSelector:
    matchLabels:
      output.fluentd.fluent.io/mode: "fluentd-only"
---
apiVersion: fluentd.fluent.io/v1alpha1
kind: Output
metadata:
  name: fluentd-only-stdout
  namespace: fluent
  labels:
    output.fluentd.fluent.io/mode: "fluentd-only"
spec: 
  outputs: 
  - stdout: {}
EOF