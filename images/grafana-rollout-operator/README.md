<!--monopod:start-->
# grafana-rollout-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-rollout-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/grafana-rollout-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for grafana-rollout-operator

Kubernetes Rollout Operator coordinates the rollout of pods between different StatefulSets within a specific namespace, and can be used to manage multi-AZ deployments

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/grafana-rollout-operator:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

How to install via Helm only rollout operator:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
kubectl create ns grafana-rollout-operator
helm install grafana-rollout-operator garafana/rollout-operator \
    --set image.repository=cgr.dev/chainguard/grafana-rollout-operator \
    --set image.tag=latest
```

Get Daemonset count
```bash
kubectl get deploy grafana-rollout-operator -n grafana-rollout-operator
```

This works in conjencture with [mimir-distributed](https://grafana.com/docs/helm-charts/mimir-distributed/latest/get-started-helm-charts/)

Add Labels and Annotations to ingester zones
```bash
kubectl label sts mimir-ingester-zone-a grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-a grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-port=80 -n mimir

kubectl label sts mimir-ingester-zone-b grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-b grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/rollout-downscale-leader=mimir-ingester-zone-a -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-port=80 -n mimir

kubectl label sts mimir-ingester-zone-c grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-c grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/rollout-downscale-leader=mimir-ingester-zone-b -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-port=80 -n mimir
```

Check for logs
```bash
kubectl logs deployment/mimir-rollout-operator -n mimir
```

It should say something like
```bash
level=debug ts=2024-05-14T17:02:34.97299692Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-a
level=debug ts=2024-05-14T17:02:34.973309878Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-b
level=debug ts=2024-05-14T17:02:34.97338692Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-c
level=debug ts=2024-05-14T17:02:34.97363967Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-a
level=debug ts=2024-05-14T17:02:34.973721503Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-b
level=debug ts=2024-05-14T17:02:34.973819586Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-c
```


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