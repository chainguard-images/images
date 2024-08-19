<!--monopod:start-->
# neuvector-manager
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/neuvector-manager` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/neuvector-manager/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A Wolfi-based image for NeuVector - a full lifecycle container security platform.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/neuvector-manager:latest
```
<!--getting:end-->

<!--body:start-->
## Install the Helm repository

Install the NeuVector Helm chart repository and update:

```bash
helm repo add neuvector https://neuvector.github.io/neuvector-helm/
helm repo update
```

## Generate internal certificates

Refer to NeuVector's documentation on generating internal certs [here](https://open-docs.neuvector.com/deploying/production/internal). These are
not provided out of the box as they should be changed within a production environment.

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

By default, the runtime is set to docker.

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

You're now running NeuVector with Chainguard images! Consult [NeuVector's documentation](https://open-docs.neuvector.com/) for additional configuration.
<!--body:end-->
