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
# Chainguard Image for neuvector-manager

A Wolfi-based image for NeuVector - a full lifecycle container security platform.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/neuvector-manager:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.