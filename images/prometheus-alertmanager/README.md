<!--monopod:start-->
# prometheus-alertmanager
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-alertmanager` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/prometheus-alertmanager/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for prometheus-alertmanager

Minimalist Wolfi-based image for Prometheus Alertmanager. Handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing to the correct receiver.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/prometheus-alertmanager:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage
For full instructions on prometheus-alertmanager, refer to the
[official documentation](https://prometheus.io/docs/alerting/latest/alertmanager).
The GitHub repository can also be [found here](https://github.com/prometheus/alertmanager).

### Default config settings
The upstream docker image, overrides some of the default values for
alertmanager, for example, [see here](https://github.com/prometheus/alertmanager/blob/main/Dockerfile#L20).
We replicate the same behaviour in the chainguard image to provide parity with
the upstream image.

### Helm
To deploy via helm, please refer to the upstream
[helm charts documentation](https://github.com/prometheus-community/helm-charts)
for comprehensive instructions, which includes
[supported parameters](https://github.com/prometheus-community/helm-charts/blob/main/charts/alertmanager/values.yaml).

Below is an example of how to use the helm chart, overriding the image with the
chainguard image:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install prom-alertmanager prometheus-community/alertmanager \
 --set image.repository=cgr.dev/chainguard/prometheus-alertmanager \
 --set image.tag=latest
```

The [upstream helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/alertmanager)
provides some default `config:` values, but if you intend to deploy with
additional configuration, i.e defining routes and receivers, you'll need to
create your own custom values.yaml and pass this into the chart at deployment.

### Docker

#### Create config file
Before running the container, you'll need to create a configuration file. This
contains all the necessary configurations for Alertmanager, such as alerting
routes, receivers, and integrations.

Refer to the [official documentation](https://prometheus.io/docs/alerting/latest/alertmanager)
for more information. Below is a simple example:

```yaml
# Save this as 'alertmanager.yml')
global:
  resolve_timeout: 11m
  pagerduty_url: https://example-pagerduty.com/v2/test
route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10m
  repeat_interval: 1h
receivers:
  - name: 'example-webhook'
    webhook_configs:
    - url: 'http://example.com/hook'
```

In order to ensure the 'nonroot' container user can access the file when
volume mounted (below step), ensure you've set read-only permissions:

```bash
chmod 400 alertmanager.ym
```

#### Run container

> **IMPORTANT**: Prometheus looks for a file mounted as 'alertmanager.yml' (i.e not .yaml).

```bash
# TODO: Update '$(pwd)/alertmanager.yml' accordingly to reference your locally
# created config file.
docker run -p 9093:9093 \
  -v $(pwd)/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
  --name alertmanager \
  cgr.dev/chainguard/prometheus-alertmanager:latest
```

Verify that Alertmanager is running correctly by accessing http://localhost:9093
on your browser.

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