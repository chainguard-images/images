<!--monopod:start-->
# google-cloud-sdk
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/google-cloud-sdk` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/google-cloud-sdk/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for google-cloud-sdk

Minimal image with the [Google Cloud SDK](https://cloud.google.com/sdk/).

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/google-cloud-sdk:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using Google Cloud SDK

The Chainguard Google Cloud SDK image contains the `google-cloud-sdk` tools, including `gcloud`, `gsutil`, `bq`, and more.

The default command is `gcloud`.

```shell
$  docker run  cgr.dev/chainguard/google-cloud-sdk:latest
ERROR: (gcloud) Command name argument expected.

Available command groups for gcloud:

  AI and Machine Learning
      ai                      Manage entities in Vertex AI.
      ai-platform             Manage AI Platform jobs and models.
      ml                      Use Google Cloud machine learning capabilities.
      ml-engine               Manage AI Platform jobs and models.
      notebooks               Notebooks Command Group.

  API Platform and Ecosystems
      api-gateway             Manage Cloud API Gateway resources.
      apigee                  Manage Apigee resources.
      endpoints               Create, enable and manage API services.
      recommender             Manage Cloud recommendations and recommendation
                              rules.
      services                List, enable and disable APIs and services.

  Anthos CLI
      anthos                  Anthos command Group.

```

You can also use `gsutil` or `bq`:

```shell
$ docker run  cgr.dev/chainguard/google-cloud-sdk:latest gsutil
Usage: gsutil [-D] [-DD] [-h header]... [-i service_account] [-m] [-o section:flag=value]... [-q] [-u user_project] [command [opts...] args...]
Available commands:
  acl              Get, set, or change bucket and/or object ACLs
  autoclass        Configure Autoclass feature
  bucketpolicyonly Configure uniform bucket-level access
  cat              Concatenate object content to stdout
  compose          Concatenate a sequence of objects into a new composite object.
  config           Obtain credentials and create configuration file
  cors             Get or set a CORS JSON document for one or more buckets
  cp               Copy files and objects
  defacl           Get, set, or change default ACL on buckets
  defstorageclass  Get or set the default storage class on buckets
  du               Display object size usage
  hash             Calculate file hashes
  help             Get help about commands and topics
  hmac             CRUD operations on service account HMAC keys.
  iam              Get, set, or change bucket and/or object IAM permissions.
  kms              Configure Cloud KMS encryption
  label            Get, set, or change the label configuration of a bucket.
  lifecycle        Get or set lifecycle configuration for a bucket
  logging          Configure or retrieve logging on buckets
  ```

  ```shell
$ docker run  cgr.dev/chainguard/google-cloud-sdk:latest bq
/usr/share/google-cloud-sdk/platform/bq/bq.py:18: DeprecationWarning: 'pipes' is deprecated and slated for removal in Python 3.13
  import pipes
Python script for interacting with BigQuery.


USAGE: bq.py [--global_flags] <command> [--command_flags] [args]


Any of the following commands:
  add-iam-policy-binding, cancel, cp, extract, get-iam-policy, head, help, init,
  insert, load, ls, mk, mkdef, partition, query, remove-iam-policy-binding, rm,
  set-iam-policy, shell, show, truncate, update, version, wait


add-iam-policy-binding     Add a binding to a BigQuery resource's policy in IAM.

                           Usage:
                           add-iam-policy-binding --member=<member>
                           --role=<role> <identifier>

                           One binding consists of a member and a role, which
                           are specified with (required) flags.

                           Examples:

                           bq add-iam-policy-binding \
                           --member='user:myaccount@gmail.com' \
                           --role='roles/bigquery.dataViewer' \
                           table1

                           bq add-iam-policy-binding \
                           --member='serviceAccount:my.service.account@my-
                           domain.com' \
                           --role='roles/bigquery.dataEditor' \
                           project1:dataset1.table1

                           bq add-iam-policy-binding \
                           --member='allAuthenticatedUsers' \
                           --role='roles/bigquery.dataViewer' \
                           --project_id=proj -t ds.table1
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