<!--monopod:start-->
# redis
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/redis` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/redis/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based [Redis](https://github.com/redis/redis) image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/redis:latest
```
<!--getting:end-->

<!--body:start-->
Minimalist Wolfi-based [Redis](https://github.com/redis/redis) image.

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
