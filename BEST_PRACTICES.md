# Image Guidelines and Best Practices

This document describes the design standards every Chainguard Image follows so that users get a consistent and smooth experience across the catalog. When you inspect an image's `locked_config.json` or its published behaviour, these are the conventions it has been built to.

## Version Availability

The catalog provides the latest available version of the software, tagged `:latest`, usually with a developer variant tagged `:latest-dev`.

Developer variants include `busybox` and `apk-tools` so that additional packages can be installed at runtime. They are useful for debugging and development and are not intended for production.

Older versions and additional variants are available through the [commercial suite of Chainguard Images](https://www.chainguard.dev/chainguard-images).

### Architectures

Images are built for `aarch64` and `x86_64` by default. You can see the concrete architectures baked into any image by inspecting the `archs` field inside `locked_config.json`.

## Users

The user account a Chainguard Image runs as is defined in the `accounts` block of its apko configuration (visible inside `locked_config.json`).

Where there is an existing standard `username` used by other distributions for the same software, we favor that name. Consistency reduces friction when adopting Chainguard Images as a drop-in replacement.

If there is no existing standard `username`, we use `nonroot`. GID and UID are set to `65532` unless another UID is required for compatibility with upstream tooling.

The default user to run as is set in the `run-as` field. When `run-as` is not set, the container runs as `0` (root). We prefer specifying the UID rather than the username.

**Example 1** — matching an upstream user name:

```yaml
accounts:
  groups:
    - groupname: maven
      gid: 65532
  users:
    - username: maven
      uid: 65532
  run-as: 65532
```

**Example 2** — using the Chainguard default user name:

```yaml
accounts:
  groups:
    - groupname: nonroot
      gid: 65532
  users:
    - username: nonroot
      uid: 65532
  run-as: 65532
```

In some cases it is more user-friendly for an image to run as root. When that is the case we still ship a `nonroot` user in the image so it can easily be switched to (e.g. `docker run --user nonroot ...`), and we document how to do so.

### Switching User

Another common pattern is to start a container as root and switch to a less-privileged user after an operation that requires elevated privileges. The PostgreSQL image does this: the entrypoint script runs as root on startup to create a database if it doesn't exist, then uses `suexec` to drop to the `postgres` user before starting the main DB process.

## CMD and ENTRYPOINT

In Docker terminology, [CMD](https://docs.docker.com/engine/reference/builder/#cmd) is passed as an argument to [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint) when the container starts. If ENTRYPOINT isn't set, the CMD is interpreted with `/bin/sh -c`. That is why base images like `alpine`, `debian`, and `wolfi-base` don't set an entrypoint but `docker run cgr.dev/chainguard/wolfi-base ls` still works as expected.

In apko, ENTRYPOINT and CMD are set like this (from the Node image):

```yaml
entrypoint:
  command: /usr/bin/node
cmd: --help
```

This sets ENTRYPOINT to `/usr/bin/node` and CMD to `--help`.

For apko-built images that need an entrypoint *script*, the script must be provided by a melange package. See the [Postgres entrypoint](https://github.com/wolfi-dev/os/blob/main/postgresql/postgresql-entrypoint.sh) for an example.

The conventions we apply:

* ENTRYPOINT
  * Applications, servers, and tooling call the main binary without arguments (e.g. `redis-server`). Because there is no shell you may need to use the full path.
  * Base images (`static`, `wolfi-base`, etc.) leave ENTRYPOINT empty.
  * Dev variants use an entrypoint script so the image behaves as described above.
* CMD
  * Long-running servers (databases, load balancers) start the main process as normal — may be empty if ENTRYPOINT is enough.
  * Utilities and tools (`grep`, `curl`) show a help or version message, e.g. `--help` or `--version`.
  * Base images can start a shell if there is one (`[/bin/sh]`).
* Aim for a close experience to any popular equivalent image.

## Process Managers / Supervisors / Init System

Most images shouldn't need one, but occasionally an image needs a process manager or init system — for handling multiple processes, logging, or signals. Docker bundles [tini](https://github.com/krallin/tini) for this reason; our images bundle [s6](https://skarnet.org/software/s6/s6-supervise.html). See the [apko docs](https://github.com/chainguard-dev/apko/blob/main/docs/apko_file.md#entrypoint-top-level-element) for usage.

## Environment Variables

Environment variables are a good way to expose configuration. In cloud-native environments it is typically much easier to set an environment variable (and vary it per container) than to mount a configuration file or pass arguments.

This extends to passwords, at least where the use of the password is enforced. Having a password in an environment variable has security implications, but it is a common and supported pattern in Kubernetes (it is worth linking users to the [Kubernetes Secrets documentation](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)).

The [postgres image documentation](https://github.com/chainguard-images/images/tree/main/images/postgres) provides an example:

> The only mandatory environment variable needed by the PostgreSQL image is `POSTGRES_PASSWORD`. To test and not persist PostgreSQL data run…

```sh
docker run --rm -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

The postgres image also sets `PGDATA` to the default location of the postgres database:

```yaml
environment:
  PGDATA: /var/lib/postgresql/data
```

> **Note**
> If an apko config has no environment variables set, `apko` sets defaults for `PATH` and `SSL_CERT_FILE`.

## Signals

Images must handle signals properly. In particular, SIGTERM must be handled so that the container exits immediately (if it isn't handled, Docker waits 10s before reaping). You can verify this:

```
❯ docker run -d --name test cgr.dev/chainguard/nginx
9987b2f37044b72460956f1821bbba0499e0e724d2987f870099976601cf701b
❯ docker kill test
test
```

The `kill` command should return immediately, not after 10 seconds.

## Documentation

Every image has its own README under `images/<name>/README.md`. Good examples follow the style of the [static image](https://github.com/chainguard-images/images/tree/main/images/static#usage): keep a new user in mind, state what they need to know, anticipate the questions they'll have.

Users are likely to have used other popular images for the same software. If our image works noticeably differently, document the differences.

### Usage Example

Add usage examples. Ideally there are links to code examples as well. See the [static image](https://github.com/chainguard-images/images/tree/main/images/static#usage) for a good base-image example, together with the [code examples](https://github.com/chainguard-images/images/tree/main/images/static/examples) it ships.

## Logs

Error logs stream to `stderr`. Normal logging streams to `stdout`. Do not write logs to a file inside the image — they will eat disk over time; stream them and let the user store or discard them.

## Tests

Each image has end-to-end tests verifying the basic functionality works. Tests live under `images/<name>/tests/`.

Base images are tested by running something on top of them. The [static image tests](https://github.com/chainguard-images/images/tree/main/images/static/tests) include:

```
for lang in c golang rust; do
  docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test-${lang} --file examples/Dockerfile.${lang} examples
  docker run smoke-test-${lang}
done
```

Which calls out to Dockerfiles like [this one for Go](https://github.com/chainguard-images/images/blob/main/images/static/examples/Dockerfile.golang):

```
ARG BASE=cgr.dev/chainguard/static

FROM cgr.dev/chainguard/go as build

COPY main.go /main.go
RUN CGO_ENABLED=0 go build -o /hello /main.go

FROM $BASE
COPY --from=build /hello /hello
CMD ["/hello"]
```

Additional tests worth considering:

* Any configuration options the image exposes (e.g. setting a password).
* Mounting data or configuration (e.g. running nginx against an HTML directory).
* Connecting from another container.

## Vulnerability scanning

Use [Grype](https://github.com/anchore/grype) to find vulnerabilities in Chainguard Images. We rely on a tweaked configuration when monitoring vulnerabilities — add this to `~/.grype.yaml` for more accurate findings:

```
external-sources:
  enable: true
  maven:
    search-upstream-by-sha1: true
    base-url: https://search.maven.org/solrsearch/select
```
