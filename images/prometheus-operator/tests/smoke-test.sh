#!/bin/bash

# Define variables
MONITORING_NAMESPACE="prometheus-operator"
TEST_APP_NAMESPACE="test-app-namespace"
TEST_APP_NAME="static-metrics"
TEST_SERVICE_NAME="static-metrics"
TEST_SERVICE_PORT="9100"
PROMETHEUS_PORT=9090
RETRY_INTERVAL=5  # seconds
MAX_RETRIES=12  # 12 * 5s = 60 seconds

apk add curl jq

# Function to check if a Kubernetes resource is available with retries
check_resource() {
    local namespace=$1
    local resource_type=$2
    local label_selector=$3
    local jsonpath=$4
    local expected_value=$5
    local retries=0

    echo "Checking $resource_type status in namespace $namespace..."

    until [ "$retries" -ge "$MAX_RETRIES" ]; do
        local status=$(kubectl get $resource_type -n $namespace -l "$label_selector" -o jsonpath="$jsonpath")

        if [ "$status" == "$expected_value" ]; then
            echo "$resource_type is available in namespace $namespace."
            return 0
        fi

        retries=$((retries + 1))
        echo "Retry $retries/$MAX_RETRIES: $resource_type is not available yet. Waiting for $RETRY_INTERVAL seconds..."
        sleep $RETRY_INTERVAL
    done

    echo "Failed to confirm $resource_type availability in namespace $namespace after $retries retries."
    exit 1
}

sleep 30

# Check if Prometheus Operator deployment is successful
check_resource $MONITORING_NAMESPACE "deployment" "app.kubernetes.io/instance=prometheus-operator" "{.items[0].status.conditions[?(@.type=='Available')].status}" "True"

# Check if Prometheus is running
check_resource $MONITORING_NAMESPACE "statefulset" "app=kube-prometheus-stack-prometheus" "{.items[0].status.readyReplicas}" "1"

# Check if Alertmanager is running
check_resource $MONITORING_NAMESPACE "statefulset" "app=kube-prometheus-stack-alertmanager" "{.items[0].status.readyReplicas}" "1"

# Check if Grafana is running (if deployed)
if kubectl get deployment -n $MONITORING_NAMESPACE -l "app.kubernetes.io/name=grafana" > /dev/null 2>&1; then
    check_resource $MONITORING_NAMESPACE "deployment" "app.kubernetes.io/name=grafana" "{.items[0].status.availableReplicas}" "1"
fi

# Get the Prometheus pod name
PROMETHEUS_POD=$(kubectl get pods -n $MONITORING_NAMESPACE -l "app.kubernetes.io/name=prometheus" -o jsonpath="{.items[0].metadata.name}")
if [ -z "$PROMETHEUS_POD" ]; then
    echo "Prometheus pod is not running."
    exit 1
fi
echo "Prometheus pod is running: $PROMETHEUS_POD"

# Port forward Prometheus port to localhost
kubectl port-forward -n $MONITORING_NAMESPACE $PROMETHEUS_POD $PROMETHEUS_PORT:$PROMETHEUS_PORT &
PORT_FORWARD_PID=$!
sleep 5

# Create a ConfigMap with static metrics
echo "Creating ConfigMap with static metrics..."
cat <<EOF | kubectl apply -n $MONITORING_NAMESPACE -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: static-metrics
data:
  metrics.prom: |
    # HELP my_static_metric This is a static metric
    # TYPE my_static_metric gauge
    my_static_metric 1
EOF

# Deploy the static-metrics application using node-exporter
echo "Deploying static-metrics application..."
cat <<EOF | kubectl apply -n $MONITORING_NAMESPACE -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: $TEST_APP_NAME
  labels:
    app: $TEST_APP_NAME
spec:
  replicas: 1
  selector:
    matchLabels:
      app: $TEST_APP_NAME
  template:
    metadata:
      labels:
        app: $TEST_APP_NAME
    spec:
      containers:
      - name: $TEST_APP_NAME
        image: quay.io/prometheus/node-exporter
        args:
        - --collector.textfile.directory=/etc/node-exporter-textfile-metrics
        - --collector.disable-defaults
        - --web.disable-exporter-metrics
        - --collector.textfile
        - --web.listen-address=0.0.0.0:9100
        volumeMounts:
        - name: textfile-metrics
          mountPath: /etc/node-exporter-textfile-metrics
        ports:
          - name: metrics
            containerPort: 9100
      volumes:
      - name: textfile-metrics
        configMap:
          name: static-metrics
---
apiVersion: v1
kind: Service
metadata:
  name: $TEST_SERVICE_NAME
  labels:
    app: $TEST_APP_NAME
spec:
  selector:
    app: $TEST_APP_NAME
  ports:
  - port: $TEST_SERVICE_PORT
    targetPort: 9100
    name: metrics
EOF

# Verify the static-metrics application and service
echo "Verifying static-metrics application and service..."
kubectl get pods -n $MONITORING_NAMESPACE
kubectl get svc -n $MONITORING_NAMESPACE

# Create a ServiceMonitor for the static-metrics application
echo "Creating a ServiceMonitor for the static-metrics application..."
cat <<EOF | kubectl apply -f -
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: test-servicemonitor
  namespace: $MONITORING_NAMESPACE
  labels:
    name: test-servicemonitor
    release: prometheus-operator
spec:
  selector:
    matchLabels:
      app: $TEST_APP_NAME
  endpoints:
  - port: metrics
EOF

# Check if the ServiceMonitor is created
check_resource $MONITORING_NAMESPACE "servicemonitor" "name=test-servicemonitor" "{.items[0].metadata.name}" "test-servicemonitor"

# Debugging: Check ServiceMonitor and target discovery
echo "Debugging: ServiceMonitor and target discovery..."
kubectl get servicemonitor -n $MONITORING_NAMESPACE test-servicemonitor -o yaml
curl -s http://localhost:$PROMETHEUS_PORT/api/v1/targets | jq '.data.activeTargets'

# Check if Prometheus picks up the ServiceMonitor and starts scraping the static-metrics application
echo "Checking if Prometheus is scraping the static-metrics application metrics..."
sleep 120  # Wait for Prometheus to scrape the metrics

SCRAPED_METRICS=$(curl -s http://localhost:$PROMETHEUS_PORT/api/v1/targets | jq '.data.activeTargets[] | select(.labels.job == "'$TEST_APP_NAME'") | length')

if [ "$SCRAPED_METRICS" -gt 0 ]; then
    echo "Prometheus is successfully scraping metrics from the static-metrics application."
else
    echo "Prometheus is not scraping metrics from the static-metrics application."
    echo "Detailed target info:"
    curl -s http://localhost:$PROMETHEUS_PORT/api/v1/targets | jq '.data.activeTargets[] | select(.labels.job == "'$TEST_APP_NAME'")'
    kubectl delete --namespace $MONITORING_NAMESPACE --force --grace-period=0 pod $PROMETHEUS_POD
    kill $PORT_FORWARD_PID
    exit 1
fi

# Clean up the test resources
echo "Cleaning up the test resources..."
kubectl delete servicemonitor test-servicemonitor -n $MONITORING_NAMESPACE
kubectl delete service $TEST_SERVICE_NAME -n $MONITORING_NAMESPACE
kubectl delete deployment $TEST_APP_NAME -n $MONITORING_NAMESPACE
kubectl delete configmap static-metrics -n $MONITORING_NAMESPACE

# Kill the port-forward process
kill $PORT_FORWARD_PID

echo "All checks passed successfully."

exit 0
