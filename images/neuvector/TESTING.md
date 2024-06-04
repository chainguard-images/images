# Testing NeuVector

## Create a cluster

Before testing, you'll need to create or provision a cluster for NeuVector. I.E., for kind:

```bash
kind create cluster
```

## Install the Helm repository

Install the NeuVector Helm chart repository and update:

```bash
helm repo add neuvector https://neuvector.github.io/neuvector-helm/
helm repo update
```

## Generate internal certs

Either use NeuVector's documentation on generating internal certs [here](https://open-docs.neuvector.com/deploying/production/internal) or fetch the certs
used by NeuVector directly:

```bash
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/ca.cert -o ca.cert
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/cert.key -o cert.key
curl https://raw.githubusercontent.com/neuvector/manifests/main/build/share/etc/neuvector/certs/internal/cert.pem -o cert.pem
```

Create a namespace for NeuVector:

```bash
kubectl create ns neuvector
```

Create a secret with the internal certs:

```bash
kubectl create secret generic internal-cert -n neuvector --from-file=cert.key --from-file=cert.pem --from-file=ca.cert
```

## Deploy CRD

Deploy the custom resource definition:

```bash
helm install core neuvector/crd -n neuvector
```

## Deploy core

Deploy NeuVector core:

```bash
helm install core neuvector/core -n neuvector \
  --set registry=cgr.dev \
  \
  --set controller.image.repository=chainguard/neuvector-controller \
  --set controller.internal.certificate.secret=internal-cert \
  --set controller.internal.certificate.keyFile=cert.key \
  --set controller.internal.certificate.pemFile=cert.pem \
  --set controller.internal.certificate.caFile=ca.cert \
  \
  --set enforcer.image.repository=chainguard/neuvector-enforcer \
  --set enforcer.internal.certificate.secret=internal-cert \
  --set enforcer.internal.certificate.keyFile=cert.key \
  --set enforcer.internal.certificate.pemFile=cert.pem \
  --set enforcer.internal.certificate.caFile=ca.cert \
  \
  --set manager.image.repository=chainguard/neuvector-manager \
  \
  --set cve.scanner.image.registry=cgr.dev \
  --set cve.scanner.image.repository=chainguard/neuvector-scanner \
  --set cve.scanner.internal.certificate.secret=internal-cert \
  --set cve.scanner.internal.certificate.keyFile=cert.key \
  --set cve.scanner.internal.certificate.pemFile=cert.pem \
  --set cve.scanner.internal.certificate.caFile=ca.cert \
  \
  --set cve.updater.image.registry=cgr.dev \
  --set cve.updater.image.repository=chainguard/neuvector-updater \
  \
  --set crdwebhook.enabled=false
```

Note that the container runtime will need to be changed depending on where NeuVector is deployed.
For example, for k3s we would set:

```bash
  --set k3s.enabled=true \
  --set k3s.runtimePath=/run/k3s/containerd/containerd.sock
```

The `*.internal.certificate.*` entries can all be removed except for `*.internal.certificate.secret`
if using the default values of `keyFile=tls.key`, `pemFile=tls.pem`, and `caFile=ca.crt`.

## Deploy monitor

Deploy the monitor chart with prometheus exporter:

```bash
helm install monitor neuvector/monitor -n neuvector \
  --set registry=cgr.dev \
  --set exporter.apiSvc=neuvector-svc-controller:10443 \
  --set exporter.image.repository=chainguard/neuvector-prometheus-exporter
```

The API service is changed as by default it points to a non-existant `neuvector-svc-controller-api` service.

## Evaluating NeuVector

NeuVector provides documentation on testing and evaluating a NeuVector deployment found [here](https://open-docs.neuvector.com/testing/testing).

Do note that the only deployment actually used in these tests is `nodejs`. We suggest deploying an up to date version of `node` like this:

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: node
  namespace: $NAMESPACE
spec:
  ports:
  - port: $NODE_PORT
    protocol: TCP
    name: "cluster-tcp-$NODE_PORT"
  clusterIP: None
  selector:
    app: node-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-pod
  namespace: node
spec:
  selector:
    matchLabels:
      app: node-pod
  replicas: 3
  template:
    metadata:
      labels:
        app: node-pod
    spec:
      containers:
      - name: node-pod
        image: $NODE_IMAGE
        command: ["node", "-e", "require('http').createServer((req, res) => res.end('Hello World')).listen(8888)"]
EOF
```

After `node` has been deployed, we can generate violations:

```bash
kubectl exec node-pod curl www.google.com -n node
```

Grab the IP of another `nodejs` pod and then simulate an attack:

```bash
kubectl exec -it node-pod -n node -- ping <nodejs pod ip> -s 40000
```

Just about any network activity from any pod will generate violations that can be used in NeuVector.

Now that we've generated some violations, we can forward the port used by the web UI:

```bash
kubectl port-forward service/neuvector-service-webui -n neuvector 8443:8443
```

The web UI will be accessible over [localhost:8443](https://localhost:8443).

The default username and password is `admin`. Here, you can change NeuVector from monitor mode to protect
mode, quarantine other deployments, scan registries, etc.
