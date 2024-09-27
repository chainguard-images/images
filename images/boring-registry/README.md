<!--monopod:start-->
# boring-registry
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/boring-registry` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/boring-registry/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for boring-registry

Minimal image with the `boring-registry` [server application](https://github.com/TierMobility/boring-registry).

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/boring-registry:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

To run `boring-registry`:

```
$ docker run cgr.dev/chainguard/boring-registry:latest
Usage:
  boring-registry [command]

Available Commands:
  completion  Generate the autocompletion script for the specified shell
  help        Help about any command
  migrate     Migrate modules
  server      Starts the server component
  upload      Upload modules and providers
  version     Prints the version of the Boring Registry

Flags:
      --debug                                   Enable debug logging
  -h, --help                                    help for boring-registry
      --json                                    Enable json logging
      --storage-gcs-bucket string               Bucket to use when using the GCS registry type
      --storage-gcs-prefix string               Prefix to use when using the GCS registry type
      --storage-gcs-sa-email string             Google service account email to be used for Application Default Credentials (ADC).
                                                GOOGLE_APPLICATION_CREDENTIALS environment variable might be used as alternative.
                                                For GCS presigned URLs this SA needs the iam.serviceAccountTokenCreator role.
      --storage-gcs-signedurl-expiry duration   Generate GCS signed URL valid for X seconds. Only meaningful if used in combination with --gcs-signedurl (default 30s)
      --storage-s3-bucket string                S3 bucket to use for the registry
      --storage-s3-endpoint string              S3 bucket endpoint URL (required for MINIO)
      --storage-s3-pathstyle                    S3 use PathStyle (required for MINIO)
      --storage-s3-prefix string                S3 bucket prefix to use for the registry
      --storage-s3-region string                S3 bucket region to use for the registry
      --storage-s3-signedurl-expiry duration    Generate S3 signed URL valid for X seconds. Only meaningful if used in combination with --storage-s3-signedurl (default 30s)

Use "boring-registry [command] --help" for more information about a command.
```

The `server` command can be used to start the registry server:

```
# docker run cgr.dev/chainguard/boring-registry:latest server
Usage:
  boring-registry server [flags]

Flags:
      --auth-okta-claims strings               Okta claims to validate
      --auth-okta-issuer string                Okta issuer
      --auth-static-token strings              Static API token to protect the boring-registry
  -h, --help                                   help for server
      --listen-address string                  Address to listen on (default ":5601")
      --listen-telemetry-address string        Telemetry address to listen on (default ":7801")
      --login-authz string                     The server's authorization endpoint
      --login-client string                    The client_id value to use when making requests
      --login-grant-types strings              An array describing a set of OAuth 2.0 grant types (default [authz_code])
      --login-ports ints                       Inclusive range of TCP ports that Terraform may use (default [10000,10010])
      --login-scopes strings                   List of scopes
      --login-token string                     The server's token endpoint
      --storage-module-archive-format string   Archive file format for modules, specified without the leading dot (default "tar.gz")
      --tls-cert-file string                   TLS certificate to serve
      --tls-key-file string                    TLS private key to serve
Global Flags:
      --debug                                   Enable debug logging
      --json                                    Enable json logging
      --storage-gcs-bucket string               Bucket to use when using the GCS registry type
      --storage-gcs-prefix string               Prefix to use when using the GCS registry type
      --storage-gcs-sa-email string             Google service account email to be used for Application Default Credentials (ADC).
                                                GOOGLE_APPLICATION_CREDENTIALS environment variable might be used as alternative.
                                                For GCS presigned URLs this SA needs the iam.serviceAccountTokenCreator role.
      --storage-gcs-signedurl-expiry duration   Generate GCS signed URL valid for X seconds. Only meaningful if used in combination with --gcs-signedurl (default 30s)
      --storage-s3-bucket string                S3 bucket to use for the registry
      --storage-s3-endpoint string              S3 bucket endpoint URL (required for MINIO)
      --storage-s3-pathstyle                    S3 use PathStyle (required for MINIO)
      --storage-s3-prefix string                S3 bucket prefix to use for the registry
      --storage-s3-region string                S3 bucket region to use for the registry
      --storage-s3-signedurl-expiry duration    Generate S3 signed URL valid for X seconds. Only meaningful if used in combination with --storage-s3-signedurl (default 30s)

failed to setup server: please specify a valid storage provider
```

This will require specifying a storage provider and credentials to it using the appropriate flags.

## Helm

This image is a drop-in replacement for the upstream image, and can be used in their helm chart with an invocation like:

```
helm upgrade --install boring-registry oci://ghcr.io/tiermobility/charts/boring-registry \
    --set global.image.repository=cgr.dev/chainguard/boring-registry \
    --set global.image.tag="latest" \
    --wait
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