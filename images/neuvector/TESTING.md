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

Either use NeuVector's documentation on generating internal certs [here](https://open-docs.neuvector.com/deploying/production/internal) or
generate them yourself with OpenSSL. To do so, you'll need an OpenSSL
configuration file:

```bash
cat > san.cnf << EOF
[ req ]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[ req_distinguished_name ]
CN = NeuVector

[ v3_req ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
EOF
```

Now, generate the certs:

```bash
openssl genrsa -out ca.key 2048
openssl req -x509 -sha256 -new -nodes -key ca.key -days 3650 -out ca.crt -subj "/CN=localhost"
openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -sha256 -out cert.csr -config san.cnf -batch
openssl x509 -req -sha256 -in cert.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out tls.crt -days 3650 -extensions v3_req -extfile san.cnf
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

Do note that the only deployment actually used in these tests is `nodejs`. We suggest deploying Wolfi like this:

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: wolfi
  namespace: wolfi
spec:
  ports:
  - port: <WOLFI PORT>
    protocol: TCP
    name: "cluster-tcp-<WOLFI PORT>"
  clusterIP: None
  selector:
    app: wolfi-pod

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wolfi-pod
  namespace: wolfi
spec:
  selector:
    matchLabels:
      app: wolfi-pod
  replicas: 2
  template:
    metadata:
      labels:
        app: wolfi-pod
    spec:
      containers:
      - name: wolfi-pod
        image: cgr.dev/chainguard/curl:latest-dev
        command: ["sleep", "infinity"]
        securityContext:
          runAsUser: 0   
          runAsGroup: 0
EOF
```

After Wolfi has been deployed, we can generate violations:

```bash
kubectl exec wolfi-pod curl www.google.com -n wolfi
```

Grab the IP of another Wolfi pod and then simulate an attack:

```bash
kubectl exec -it wolfi-pod -n wolfi -- ping <wolfi pod ip> -s 40000
```

Just about any network activity from any pod will generate violations that can be used in NeuVector.

Now that we've generated some violations, we can forward the port used by the web UI:

```bash
kubectl port-forward service/neuvector-service-webui -n neuvector 8443:8443
```

The web UI will be accessible over [localhost:8443](https://localhost:8443).

The default username and password is `admin`. Here, you can change NeuVector from monitor mode to protect
mode, quarantine other deployments, scan registries, etc.
