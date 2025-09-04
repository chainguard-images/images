<!--monopod:start-->
# redis
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/redis` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/redis/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for redis

Chainguard image for [Redis](https://github.com/redis/redis), an in-memory database that persists on disk. Redis is a key-value store, supporting an array of different values, including Strings, Lists, Sets, Sorted Sets, Hashes, Streams, HyperLogLogs, and Bitmaps.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/redis:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The Chainguard Redis image is comparable to [the official Redis image on Docker Hub](https://hub.docker.com/_/redis), with some important differences:

### Entrypoint Differences
- **Upstream Redis (redis:8.x)**: Uses `docker-entrypoint.sh` script as entrypoint with `redis-server` as the default command. This wrapper script provides additional functionality such as automatic configuration file handling and initialization.
- **Chainguard Redis**: Uses `/usr/bin/redis-server` directly as the entrypoint, without a wrapper script. This provides a more minimal and secure approach but requires explicit configuration file specification when needed.

### Redis Module Loading

Due to the entrypoint differences, module loading behavior differs significantly:

- **Upstream Redis**: The `docker-entrypoint.sh` script automatically scans `/usr/local/lib/redis/modules/` directory and loads all `.so` files found there using the `--loadmodule` flag when starting Redis.
- **Chainguard Redis**: Modules are not automatically loaded since the image uses the Redis server binary directly. You must explicitly load modules via command-line flags or configuration file.

**Important:** Module support in Chainguard Redis images is only available for Redis 8.0 and 8.2 releases. Other versions do not include module support.

#### Loading Modules in Chainguard Redis

**Option 1: Using command-line flags**
```sh
docker run cgr.dev/ORGANIZATION/redis --loadmodule /usr/lib/redis/modules/mymodule.so
```

**Option 2: Using a configuration file**

Create a `redis.conf` file:
```conf
# Enable dynamic module commands (Redis 7.0+)
# Required for using MODULE LOAD command at runtime
enable-module-command yes
# Alternative: restrict to local connections only
# enable-module-command local

# Load modules at startup (recommended approach)
loadmodule /usr/lib/redis/modules/rejson.so
loadmodule /usr/lib/redis/modules/redisearch.so

# Standard Redis configurations
port 6379
bind 0.0.0.0
protected-mode no
```

Mount and use the configuration:
```sh
docker run -v $(pwd)/redis.conf:/etc/redis.conf cgr.dev/ORGANIZATION/redis /etc/redis.conf
```

**Security Note:** Starting with Redis 7.0, the `MODULE` command is disabled by default. The `enable-module-command` directive must be set in the configuration file to allow dynamic module loading at runtime.

### Other Key Differences
Unlike many other Chainguard images, the Redis image includes a shell, allowing you to interact with the Redis database using the Redis command-line interface, `redis-cli`. 

By default this image runs as a non-root user named `redis` with a uid of `65532`. Typically, Redis does not have a default data directory and instead defaults to whatever the working directory is for the Redis process. The Chainguard Redis image provides a default working directory of `/data` that is writeable by the `redis` user.

### Important license update

Redis version 7.4 and subsequent releases are no longer licensed under BSD-3-Clause; instead, the Redis project has adopted a dual licensing model. This means users have the choice to adopt either the Redis Source Available License v2 (RSALv2) or the Server Side Public License v1 (SSPLv1).

Please give careful consideration to these licensing conditions when using Redis. For more details, refer to the [upstream license information](https://github.com/redis/redis/blob/unstable/LICENSE.txt).

## Getting Started

## Redis Version
This will automatically pull the image to your local system and execute the command `redis --version`:

To run the Chainguard Redis image with Docker using default configuration you could run the following command:

```sh
docker run -p 6379:6379 --rm cgr.dev/ORGANIZATION/redis
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
docker run -it --entrypoint sh cgr.dev/ORGANIZATION/redis
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
docker run -d -v $(pwd):/data -p 6379:6379 cgr.dev/ORGANIZATION/redis
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