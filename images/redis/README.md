<!--monopod:start-->
# redis
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/redis` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/redis/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for redis

Minimalist Wolfi-based [Redis](https://github.com/redis/redis) image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/redis:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Important - license update

Redis version 7.4 and subsequent releases are no longer licensed under
BSD-3-Clause. A dual licensing model has been adopted, of which users have the
choice to adopt either RSALv2 or SSPLv1.

Please give careful consideration to the licensing conditions when consuming
redis. For more information, refer to the [upstream license information](https://github.com/redis/redis/blob/unstable/LICENSE.txt).

## Overview

Redis is an in-memory database that persists on disk.

The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/redis)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/redis/provenance_info/)

## Image Variants

Our `latest` tag use the most recent build of the [Wolfi Redis](https://github.com/wolfi-dev/os/blob/main/redis.yaml) package.
The `latest` tagged variant is a distroless image for running Redis.

## Redis Version
This will automatically pull the image to your local system and execute the command `redis --version`:

```shell
docker run --rm cgr.dev/chainguard/redis --version
```

You should see output similar to this:

```
Redis server v=7.0.8 sha=00000000:0 malloc=libc bits=64 build=736cb94cbb0b299
```

## Using Redis

The default redis port is 6379.
To run with Docker using default configuration:

```sh
docker run -p 6379:6379 --rm cgr.dev/chainguard/redis
1:C 27 Dec 2022 16:42:20.647 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 27 Dec 2022 16:42:20.647 # Redis version=7.0.7, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 27 Dec 2022 16:42:20.647 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 27 Dec 2022 16:42:20.648 * monotonic clock: POSIX clock_gettime
1:M 27 Dec 2022 16:42:20.648 * Running mode=standalone, port=6379.
1:M 27 Dec 2022 16:42:20.648 # Server initialized
1:M 27 Dec 2022 16:42:20.650 * Ready to accept connections
```

## Users and Directories

By default this image runs as a non-root user named `redis` with a uid of 65532.
Redis does not have a default data directory, it defaults to whatever the working directory is for the process.
We provide a default `WORKDIR` of `/data` that is writeable by the `redis` user.

If you supply a different configuration file or change the user, UID, or `WORKDIR`, you'll need to ensure the user running the redis
process has permissions to write to that directory.

When running in Docker using a volume, that should also be taken care of automatically.
Here's an example of using a host volume:

```
% docker run -d -v $(pwd):/data -p 6379:6379 redis
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ redis-cli set foo bar
OK
$ redis-cli save
OK
$ redis-cli get foo
"bar"
$ docker kill d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ docker run -d -v $(pwd):/data -p 6379:6379 redis
29845f88b862d8e337cf8183e8fb6ac1bd9b43c4ec2de37111bfe08b227e1caa
$ redis-cli get foo
"bar"
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