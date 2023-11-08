# Image Guidelines and Best Practices

This document describes the standards expected for Chainguard images in order to provide users with
a consistent and smooth experience. New images must meet these standards or document why they deviate.

Many of these guidelines are marked as requirements in the new image PR checklist, and may be enforced by tests that block merging a PR.
Code reviewers should also check for this behavior.

## Sending a Pull Request

We have a number of automated checks that must pass before a pull request is merged.

Commits must be signed with either [Gitsign](https://github.com/sigstore/gitsign) or with regular [gpg signing](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits). For new images, you'll also need to run the included `monopod` tool to "fix" the image README file. This will lint the file and add a default header with relevant links.

To install monopod:

```
go install ./monopod
```

- Running monopod for README checks - this must be executed from the root of the project:

```
monopod readme
```

## Version Availability

Our policy is to provide the latest available version of the software, tagged `:latest`, usually with a developer variant tagged `:latest-dev`.

Developer variants include `busybox` and `apk-tools` to allow users to install other packages at runtime. This is useful for debugging and development, but should not be used in production.

Older versions and other variants are available through the [commercial suite of Chainguard Images](https://www.chainguard.dev/chainguard-images).

In some cases, older images may use the `tflib/tagger` module to provide version-tagged images. These are for legacy purposes only and should not be used for new images.

### Architectures

Images are built for `aarch64` and `x86_64` by default.

## Users

The user account a Chainguard Image runs as is configured in the `apko.yaml` file, or in the equivalent HCL file in `config/main.tf`.

Where there is an existing standard `username` for an image used by other distributions, favor using this. Having consistency with this `username` will reduce friction when adopting Chainguard Images.

If no existing standard `username` exists consider using “`nonroot`”. Set the GID and UID to 65532 unless another UID is required for compatibility with tooling.

The default user account to run as is set in the `run-as` field of the `apko.yaml` file. This is the UID of the user account to run as. If the `run-as` field is not set, the default is `0` (root). Prefer to specify the UID instead of the username.

This standard configuration is also available in HCL in the `tflib/accts` module.

**Example 1**: (matching upstream user name)

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

or

```hcl
module "accts" {
  source = "../../../tflib/accts"
  name = "maven"
}

output "config" {
  value = jsonencode({
    ...
    accounts = module.accts.block
    ...
  })
}
```

**Example 2**: (using Chainguard default user name)

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

or

```hcl
module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    ...
    accounts = module.accts.block
    ...
  })
}
```

See [./TERRAFORM.md] for more information about Terraform-driven build configuration.

In some cases it may be more user friendly to run as root. In these cases, make sure there is still a `nonroot` user in the image so it can be easily changed and add docs on how to do so (e.g. ``docker run –user nonroot …``).

### Switching User

Another common requirement is to start a container as root and switch to a less privileged user after performing an operation requiring elevated privileges. We see this in the PostgreSQL image, which runs an entrypoint script as root on startup to create a database if it doesn’t exist. After creating the DB (which requires elevated privileges),  the script uses the `suexec` utility to switch to the `postgres` user when starting the main DB process.

## CMD and ENTRYPOINT

This can get confusing. Basically, in _Docker terminology_, the [CMD](https://docs.docker.com/engine/reference/builder/#cmd) is passed as an argument to [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint) as the command to run in the container when it starts. If the ENTRYPOINT isn’t set, commands will still get interpreted with `/bin/sh -c`. For this reason, base images like alpine, debian and wolfi-base don’t set an entrypoint but commands like `docker run cgr.dev/chainguard/wolfi-base ls` still work as expected.

In the Docker Official images, all images except base images (Alpine, Debian etc) use an entrypoint script. Sometimes these do special processing such as setting up permissions on volumes, but often they are just used to interpret arguments and pass either to the image command or the system (so `–version` and `ls` both work as expected. See for example the [Node entrypoint.sh](https://github.com/nodejs/docker-node/blob/e75fa5270326ffaff8fee03153f3bf16860084d4/19/buster/docker-entrypoint.sh). For our distroless images there is an extra cost to using an entrypoint script as it requires a shell to be installed. For that reason, entrypoint scripts are normally only provided in `dev` image variants.

In apko YAML, setting ENTRYPOINT and CMD looks a little different. Here's an example from the [Node image](https://github.com/chainguard-images/images/blob/main/images/node/configs/latest.apko.yaml):

```yaml
entrypoint:
 command: /usr/bin/node
cmd: --help
```

or

```hcl
variable "config" {
  value = jsonencode({
    ...
    entrypoint = {
      command = "/usr/bin/node"
    }
    cmd = "--help"
    ...
  })
}
```

This sets ENTRYPOINT to `/usr/bin/node` and CMD to `–help`.

For apko-built images that need an entrypoint script, it has to be provided in a melange package. See the [Postgres package](https://github.com/wolfi-dev/os/blob/main/postgresql/postgresql-entrypoint.sh) for an example.

Set the ENTRYPOINT and CMD as follows:

* ENTRYPOINT:
    * Applications, servers and tooling should call the main application without arguments e.g. `redis-server`. As there is no shell you may need to use the full path.
    * Base images (static, wolfi-base etc) leave empty.
    * Dev variants should use an entrypoint script to make the image behave as described above.
* CMD should be set appropriately for the type of image:
    * Long running server software like DBs or load balancers should start the main process as normal (may be empty if ENTRYPOINT is enough)
    * Utilities and tools like grep or curl should show the standard help message (or version information if not available) e.g.` –help` or `–version`.
    * Base images can start a shell if there is one `[/bin/sh]`
* Try to have a close experience to any popular equivalent images

## Process Managers / Supervisors / Init System

In most cases this shouldn’t be necessary, but occasionally you may find an image needs to use a process manager or init system, perhaps for handling multiple processes, logging or signals. Docker bundles [tini ](https://github.com/krallin/tini)for this reason, and we bundle [s6](https://skarnet.org/software/s6/s6-supervise.html). See the [apko docs](https://github.com/chainguard-dev/apko/blob/main/docs/apko_file.md#entrypoint-top-level-element) for usage.

## Environment Variables

Consider adding environment variables to expose configuration options. In cloud native environments it is typically much easier to set an environment variable (and have it vary per container) than it is to mount a configuration file or even pass arguments to an executable.

This should be extended to include setting passwords, at least where the use of the password is enforced. Whilst having a password exposed in an environment variable may have security implications, it is common and a supported pattern in Kubernetes (it's worth linking to the [docs on k8s secrets](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/) in user documentation).

The [postgres image documentation](https://github.com/chainguard-images/images/tree/main/images/postgres) provides an example of how to do this:

    The only mandatory environment variable needed by the PostgreSQL image is POSTGRES_PASSWORD
    To test and not persist PostgreSQL data run...

```sh
docker run --rm -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

The postgres image also sets the PGDATA environment variable to the default location of the postgres database, which looks like this in the [apko YAML](https://github.com/chainguard-images/images/blob/main/images/postgres/configs/latest.apko.yaml):


```yaml
environment:
 PGDATA: /var/lib/postgresql/data
```

or

```hcl
environment = {
  "PGDATA" = "/var/lib/postgresql/data"
}
```

> **Note**
> If a config has no environment variables set, `apko` sets defaults for `PATH` and `SSL_CERT_FILE`.

## Signals

Please test that the image handles signals properly. In particular check that SIGTERM is handled and the container quits immediately (if it’s not handled Docker will wait 10s before reaping). You can test this as follows:

```
❯ docker run -d --name test cgr.dev/chainguard/nginx
```


```
9987b2f37044b72460956f1821bbba0499e0e724d2987f870099976601cf701b
❯ docker kill test
test
```

The kill command should return immediately (not in 10s).

## Documentation

Follow the example of other images such as [static](https://github.com/chainguard-images/images/tree/main/images/static#usage). Try to keep a new user in mind - what do they need to know? What questions are they likely to have?

Remember users will likely have used other popular images. If our image works noticeably differently, document the differences.

### Usage Example

Add examples of using the image. Ideally there should be links to code examples. Check the [static image as good example](https://github.com/chainguard-images/images/tree/main/images/static#usage) for a base image. And note the [code examples also available](https://github.com/chainguard-images/images/tree/main/images/static/examples).

## Logs

Error logs should be streamed to `stderr`. Normal logging should be streamed to `stdout`. DO NOT write logs to file as they will eat up disk over time; better to stream and let the user store or ignore it.

## Tests

Each image should have end-to-end tests verifying the basic functionality is working. Tests are configured by a `tests` module which can invoke an `oci_exec_test` or `helm_release` to install a Helm chart.

Base images should be tested by running something on top of them. The [static image tests](https://github.com/chainguard-images/images/tree/main/images/static/tests) includes the following:

```
for lang in c golang rust; do
 docker build --build-arg BASE=${IMAGE_NAME} --tag smoke-test-${lang} --file examples/Dockerfile.${lang} examples
 docker run smoke-test-${lang}
done
```

Which calls out to Dockerfiles such as [this one for Go](https://github.com/chainguard-images/images/blob/main/images/static/examples/Dockerfile.golang):

```
ARG BASE=cgr.dev/chainguard/static

FROM cgr.dev/chainguard/go as build

COPY main.go /main.go
RUN CGO_ENABLED=0 go build -o /hello /main.go

FROM $BASE
COPY --from=build /hello /hello
CMD ["/hello"]
```

Other tests that should be considered:

* Tests for any configuration options provided e.g. setting a password
* Mounting data or configuration e.g. running nginx with a HTML directory
* Connecting via another container
