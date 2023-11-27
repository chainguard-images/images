<!--monopod:start-->
# boring-registry
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/boring-registry` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/boring-registry/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the `boring-registry` [server application](https://github.com/TierMobility/boring-registry).
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/boring-registry:latest
```
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
