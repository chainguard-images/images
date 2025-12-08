#!/usr/bin/env bash

set -xeuo pipefail

# shellcheck disable=SC1091
source ../libs/libs.sh

apk_add curl wait-for-it

IMAGE="$(get_test_image "tomcat")"
NAMESPACE="tomcat"

TMPDIR="$(mktemp -d)"
tee "${TMPDIR}/ns.yaml" <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: ${NAMESPACE}
EOF

kubectl apply -f "${TMPDIR}/ns.yaml"

curl -sSL -o "${TMPDIR}/sample.war" "${WAR_URL}"
kubectl create configmap sample-war-configmap \
  -n "${NAMESPACE}" \
  --from-file=sample.war="${TMPDIR}/sample.war"

tee "${TMPDIR}/deployment.yaml" <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: tomcat-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tomcat
  template:
    metadata:
      labels:
        app: tomcat
    spec:
      containers:
      - name: tomcat
        image: ${IMAGE}
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: sample-war
          mountPath: /usr/local/tomcat/webapps/sample.war
          subPath: sample.war
      volumes:
      - name: sample-war
        configMap:
          name: sample-war-configmap
          items:
          - key: sample.war
            path: sample.war

EOF

tee "${TMPDIR}/service.yaml" <<EOF
apiVersion: v1
kind: Service
metadata:
  name: tomcat
spec:
  selector:
    app: tomcat
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
  type: ClusterIP
EOF

kubectl apply -f "${TMPDIR}/deployment.yaml" -n "${NAMESPACE}"
kubectl apply -f "${TMPDIR}/service.yaml" -n "${NAMESPACE}"

kubectl rollout status deployment/tomcat-deployment -n "${NAMESPACE}" --timeout=300s

# Pinging the tomcat.default.svc.cluster.local hostname seems to not resolve properly
TARGET_IP="$(kubectl get -o json service -n "${NAMESPACE}" | jq -rc ".items[].spec.clusterIP")"

wait-for-it "${TARGET_IP}:8080"
curl "http://${TARGET_IP}:8080/sample/" | grep -F -e "Hello, World"
