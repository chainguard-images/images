terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
  }
  inventory = data.imagetest_inventory.this
  mounts = [{
    source      = path.module
    destination = "/tests"
  }]
  name = "cassandra"
}

resource "imagetest_feature" "basic" {
  description = "Run Cassandra functionality tests."
  harness     = imagetest_harness_docker.docker
  name        = "Basic"
  steps = [
    {
      name = "Cassandra tests"
      cmd  = "/tests/run-tests.sh"
    }
  ]
}

module "cluster_harness" {
  cwd               = path.module
  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  source            = "../../../tflib/imagetest/harnesses/k3s/"
  target_repository = var.target_repository
}

resource "imagetest_feature" "k8s" {
  description = "Basic installation for cassandra"
  harness     = module.cluster_harness.harness
  labels = {
    type = "k8s"
  }
  name = "basic"
  steps = [
    {
      name = "Install cassandra"
      cmd  = <<EOF
kubectl apply -f - <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: cassandra
---
apiVersion: v1
kind: Service
metadata:
  name: cassandra
  namespace: cassandra
  labels:
    app: cassandra
spec:
  clusterIP: None
  selector:
    app: cassandra
  ports:
    - port: 9042
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: cassandra
  namespace: cassandra
  labels:
    app: cassandra
spec:
  serviceName: cassandra
  replicas: 1
  selector:
    matchLabels:
      app: cassandra
  template:
    metadata:
      labels:
        app: cassandra
    spec:
      containers:
      - name: cassandra
        image: ${local.parsed.registry_repo}:${local.parsed.pseudo_tag}
        ports:
        - name: intra-node
          containerPort: 7000
        - name: tls-intra-node
          containerPort: 7001
        - name: jmx
          containerPort: 7199
        - name: cql
          containerPort: 9042
        env:
        - name: MAX_HEAP_SIZE
          value: "512M"
        - name: HEAP_NEWSIZE
          value: "100M"
        - name: CASSANDRA_SEEDS
          value: "cassandra-0.cassandra.default.svc.cluster.local"
        - name: CASSANDRA_CLUSTER_NAME
          value: "K8Demo"
        - name: CASSANDRA_DC
          value: "DC1-K8Demo"
        - name: CASSANDRA_RACK
          value: "Rack1-K8Demo"
        - name: POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        resources:
          limits:
            cpu: "500m"
            memory: "1Gi"
          requests:
            cpu: "500m"
            memory: "1Gi"
        volumeMounts:
        - name: cassandra-data
          mountPath: /cassandra_data
        lifecycle:
          preStop:
            exec:
              command: ["/bin/sh", "-c", "nodetool drain"]
        imagePullPolicy: Always
        securityContext:
          capabilities:
            add: ["IPC_LOCK"]
      terminationGracePeriodSeconds: 1800
  volumeClaimTemplates:
  - metadata:
      name: cassandra-data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 1Gi
---
apiVersion: batch/v1
kind: Job
metadata:
  name: cassandra-validation
  namespace: cassandra
spec:
  template:
    spec:
      containers:
      - name: cassandra-client
        image: cgr.dev/chainguard/cassandra:latest
        command: ["sh", "-c"]
        args:
          - |
            echo "Running Cassandra validation...";
            cqlsh cassandra.cassandra.svc.cluster.local -e "DESCRIBE KEYSPACES";
            if [ $? -eq 0 ]; then
              echo "Cassandra cluster is up and responding.";
              exit 0;
            else
              echo "Cassandra cluster is not responding.";
              exit 1;
            fi
      restartPolicy: Never
  backoffLimit: 4
YAML

      EOF
    },
    {
      name  = "Wait"
      cmd   = <<EOF
kubectl wait --for=condition=ready pod -l app=cassandra -n cassandra --timeout=300s
kubectl wait --for=condition=complete job/cassandra-validation -n cassandra --timeout=300s
      EOF
      retry = { attempts = 3, delay = "10s" } # Just a retry for resources to register, rest is handled by kubectl
    },
  ]
  timeouts = {
    create = "30m"
  }
}

