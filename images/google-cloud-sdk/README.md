<!--monopod:start-->
# google-cloud-sdk
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/google-cloud-sdk` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/google-cloud-sdk/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the [Google Cloud SDK](https://cloud.google.com/sdk/). **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/google-cloud-sdk:latest
```
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
