# Image Guidelines and Best Practices

This document describes the standards expected for Chainguard images in order to provide users with
a consistent and smooth experience. New images must meet these standards or document why they deviate.

## Experimental and Stable

Images that are not ready for production use should be marked as ‘Experimental’via the [images.yaml configuration file](https://github.com/chainguard-images/images/blob/main/images/rabbitmq/image.yaml).  Once an image has seen enough usage without issue it will be removed.

We realize ‘enough usage’ leaves a lot of ambiguity.  This is intentional as some images are simple enough we can feel confident in them without using the experimental tag, while others may need to be validated with more usage. 


## Version Availability

Our policy is to provide the most recent two minor versions for free download. (The `latest` tag will point to the most recent minor version). This also includes any relevant variants e.g. `dev` images.  On a case by case basis some other tags e.g. `experimental` may be made available for free.

Older versions and other variants are available through the [commercial suite of Chainguard Images](https://www.chainguard.dev/chainguard-images).

### Architectures

At the moment, images should be built for `aarch64` and `x86_64`. We hope to add more architectures in the future.


## Tagging

Each image must have the following tags:

* **latest**: `latest` is an awful naming convention, but it’s what we have. Latest should point to the _newest stable_ version of the image we have. It **should not** be an edge or nightly release, despite the name. 
* **semver:** where possible there should be semver tags for each image, with a tag for each level. For example at the time of writing we have `redis:7.0.8` which is currently the same image as `redis:7.0` and `redis:7`. We only support the last two minor versions for free images. Be careful to make sure that the major version (e.g. `acme:4`) points to the latest minor (e.g. `acme:4.2` not `acme:4.1`). This should be largely handled automatically by our tooling.
* **dev: **(note *not* `debug` or `full`) variant image that includes apk-tools and a shell, as well as any relevant development tools for the image or ecosystem (e.g language package managers like “pip” or debugging tools). As the image includes apk tools, it can be extended easily in a Dockerfile and extra utilities can be added when debugging inside a container. Easiest way to make this variant is to add wolfi-base which includes apk-tools and busybox.

For software with popular named versions:


* **edge/mainline:** for images that have a commonly used non-stable release such as nginx. The tag should reflect the naming convention of the upstream project. Note this may or may not match a semver tag depending on the conventions of the project. Do not include version numbers in the tag i.e. `nginx:mainline` not `nginx:1.23-mainline` to avoid confusion when versions change.
* **lts:** for a "long term support" version. If there are multiple LTS versions, it should point to the most recent. Do not include version numbers in the tag i.e. `node:lts` not `node:18-lts`. This version can cause confusion, we should only include it at user request.

Occasionally we use the following tags if required:

* **glibc/musl**: The vast majority of images should not need to use these tags and will only provide the wolfi glibc version. In some of our older images like “static” these tags are used to signify the wolfi/alpine versions of images.
* **nonroot: **Our images should run as a `nonroot` user by default. If this causes usability issues (as with our go image), consider making the default image run as root and adding a `nonroot` variant, or vice-versa (leaving nonroot as default and adding a root variant). Try to keep things simple - only have this variant if nonroot doesn’t work for a large number of users.

Images may have special tags for optional dependencies and variants. Where it makes sense these can be folded into the `dev` image, otherwise special tags can be used - for example see the `fpm` variant for PHP and the JDK variants for maven.

Note that _version_ tags come before _variant_ tags. So it’s `acme:latest-dev` and `acme:1.2.3-nonroot`, not `acme:dev-latest` etc.


## Users

The user account a Chainguard Image runs as is configured in the `apko.yaml` file.  

Where there is an existing standard `username` for an image used by other distributions, favor using this.  Having consistency with this `username` will reduce friction when adopting Chainguard Images.

If no existing standard `username` exists consider using a name that matches the Image, or “`nonroot`”. Set the GID and UID to 65532 unless another UID is required for compatibility with tooling.

**Example 1**: (matching upstream user name)

```
accounts:
 groups:
   - groupname: maven
     gid: 65532
 users:
   - username: maven
     uid: 65532
```

**Example 2**: (using Chainguard default user name)

```
accounts:
 groups:
   - groupname: nonroot
     gid: 65532
 users:
   - username: nonroot
     uid: 65532
```

### Setting the User to Run

By default Images should run as a non-root user account - as well as being best security practice, it is often enforced in some environments such as OpenShift. 

**Example**:

```
 run-as: maven
 recursive: true
```

In some cases it may be more user friendly to run as root (for example we had multiple issues trying to run the Go image as `nonroot`). In these cases, make sure there is still a `nonroot` user in the image so it can be easily changed and add docs on how to do so (e.g. ``docker run –user nonroot …``). Also consider making a `nonroot` tag variant that runs as the `nonroot` user. 


### Switching User

Another common requirement is to start a container as root and switch to a less privileged user after performing an operation requiring elevated privileges. We see this in the PostgreSQL image, which runs an entrypoint script as root on startup to create a database if it doesn’t exist. After creating the DB (which requires elevated privileges),  the script uses the `suexec` utility to switch to the `postgres` user when starting the main DB process.


## CMD and ENTRYPOINT

This can get confusing. Basically, in _Docker terminology_, the [CMD](https://docs.docker.com/engine/reference/builder/#cmd) is passed as an argument to [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint) as the command to run in the container when it starts. If the ENTRYPOINT isn’t set, commands will still get interpreted with `/bin/sh -c`. For this reason, base images like alpine, debian and wolfi-base don’t set an entrypoint but commands like `docker run cgr.dev/chainguard/wolfi-base ls` still work as expected.

In the Docker Official images, all images except base images (Alpine, Debian etc) use an entrypoint script. Sometimes these do special processing such as setting up permissions on volumes, but often they are just used to interpret arguments and pass either to the image command or the system (so `–version` and `ls` both work as expected. See for example the [Node entrypoint.sh](https://github.com/nodejs/docker-node/blob/e75fa5270326ffaff8fee03153f3bf16860084d4/19/buster/docker-entrypoint.sh). For our distroless images there is an extra cost to using an entrypoint script as it requires a shell to be installed. For that reason, entrypoint scripts are normally only provided in `dev` image variants.

In apko YAML, setting ENTRYPOINT and CMD looks a little different. Here's an example from the [Node image](https://github.com/chainguard-images/images/blob/main/images/node/configs/latest.apko.yaml):

```
    entrypoint:
     command: /usr/bin/node
    cmd: --help
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


## Labels and Annotations  {#labels-and-annotations}

_NOTE: Annotations/Labels are currently broken in apko but this should be fixed soon. They can still be added to the config._

Set the following annotations on the images using apko:

```
annotations:
  "org.opencontainers.image.authors": "Chainguard Team https://www.chainguard.dev/"
  "org.opencontainers.image.url": https://edu.chainguard.dev/chainguard/chainguard-images/reference/busybox/ #use the academy site here
  "org.opencontainers.image.source": https://github.com/chainguard-images/images/tree/main/images/bazel #use github here
```

Please add any annotations that are missing here - it’s an easy way to add value to our users. 

These are based on the OCI default annotations here [https://github.com/opencontainers/image-spec/blob/main/annotations.md](https://github.com/opencontainers/image-spec/blob/main/annotations.md). 


## Environment Variables

Consider adding environment variables to expose configuration options. In cloud native environments it is typically much easier to set an environment variable (and have it vary per container) than it is to mount a configuration file or even pass arguments to an executable.

This should be extended to include setting passwords, at least where the use of the password is enforced. Whilst having a password exposed in an environment variable may have security implications, it is common and a supported pattern in Kubernetes (it's worth linking to the[ docs on k8s secrets](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/) in user documentation).

The [postgres image documentation](https://github.com/chainguard-images/images/tree/main/images/postgres)  provides an example of how to do this:

 
    The only mandatory environment variable needed by the PostgreSQL image is POSTGRES_PASSWORD
    To test and not persist PostgreSQL data run...

```
    docker run --rm -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```


The postgres image also sets the PGDATA environment variable to the default location of the postgres database, which looks like this in the [apko YAML](https://github.com/chainguard-images/images/blob/main/images/postgres/configs/latest.apko.yaml):


```
environment:
 PGDATA: /var/lib/postgresql/data
```

## Signals

Please test that the image handles signals properly. In particular check that SIGTERM is handled and the container quits immediately (if it’s not handled Docker will wait 10s before reaping). You can test this as follows:

 ` ❯ docker run -d --name test cgr.dev/chainguard/nginx`


```
  9987b2f37044b72460956f1821bbba0499e0e724d2987f870099976601cf701b
  ❯ docker kill test
  test
```


The kill command should return immediately (not in 10s).


## Documentation

Follow the example of other images such as [static](https://github.com/chainguard-images/images/tree/main/images/static#usage). Try to keep a new user in mind - what do they need to know? What questions are they likely to have?

Remember users will likely have used the official Docker image. If our image works noticeably differently, document the differences.


### Usage Example

Add examples of using the image. Ideally there should be links to code examples. Check the [static image as good example](https://github.com/chainguard-images/images/tree/main/images/static#usage) for a base image. And note the [code examples also available](https://github.com/chainguard-images/images/tree/main/images/static/examples).


## Logs

Error logs should be streamed to `stderr`. Normal logging should be streamed to `stdout`. DO NOT write logs to file as they will eat up disk over time; better to stream and let the user store or ignore it.


## Tests

Each image should have end-to-end tests verifying the basic functionality is working. Tests are added by including shell scripts in the tests directory, which will be run as part of CI. The absolute minimum test is running the image and ensuring it doesn’t crash. For example, [postgres](https://github.com/chainguard-images/images/blob/main/images/postgres/test.sh) currently includes the test:


```
docker run --rm "${IMAGE_NAME}" --version \
   | grep '^postgres (PostgreSQL) '
```


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


## Appendix

### Checklist


* Image is marked experimental or stable as appropriate
* The last two minor versions are available
* The latest tag points to the newest stable version
* There is a dev tag available that includes a shell and apk tools
* The image runs as `nonroot `and GID/UID are set to 65532
    * Alternatively the username and GID/UID may be a commonly used one from the ecosystem e.g: postgres
    * See above for exceptions to nonroot rule
* ENTRYPOINT 
    * For applications/servers/utilities call main program with no arguments e.g. [redis-server]
    * For base images leave empty
    * For dev variants set to entrypoint script that falls back to system
* CMD:
    * For server applications give arguments to start in daemon mode (may be empty)
    * For utilities/tooling bring up help e.g. `–help`
    * For base images with a shell, call it e.g. [/bin/sh]
* Consider where and how the image deviates from popular alternatives. Is there a good reason and is it documented?
* Add annotations e.g:

        ```
        annotations:
          "org.opencontainers.image.authors": "Chainguard Team https://www.chainguard.dev/"
          "org.opencontainers.image.url": https://edu.chainguard.dev/chainguard/chainguard-images/reference/busybox/ #use the academy site here
          "org.opencontainers.image.source": https://github.com/chainguard-images/images/tree/main/images/bazel #use github here
        ```
* Check if environment variables are needed e.g. to set data locations
* Ensure the image responds to SIGTERM
    *  `docker kill $(docker run -d --rm cgr.dev/chainguard/nginx)`
* Documentation. At least on par with Docker Hub. Include usage example.
* Error logs write to stderr and normal logs to stdout. DO NOT write to file.
* Include tests, at the very least a basic smoke test.
