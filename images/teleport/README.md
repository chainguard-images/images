<!--monopod:start-->
# teleport
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/teleport` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/teleport/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for teleport

Teleport is an access management platform designed to provide secure and unified access to various infrastructure resources such as SSH, Kubernetes clusters, databases, and web applications

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/teleport:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage

There are several ways of installing and configuring Teleport. To access the whole available installation methods and configurations, visit the [Teleport Installation documentation](https://goteleport.com/docs/installation/).

For example this guide shows how to run Teleport in a Docker container: https://goteleport.com/docs/installation/#example-of-running-a-teleport-container

1. Run teleport configure from the Teleport container to generate a configuration file. This sets the container's name to localhost so your browser can trust the Proxy Service's self-signed TLS certificate:

```bash
docker run --hostname localhost --rm \
  --entrypoint=/usr/local/bin/teleport \
  cgr.dev/chainguard/teleport:latest configure --roles=proxy,auth > ~/teleport/config/teleport.yaml
```

2. Start the Teleport container:

```bash
docker run --hostname localhost --name teleport \
  -v ~/teleport/config:/etc/teleport \
  -v ~/teleport/data:/var/lib/teleport \
  -p 3025:3025 -p 3080:3080 \
  cgr.dev/chainguard/teleport:latest
```

3. From there, open another terminal and make sure your Teleport container's web API is functioning as intended:

```bash
curl --insecure https://localhost:3080/webapi/ping
```

You should see JSON output similar to the following:

```json
{
  "auth": {
    "type": "local",
    "second_factor": "otp",
    "preferred_local_mfa": "otp",
    "local": {
      "name": ""
    },
    "private_key_policy": "none",
    "device_trust_disabled": true,
    "has_motd": false
  },
  "proxy": {
    "kube": {
      "enabled": true,
      "listen_addr": "0.0.0.0:3080"
    },
    "ssh": {
      "listen_addr": "0.0.0.0:3080",
      "tunnel_listen_addr": "0.0.0.0:3080",
      "web_listen_addr": "0.0.0.0:3080"
    },
    "db": {
      "postgres_listen_addr": "0.0.0.0:3080",
      "mysql_listen_addr": "0.0.0.0:3080"
    },
    "tls_routing_enabled": true
  },
  "server_version": "12.1.5",
  "min_client_version": "11.0.0",
  "cluster_name": "localhost",
  "automatic_upgrades": false
}
```

Also you could install Teleport on Kubernetes using Helm. For more information, visit the [Teleport Helm Chart documentation](https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/).

All you need to do is to add the Helm repository and install the Teleport Helm chart:

```bash
helm repo add teleport https://charts.releases.teleport.dev
helm repo update
```

Then install the Teleport Helm chart:

```bash
helm install teleport-cluster teleport/teleport-cluster \
  --create-namespace \
  --version 15.4.0 \
  --set image=cgr.dev/chainguard/teleport
```

> Note: As Chainguard provides only :latest tag for public images you cannot use the :latest tag for `teleportVersionOverride` variable as its only accepts semver type of version number. 
> Due to that limitation you should clone this image with semver tag and use it in the helm install command.
> https://github.com/gravitational/teleport/blob/1e92d5e90223fc69ca75d00da4c350808dc56c2a/examples/chart/teleport-cluster/charts/teleport-operator/templates/_helpers.tpl#L38-L40
> Or you could use helm --version X for Teleport version.

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