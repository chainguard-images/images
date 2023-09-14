#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x

ONLY_TEST_LANG="${ONLY_TEST_LANG:-}"

K3S_IP="$(docker ps | grep 'k3d-k3s-default-server-0' | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["k3d-k3s-default"].IPAddress')"
if [[ "${K3S_IP}" == "" ]]; then
	echo "Could not get K3S_IP. Is k3s running? Exiting."
	exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "${SCRIPT_DIR}/../"

# Copy everything to a tempdir to prevent permissions issues on github actions
TMPDIR="$(mktemp -d)"
cp -r examples/* "${TMPDIR}"

# Get the k3s kubeconfig
# Create a kubeconfig with admin access to k3s (from inside docker network)
mkdir -p "${TMPDIR}/.pulumi"
mkdir -p "${TMPDIR}/.kube"
k3d kubeconfig get k3s-default | yq '.clusters[].cluster.server = "https://'${K3S_IP}':6443"' \
	>"${TMPDIR}/.kube/config"
chmod -R go+wrx "${TMPDIR}"

function pulumi_docker_exec {
    lang="${1}"
    name="${2}"
    args="${3}"
    docker run --rm -w /work/smoketest-${lang} --network k3d-k3s-default \
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

    # Specifically in the case of nodejs, preinstall the depends to prevent mystery error in CI:
    #
    #   error: It looks like the Pulumi SDK has not been installed. Have you run npm install or yarn install?
    #   error: error reading from server: EOF
    #
    if [[ "${lang}" == "nodejs" ]]; then
        docker run --rm -w /work/smoketest-${lang} \
            -v "${TMPDIR}:/work" \
            --entrypoint npm \
            "${IMAGE_NAME}" \
            install
    fi

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
