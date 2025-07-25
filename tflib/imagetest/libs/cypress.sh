#!/usr/bin/env bash

# Function to run Cypress tests
#
# It's using a relatively long timeout as Cypress tests can take
# a significant amount of time ; at least 1m just to download the
# cypress image and get the tests started
#
# Usage: run_cypress_tests path ?name? ?timeout?
#
# Arguments:
#   path        - Path to directory containing tests and config
#   name        - Base name for all objects and output path;
#                 defaults to "cypress"
#   timeout     - Timeout for the tests
#                 defaults to "10m"
#   retries     - Number of retries
#                 defaults to "3"
#
# Example:
#   run_cypress_tests ./cypress
run_cypress_tests() {
  local path="${1:?Path to cypress directory required}"
  local name="${2:-cypress}"
  local timeout="${3:-10m}"
  local retries="${4:-3}"

  local tempdir="$(mktemp -d)"

  # create a copy of the path, as placeholder to extend / apply
  # changes to configuration in the future
  cp -pfR "$path/." "${tempdir}/"

  update_cypress_video_config "${tempdir}/"

  # delete job in case we're retrying
  kubectl delete job -n default "${name}" || true
  kubectl create configmap -n default "${name}" --from-file "${tempdir}"
  kubectl apply -f - <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: "${name}-output"
  labels:
    dev.chainguard.imagetest/outputs: "${name}"
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: batch/v1
kind: Job
metadata:
  namespace: default
  name: "${name}"
spec:
  backoffLimit: $(($retries-1))
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: cypress
          image: cypress/included
          volumeMounts:
            - name: configmap
              mountPath: /cypress
              readOnly: false
            - name: output
              mountPath: /cypress/videos
              readOnly: false
            - name: screenshots
              mountPath: /cypress/screenshots
              readOnly: false
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
          command:
            - cypress
            - run
            - --config-file
            - /cypress/cypress.config.js
      volumes:
      - name: configmap
        configMap:
          name: "${name}"
      - name: output
        persistentVolumeClaim:
          claimName: "${name}-output"
      - name: screenshots
        emptyDir: {}
EOF

  if ! kubectl wait --for=condition=complete --timeout="${timeout}" -n default "job/${name}" ; then
    # retrieve videos, read logs for all pods and exit
    retrieve_cypress_videos "$name"
    for pod in $(kubectl get pods -n default -l "batch.kubernetes.io/job-name=${name}" -o name) ; do
      echo >&2 "Logs for $pod:"
      kubectl logs -n default "${pod}" >&2
      echo >&2 ""
    done
    return 1
  else
    retrieve_cypress_videos "$name"
  fi
}


# Function to patch Cypress configuration with video settings
#
# Sets videosFolder to unique name to allow multiple test runs to not
# overwrite the image files, which is useful to see the initial error
# if subsequent runs may be running into a different problem due to
# application state
#
# Usage: update_cypress_video_config path
#
# Arguments:
#   path        - Path to directory containing tests and config
#
# Example:
#   update_cypress_video_config ./cypress
update_cypress_video_config() {
  local path="${1:?Path to cypress directory required}"
  sed -E -i \
    's#//[[:space:]]*VIDEO SETTINGS PLACEHOLDER.*$#video: true, videosFolder: `/cypress/videos/${Date.now()}-${process.env.POD_NAME}`,#' \
    "${path}/cypress.config.js"
}

retrieve_cypress_videos() {
  local name="${1:?Name required}"
  local busybox_image="cgr.dev/chainguard/busybox:latest"

  if [ "${IMAGETEST_ARTIFACTS:-}" = "" ] ; then
    echo "Not preserving artifacts - IMAGETEST_ARTIFACTS not set"
    return 0
  fi

  kubectl apply -f - <<EOF
apiVersion: batch/v1
kind: Job
metadata:
  namespace: default
  name: "${name}-retrieve-videos"
spec:
  backoffLimit: 0
  template:
    spec:
      restartPolicy: Never
      containers:
        - name: busybox
          image: $busybox_image
          volumeMounts:
            - name: output
              mountPath: /cypress/videos
          command:
            - sh
            - -c
            - 'tar -C /cypress/videos -c . | base64'
      volumes:
      - name: output
        persistentVolumeClaim:
          claimName: "${name}-output"
EOF

  if ! kubectl wait --for=condition=complete --timeout="${timeout}" -n default "job/${name}-retrieve-videos" ; then
    echo >&2 "WARNING: unable to retrieve videos:"
    kubectl logs -n default "job/${name}-retrieve-videos" >&2
  else
    mkdir -p "$IMAGETEST_ARTIFACTS/${name}"
    kubectl logs -n default --tail=-1 "job/${name}-retrieve-videos" 2>/dev/null | base64 -d | tar -C "$IMAGETEST_ARTIFACTS/${name}" -x
  fi
}
