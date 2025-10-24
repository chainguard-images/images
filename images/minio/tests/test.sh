#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

kubectl apply -f 100-namespace.yaml
kubectl apply -f 200-configmap.yaml
kubectl apply -f 200-secret.yaml

sed "s|MINIO_IMAGE|$MINIO_IMAGE|g" 300-deploy.yaml | kubectl apply -f -
kubectl apply -f 300-service.yaml

for i in {1..5}; do
	kubectl wait --for=condition=ready --timeout=30s \
		pod -n minio -l app=minio && s=0 && break
	s=$?
	sleep 15
done

if [ $s -ne 0 ]; then
	exit $s
fi

sed "s|MC_IMAGE|$MC_IMAGE|g" 400-job.yaml | kubectl apply -f -

for i in {1..5}; do
	kubectl wait --for=condition=complete --timeout=30s \
		job -n minio test && s=0 && break
	s=$?
	sleep 15
done

if [ $s -ne 0 ]; then
	exit $s
fi
