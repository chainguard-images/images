#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

chart_path="${IMAGETEST_HELM_CHART}"

# If git repo is set, handle it and any patches
if [[ -n "${IMAGETEST_HELM_GIT_REPO}" ]]; then
  tempdir=$(mktemp -d)

  # Clone the repo
  git clone "${IMAGETEST_HELM_GIT_REPO}" "${tempdir}/helm-repo"

  # Apply any patches
  patchfiles=($(echo "${IMAGETEST_HELM_PATCHES}" | jq -r '.[]'))
  for patchfile in "${patchfiles[@]}"; do
    echo "Applying patch ${patchfile}..."
    patch '-p1' -d "${tempdir}/helm-repo" <"${patchfile}"
  done

  # Set the chart to the cloned repo
  chart_path="${tempdir}/helm-repo/${IMAGETEST_HELM_CHART}"
fi

helm_install_args=(
  "${IMAGETEST_HELM_NAME}"
  "${chart_path}"
  --debug
)

if [[ -n "${IMAGETEST_HELM_NS}" ]]; then
  helm_install_args+=(
    --namespace "${IMAGETEST_HELM_NS}"
    --create-namespace
  )
fi

if [[ -n "${IMAGETEST_HELM_REPO}" ]]; then
  helm_install_args+=(
    --repo "${IMAGETEST_HELM_REPO}"
  )
fi

if [[ -n "${IMAGETEST_HELM_CHART_VERSION}" ]]; then
  helm_install_args+=(
    --version "${IMAGETEST_HELM_CHART_VERSION}"
  )
fi

if [[ -n "${IMAGETEST_HELM_VALUES}" ]]; then
  # write the values to a temporary file as yaml
  values_file=$(mktemp)
  echo "Writing values to ${values_file}"
  echo "${IMAGETEST_HELM_VALUES}" | yq -P >"${values_file}"

  helm_install_args+=(
    --values "${values_file}"
  )
fi

if [[ "${IMAGETEST_HELM_WAIT}" == "true" ]]; then
  helm_install_args+=(
    --wait
  )
fi

# Show the charts upstream values
echo
echo "=== Upstream chart values ==="
echo
{ helm show values "${chart_path}" ${IMAGETEST_HELM_REPO:+--repo "${IMAGETEST_HELM_REPO}"} | tee /tmp/helm-upstream-values.yaml; } || true

# Render the templated manifests somewhere
{ helm template "${helm_install_args[@]}" | tee /tmp/helm-pre-install-manifests.yaml; } || true

# Finally, run the install command
echo
echo "=== Installing Helm chart ==="
echo
helm install "${helm_install_args[@]}"

# If we succeeded, print out some useful info, but don't flag an error if any of this fails
{
  echo
  echo "=== Post-install user supplied values ==="
  echo
  helm get values "${IMAGETEST_HELM_NAME}" -n "${IMAGETEST_HELM_NS}"

  # Write the complete rendered manifests to a file
  helm get manifest "${IMAGETEST_HELM_NAME}" -n "${IMAGETEST_HELM_NS}" | tee /tmp/helm-post-install-manifests.yaml

  # List the images installed but don't enforce
  echo
  echo "=== Images installed ==="
  echo
  kimages -n "${IMAGETEST_HELM_NS}"
} || true
