<!--monopod:start-->
# meilisearch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/meilisearch` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/meilisearch/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal meilisearch image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/meilisearch:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The image specifies a default non-root `meilisearch` user (UID 999), and a data and dump directory at `/var/data.ms`, owned by that `meilisearch` user, accessible to all users.
<!--compatibility:end-->

<!--body:start-->
## Usage Example

Run a meilisearch container with the following command:

```
docker run \
  --rm \
  -d \
  -p 7700:7700 \
  cgr.dev/chainguard/meilisearch:latest \
  --db-path /var/data.ms
  --dump-dir /var/data.ms/dumps \
  --http-addr 0.0.0.0:7700
```

Then you can follow the [meilisearch quick start guide](https://www.meilisearch.com/docs/learn/getting_started/quick_start#add-documents) and start adding documents.
<!--body:end-->
