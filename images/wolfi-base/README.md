<!--monopod:start-->
# wolfi-base
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wolfi-base` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/wolfi-base/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for wolfi-base

Base image for the [Wolfi Linux Distribution](https://wolfi.dev).

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/wolfi-base:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
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

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._