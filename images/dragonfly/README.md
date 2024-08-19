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
Dragonfly database: A modern replacement for Redis and Memcached

<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dragonfly:latest
```
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
