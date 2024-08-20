#!/usr/bin/env bash

set -o errexit -o errtrace -o pipefail -x

ONLY_TEST_LANG="${ONLY_TEST_LANG:-}"

# Copy everything to a tempdir to prevent permissions issues on github actions
TMPDIR="$(mktemp -d)"
cp -r $WORK_DIR/examples/* "${TMPDIR}"

mkdir -p "${TMPDIR}/.pulumi"
chmod -R go+wrx "${TMPDIR}"

function pulumi_up {
  lang="${1}"
  name="${2}"
  pushd ${TMPDIR}/smoketest-${lang}
  PULUMI_CONFIG_PASSPHRASE="${name}" pulumi login file://.
  PULUMI_CONFIG_PASSPHRASE="${name}" pulumi stack init --non-interactive --stack ${name}

  # Specifically in the case of nodejs, preinstall the depends to prevent mystery error in CI:
  #
  #   error: It looks like the Pulumi SDK has not been installed. Have you run npm install or yarn install?
  #   error: error reading from server: EOF
  #
  if [[ "${lang}" == "nodejs" ]]; then
    npm install
  fi

  PULUMI_CONFIG_PASSPHRASE="${name}" pulumi up --yes --config name=${name} --stack ${name}
}

function pulumi_down {
  lang="${1}"
  name="${2}"
  PULUMI_CONFIG_PASSPHRASE="${name}" pulumi destroy --yes --stack ${name}
  PULUMI_CONFIG_PASSPHRASE="${name}" pulumi stack rm --yes --stack ${name}
}

function main {
  d="$(date +%s)"
  for lang in "dotnet" "go" "java" "nodejs" "python" "yaml"; do
    if [[ "${ONLY_TEST_LANG}" != "" && "${lang}" != "${ONLY_TEST_LANG}" ]]; then
      continue
    fi
    (set +x && echo "---------- BEGIN TESTING SUPPORT FOR LANGUAGE: ${lang} ----------")
    pushd "${TMPDIR}/smoketest-${lang}"
    k="${lang}-${d}"
    trap "popd" EXIT
    pulumi_up "${lang}" "${k}"
    pulumi_down "${lang}" "${k}"
    (set +x && echo "---------- END TESTING SUPPORT FOR LANGUAGE: ${lang}   ----------")
  done
}

main
