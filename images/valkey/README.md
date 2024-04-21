<!--monopod:start-->
# valkey
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/valkey` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/valkey/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based [Valkey](https://github.com/valkey-io/valkey) image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/valkey:latest
```
<!--getting:end-->

<!--body:start-->
Valkey is an in-memory database that persists on disk.
Valkey was originally part of the Redis project, but Redis forked to re-license as BUSL.
Valkey continues on as BSD-3-Clause.

The data model is key-value, but many different kind of values are supported: Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, Bitmaps.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/valkey)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/valkey/provenance_info/)

## Image Variants

Our `latest` tag use the most recent build of the [Wolfi Valkey](https://github.com/wolfi-dev/os/blob/main/valkey.yaml) package.
The `latest` tagged variant is a distroless image for running Valkey.

## Valkey Version
This will automatically pull the image to your local system and execute the command `valkey --version`:

```shell
docker run --rm cgr.dev/chainguard/valkey --version
```

You should see output similar to this:

```
Valkey server v=7.0.8 sha=00000000:0 malloc=libc bits=64 build=736cb94cbb0b299
```

## Using Valkey

The default valkey port is 6379.
To run with Docker using default configuration:

```sh
docker run -p 6379:6379 --rm cgr.dev/chainguard/valkey
1:C 27 Dec 2022 16:42:20.647 # oO0OoO0OoO0Oo Valkey is starting oO0OoO0OoO0Oo
1:C 27 Dec 2022 16:42:20.647 # Valkey version=7.0.7, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 27 Dec 2022 16:42:20.647 # Warning: no config file specified, using the default config. In order to specify a config file use valkey-server /path/to/valkey.conf
1:M 27 Dec 2022 16:42:20.648 * monotonic clock: POSIX clock_gettime
1:M 27 Dec 2022 16:42:20.648 * Running mode=standalone, port=6379.
1:M 27 Dec 2022 16:42:20.648 # Server initialized
1:M 27 Dec 2022 16:42:20.650 * Ready to accept connections
```

## Users and Directories

By default this image runs as a non-root user named `valkey` with a uid of 65532.
Valkey does not have a default data directory, it defaults to whatever the working directory is for the process.
We provide a default `WORKDIR` of `/data` that is writeable by the `valkey` user.

If you supply a different configuration file or change the user, UID, or `WORKDIR`, you'll need to ensure the user running the valkey
process has permissions to write to that directory.

When running in Docker using a volume, that should also be taken care of automatically.
Here's an example of using a host volume:

```
% docker run -d -v $(pwd):/data -p 6379:6379 cgr.dev/chainguard/valkey
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ valkey-cli set foo bar
OK
$ valkey-cli save
OK
$ valkey-cli get foo
"bar"
$ docker kill d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
d029bfb291c7a00618342ab26702dc3788cfda24b85208de04464ccb06681797
$ docker run -d -v $(pwd):/data -p 6379:6379 valkey
29845f88b862d8e337cf8183e8fb6ac1bd9b43c4ec2de37111bfe08b227e1caa
$ valkey-cli get foo
"bar"
```
<!--body:end-->
