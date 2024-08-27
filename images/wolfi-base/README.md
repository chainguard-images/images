<!--monopod:start-->
# wolfi-base
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wolfi-base` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/wolfi-base/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Base image for the [Wolfi Linux Distribution](https://wolfi.dev).
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The Chainguard `wolfi-base` Image includes a shell and package manager. The Image will start in a shell by default:

```sh
docker run -it cgr.dev/chainguard/wolfi-base
```
```
6d38c9b4f0d9:/#
```

You can run commands from within the shell like this, or you can run commands directly on your local machine without opening a shell:

```sh
docker run cgr.dev/chainguard/wolfi-base ps
```
```
PID   USER     TIME  COMMAND
    1 root      0:00 ps
```

This Image is commonly used in Dockerfiles, as in the following example:

```
FROM cgr.dev/chainguard/wolfi-base

RUN apk update && apk add redis

ENTRYPOINT ["/usr/bin/redis-server"]
```

This example Dockerfile will update `apk` and install the Redis server onto the base Image. 

You could use a Dockerfile like this to build a new image:

```sh
docker build -t myredis --progress plain --no-cache .
```
```
#0 building with "desktop-linux" instance using docker driver

#1 [internal] load .dockerignore
#1 transferring context: 656B done
#1 DONE 0.0s

#2 [internal] load build definition from Dockerfile
#2 transferring dockerfile: 144B done
#2 DONE 0.0s

#3 [internal] load metadata for cgr.dev/chainguard/wolfi-base:latest
#3 DONE 0.0s

#4 [1/2] FROM cgr.dev/chainguard/wolfi-base
#4 CACHED

#5 [2/2] RUN apk update && apk add redis
#5 0.104 fetch https://packages.wolfi.dev/os/aarch64/APKINDEX.tar.gz
#5 0.702  [https://packages.wolfi.dev/os]
#5 0.702 OK: 14620 distinct packages available
#5 0.750 (1/1) Installing redis (7.2.0-r0)
#5 1.207 OK: 15 MiB in 15 packages
#5 DONE 1.2s

#6 exporting to image
#6 exporting layers 0.0s done
#6 writing image sha256:bde1c89d952e0e0155acb410ee8143b1daf542bd36a6b22c032250633d08bf76 done
#6 naming to docker.io/library/myredis done
#6 DONE 0.0s
```

Following that, you can run the new image built from the `wolfi-base` Image.

```
docker run myredis
```

## Further Reading

To learn more, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev) which contains extensive documentation on [getting started with Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview/).
<!--body:end-->
