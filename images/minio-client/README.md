<!--monopod:start-->
# minio-client
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/minio-client` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/minio-client/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the Minio Client. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/minio-client:latest
```

## Using Minio

The Chainguard Minio Client image contains the `mc` client binary.
The default entrypoint just runs the `mc` binary without any flags.

```shell
$ docker run cgr.dev/chainguard/mc
NAME:
  mc - MinIO Client for object storage and filesystems.

USAGE:
  mc [FLAGS] COMMAND [COMMAND FLAGS | -h] [ARGUMENTS...]

COMMANDS:
  alias      manage server credentials in configuration file
  ls         list buckets and objects
  mb         make a bucket
  rb         remove a bucket
  cp         copy objects
  mv         move objects
  rm         remove object(s)
  mirror     synchronize object(s) to a remote site
  cat        display object contents
  head       display first 'n' lines of an object
  pipe       stream STDIN to an object
  find       search for objects
  sql        run sql queries on objects
  stat       show object metadata
  tree       list buckets and objects in a tree format
  du         summarize disk usage recursively
  retention  set retention for object(s)
  legalhold  manage legal hold for object(s)
  support    support related commands
  license    license related commands
  share      generate URL for temporary access to an object
  version    manage bucket versioning
  ilm        manage bucket lifecycle
  quota      manage bucket quota
  encrypt    manage bucket encryption config
  event      manage object notifications
  watch      listen for object notification events
  undo       undo PUT/DELETE operations
  anonymous  manage anonymous access to buckets and objects
  tag        manage tags for bucket and object(s)
  diff       list differences in object name, size, and date between two buckets
  replicate  configure server side bucket replication
  admin      manage MinIO servers
  update     update mc to latest release
  ready      checks if the cluster is ready or not
  ping       perform liveness check
  od         measure single stream upload and download
  batch      manage batch jobs
```
