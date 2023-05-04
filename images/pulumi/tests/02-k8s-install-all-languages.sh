#!/usr/bin/env bash

# monopod:tag:k8s

set -o errexit -o errtrace -o pipefail -x

if [[ "${IMAGE_NAME}" == "" ]]; then
    echo "Must set IMAGE_NAME environment variable. Exiting."
    exit 1
fi

ONLY_TEST_LANG="${ONLY_TEST_LANG:-}"

KIND_IP="$(docker ps | grep kind- | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["kind"].IPAddress')"
KIND_PORT="$(docker ps | grep kind- | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Ports["6443/tcp"][0].HostPort')"
if [[ "${KIND_IP}" == "" || "${KIND_PORT}" == "" ]]; then
    echo "Could not get KIND_IP or KIND_PORT. Is kind running? Exiting."
    exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/../"

# Copy everything to a tempdir to prevent permissions issues on github actions
TMPDIR="$(mktemp -d)"
cp -r examples/* "${TMPDIR}"

# Get the kind kubeconfig
# Create a kubeconfig with admin access to kind (from inside docker network)
mkdir -p "${TMPDIR}/.pulumi"
mkdir -p "${TMPDIR}/.kube"
kind get kubeconfig | sed "s|127.0.0.1:${KIND_PORT}|${KIND_IP}:6443|g" \
    > "${TMPDIR}/.kube/config"
chmod -R go+wrx "${TMPDIR}"

function pulumi_docker_exec {
    lang="${1}"
    name="${2}"
    args="${3}"
    docker run --rm -w /work/smoketest-${lang} --network kind \
        -v "${TMPDIR}:/work" \
        -e KUBECONFIG=/work/.kube/config \
        -e PULUMI_HOME=/work/.pulumi \
        -e PULUMI_CONFIG_PASSPHRASE="${name}" \
        "${IMAGE_NAME}" ${args}
}

function pulumi_up {
    lang="${1}"
    name="${2}"
    pulumi_docker_exec "${lang}" "${name}" "login file://."
    pulumi_docker_exec "${lang}" "${name}" "stack init --non-interactive --stack ${name}"
    pulumi_docker_exec "${lang}" "${name}" "up --yes --config name=${name} --stack ${name}"
}

function pulumi_down {
    lang="${1}"
    name="${2}"
    pulumi_docker_exec "${lang}" "${name}" "destroy --yes --stack ${name}"
    pulumi_docker_exec "${lang}" "${name}" "stack rm --yes --stack ${name}"
}

function k8s_cleanup {
    lang="${1}"
    name="${2}"
    kubectl get pods | grep -v NAME | awk '{print $1}' | xargs kubectl delete pod --force || true
    pkill -9 kubectl || true
}

function test_nginx {
    lang="${1}"
    name="${2}"
    latest_pod_name="$(kubectl get pods --sort-by=.metadata.creationTimestamp -o jsonpath="{.items[0].metadata.name}")"
    kubectl port-forward "pod/${latest_pod_name}" 8080:8080 &
    pid="$!"
    sleep 5
    curl -v --max-time 10 http://localhost:8080/ | grep '<title>Welcome to nginx!</title>'
}

function main {
    d="$(date +%s)"
    for lang in "dotnet" "go" "java" "nodejs" "python" "yaml"; do
        if [[ "${ONLY_TEST_LANG}" != "" && "${lang}" != "${ONLY_TEST_LANG}" ]]; then
            continue
        fi
        (set +x && echo "---------- BEGIN TESTING SUPPORT FOR LANGUAGE: ${lang} ----------")
        k="${lang}-${d}"
        k8s_cleanup "${lang}" "${k}"
        trap "k8s_cleanup '${lang}' '${k}'" EXIT
        pulumi_up "${lang}" "${k}"
        test_nginx "${lang}" "${k}"
        pulumi_down "${lang}" "${k}"
        k8s_cleanup "${lang}" "${k}"
        (set +x && echo "---------- END TESTING SUPPORT FOR LANGUAGE: ${lang}   ----------")
    done
}

main
