#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

crds=(
  "alertmanagerconfigs.monitoring.coreos.com"
  "alertmanagers.monitoring.coreos.com"
  "podmonitors.monitoring.coreos.com"
  "probes.monitoring.coreos.com"
  "prometheusagents.monitoring.coreos.com"
  "prometheuses.monitoring.coreos.com"
  "prometheusrules.monitoring.coreos.com"
  "scrapeconfigs.monitoring.coreos.com"
  "servicemonitors.monitoring.coreos.com"
  "thanosrulers.monitoring.coreos.com"
)

cleanup() {
    helm uninstall ${CHART_NAME} -n ${NAMESPACE} --wait --cascade=foreground --timeout=10m
    kubectl delete pods -n ${NAMESPACE} --all --wait=true
    kubectl delete ns ${NAMESPACE} --wait=true

    for crd in "${crds[@]}"; do
        kubectl delete crd $crd
    done
}
trap cleanup EXIT

