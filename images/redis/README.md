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

Chainguard image for [Redis](https://github.com/redis/redis), an in-memory database that persists on disk. Redis is a key-value store, supporting an array of different values, including Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, and Bitmaps.

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
## Compatibility Notes

The Chainguard Redis image is comparable to [the official Redis image on Docker Hub](https://hub.docker.com/_/redis). 

Unlike many other Chainguard images, the Redis image includes a shell, allowing you to interact with the Redis database using the Redis command-line interface, `redis-cli`. 

By default this image runs as a non-root user named `redis` with a uid of `65532`. Typically, Redis does not have a default data directory and instead defaults to whatever the working directory is for the Redis process. The Chainguard Redis image provides a default working directory of `/data` that is writeable by the `redis` user.

### Important license update

Redis version 7.4 and subsequent releases are no longer licensed under BSD-3-Clause; instead, the Redis project has adopted a dual licensing model. This means users have the choice to adopt either the Redis Source Available License v2 (RSALv2) or the Server Side Public License v1 (SSPLv1).

Please give careful consideration to these licensing conditions when using Redis. For more details, refer to the [upstream license information](https://github.com/redis/redis/blob/unstable/LICENSE.txt).

## Getting Started

To run the Chainguard Redis image with Docker using default configuration you could run the following command:

```sh
docker run -p 6379:6379 --rm cgr.dev/chainguard/redis
```

This command forwards port `6379` (the default port for Redis) on the host machine to port `6379` on the container:

```
1:C 25 Oct 2024 17:12:32.419 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 25 Oct 2024 17:12:32.419 * Redis version=7.4.1, bits=64, commit=74b289a0, modified=1, pid=1, just started
1:C 25 Oct 2024 17:12:32.419 # Warning: no config file specified, using the default config. In order to specify a config file use /usr/bin/redis-server /path/to/redis.conf
1:M 25 Oct 2024 17:12:32.420 * monotonic clock: POSIX clock_gettime
1:M 25 Oct 2024 17:12:32.420 * Running mode=standalone, port=6379.
1:M 25 Oct 2024 17:12:32.421 * Server initialized
1:M 25 Oct 2024 17:12:32.421 * Ready to accept connections tcp
```

Following that, you can open another terminal and use `redis-cli` locally. Any commands you run through it will be forwarded to the `redis` process in the container:

```
$ redis-cli set test 10
OK
$ redis-cli get test
"10"
$ redis-cli
127.0.0.1:6379>
```

Alternatively, to test out Redis within the container, you can run the following command to access the container's shell:

```sh
docker run -it --entrypoint sh cgr.dev/chainguard/redis
```

Then run the `redis-server` command to start the `redis` process, and include the `--daemonize yes` option to prevent it from taking over the terminal:

```
/data $ redis-server --daemonize yes
```

Following that, you can run `redis-cli`, the Redis command-line interface, and begin testing the database:

```
/data $ redis-cli
127.0.0.1:6379> set test 20
OK
127.0.0.1:6379> get test
"20"
```

## Configuration

If you supply a different configuration file or change the user, UID, or `WORKDIR` instruction, you'll need to ensure the user running the `redis` process has permissions to access the relevant `redis.conf` and `dumb.rb` files.

When running in Docker using a volume, the Chainguard Redis image will automatically use a custom configuration instead of the default one. Here's an example that mounts a host volume containing a custom Redis configuration to the `/data` directory in the container:

```sh
docker run -d -v $(pwd):/data -p 6379:6379 cgr.dev/chainguard/redis
```

Again, this example forwards the local port `6379` to the container's port `6379`, the `redis` process's default port. 

Following that, you can run `redis-cli` commands from your local machine which are then forwarded to the container:

```
$ redis-cli set foo bar
OK
$ redis-cli get foo
"bar"
```

You can also open the `redis-cli` prompt locally and forward commands to the container from there:

```
$ redis-cli
127.0.0.1:6379> get foo
"bar"
```

## Documentation and Resources

* [Official Redis Documentation](https://redis.io/docs/latest/)
* (eBook) [How To Manage a Redis Database](https://www.digitalocean.com/community/books/how-to-manage-a-redis-database-ebook)
* (Tutorial) [How to Port a Sample Application to Chainguard Images](https://edu.chainguard.dev/chainguard/migration/porting-apps-to-chainguard/) — this article works through porting a small but complete application (built on NodeJS and Redis) to use Chainguard Images
* [Vulnerability Comparison: redis](https://edu.chainguard.dev/chainguard/chainguard-images/vuln-comparison/redis/) 
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