#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl --namespace ${LOGGING_OPERATOR_NAMESPACE} apply -f - <<EOF
apiVersion: logging.banzaicloud.io/v1beta1
kind: Logging
metadata:
  name: quickstart
spec:
  controlNamespace: ${LOGGING_OPERATOR_NAMESPACE}
  fluentd:
    disablePvc: true
    image:
      repository: ${FLUENTD_REPOSITORY}
      tag: ${FLUENTD_TAG}
      pullPolicy: Always
EOF

kubectl --namespace ${LOGGING_OPERATOR_NAMESPACE} apply -f - <<EOF
apiVersion: logging.banzaicloud.io/v1beta1
kind: FluentbitAgent
metadata:
    name: quickstart
spec: {}
EOF

kubectl --namespace ${LOG_GENERATOR_NAMESPACE} apply -f - <<EOF
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: log-generator
spec:
  match:
    - select:
        labels:
          app.kubernetes.io/name: log-generator
  localOutputRefs:
    - http
---
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: http
spec:
  http:
    endpoint: http://${LOGGING_OPERATOR_NAMESPACE}-test-receiver:8080
    content_type: application/json
    buffer:
      type: memory
      tags: time
      timekey: 1s
      timekey_wait: 0s
EOF

# Sometimes it takes a little while for the pods to come up
function wait_for_existence() {
    local -r namespace=$1
    local -r selector=$2
    local -r grep_string=$3

    local total=0
    until kubectl get po -n ${namespace} --selector ${selector} | grep ${grep_string}
    do
        if [ $total -ge 300 ] # time out at 300s
        then
            echo "timed out waiting on ${grep_string} pod"
            exit 1
        fi

        echo "waiting on ${grep_string} pod"
        sleep 5
        ((total+=5))
    done
}

# Check that the configcheck pod succeeds
wait_for_existence ${LOGGING_OPERATOR_NAMESPACE} 'app.kubernetes.io/component=fluentd-configcheck' 'fluentd-configcheck'
kubectl wait pod -n ${LOGGING_OPERATOR_NAMESPACE} \
    --for=jsonpath='{.status.phase}'=Succeeded \
    --timeout 5m \
    --selector app.kubernetes.io/component=fluentd-configcheck

# Ensure fluentd spins up
wait_for_existence ${LOGGING_OPERATOR_NAMESPACE} 'app.kubernetes.io/component=fluentd' 'fluentd-0'
kubectl wait pod -n ${LOGGING_OPERATOR_NAMESPACE} \
    --for=condition=ready \
    --timeout 5m \
    --selector app.kubernetes.io/component=fluentd

# Ensure fluent-bit spins up
wait_for_existence ${LOGGING_OPERATOR_NAMESPACE} 'app.kubernetes.io/name=fluentbit' 'fluentbit'
kubectl wait pod -n ${LOGGING_OPERATOR_NAMESPACE} \
    --for=condition=ready \
    --timeout 5m \
    --selector app.kubernetes.io/name=fluentbit

# Make sure logs are being collected
sleep 5
kubectl logs --namespace ${LOGGING_OPERATOR_NAMESPACE} svc/${LOGGING_OPERATOR_NAMESPACE}-test-receiver | grep 'pod_name.*log-generator'
