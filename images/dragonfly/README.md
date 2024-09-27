<!--monopod:start-->
# dragonfly
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dragonfly` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/dragonfly/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for dragonfly

Dragonfly database: A modern replacement for Redis and Memcached


Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/dragonfly:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Running dragonfly
The dragonfly image can be run directly with:

```
docker run cgr.dev/chainguard/dragonfly
init.cc:70] dragonfly running in opt mode.
I20240324 20:31:24.752246     1 dfly_main.cc:627] Starting dragonfly df-dev-0000000
* Logs will be written to the first available of the following paths:
/tmp/dragonfly.*
./dragonfly.*
* For the available flags type dragonfly [--help | --helpfull]
* Documentation can be found at: https://www.dragonflydb.io/docs
W20240324 20:31:24.752985     1 dfly_main.cc:666] SWAP is enabled. Consider disabling it when running Dragonfly.
I20240324 20:31:24.753018     1 dfly_main.cc:671] maxmemory has not been specified. Deciding myself....
I20240324 20:31:24.753022     1 dfly_main.cc:680] Found 15.28GiB available memory. Setting maxmemory to 12.23GiB
I20240324 20:31:24.753651     8 uring_proactor.cc:172] IORing with 1024 entries, allocated 102464 bytes, cq_entries is 2048
I20240324 20:31:24.758664     1 proactor_pool.cc:146] Running 8 io threads
I20240324 20:31:24.767096     1 server_family.cc:665] Host OS: Linux 6.6.16-linuxkit aarch64 with 8 threads
I20240324 20:31:24.770040     1 snapshot_storage.cc:108] Load snapshot: Searching for snapshot in directory: "/"
W20240324 20:31:24.770195     1 server_family.cc:758] Load snapshot: No snapshot found
I20240324 20:31:24.772178     9 listener_interface.cc:101] sock[19] AcceptServer - listening on port 6379
```

### Using Helm charts

As a place to get started, you may also use [this Helm chart](https://www.dragonflydb.io/docs/getting-started/kubernetes) to get dragonfly running:

```
helm upgrade --install dragonfly oci://ghcr.io/dragonflydb/dragonfly/helm/dragonfly --version v1.15.1 \
    --set image.repository=cgr.dev/chainguard/dragonfly
    -- set image.tag=latest
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