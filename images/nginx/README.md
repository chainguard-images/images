<!--monopod:start-->
# nginx
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nginx` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nginx/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```
<!--getting:end-->

<!--body:start-->
A minimal nginx base image rebuilt every night from source.

## Breaking Changes

On May 3 2023 the Chainguard nginx image was rebuilt with several improvements, including
breaking changes. You may need to take action to update your application.

Specifically, the config file was changed to bring the default configuration closer to that of
official nginx image. If you override the config with a custom configuration, you should not be affected.

The changes included:

 - Moving the default port from 80 to 8080. This is required to run on Kubernetes as a non-privileged user.
 - Setting nginx to automatically determine the number of worker processes
 - Moving the HTML directory to `/usr/share/nginx/html`

If you are unable to update currently, you can use the last build of the previous image e.g:

```
docker pull cgr.dev/chainguard/nginx@sha256:bcc6b0d052298112e4644b258de0fa4dc1509e3df8f7c0fba09e8c92987825e7
```

This digest corresponds to nginx version 1.24.0. This image is not updated and you should migrate to the new configuration as soon as possible.

## Usage

To try out the image, run:

```
docker run -p 8080:8080 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/usr/share/nginx/html -p 8080:8080 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx!`.

To use a custom `nginx.conf` you can mount the file into the container, being sure to edit the `-p 8080:8080` published port(s) to match your configuration's `listen` directive:

```
docker run -v $(pwd)/$CUSTOM_NGINX_CONF_DIRECTORY/nginx.conf:/etc/nginx/nginx.conf -p 8080:8080 cgr.dev/chainguard/nginx
```

## Run in a read-only File System

If you want to run with read-only filesystem, you will need to mount the `/var/run` and
`/var/lib/nginx/tmp` directories. The easiest way to do this is with `--tmpfs` e.g:

```
docker run \
  --read-only \
  --tmpfs /var/lib/nginx/tmp/ --tmpfs /var/run/ \
  --cap-drop=ALL \
  -p 8080:8080
  cgr.dev/chainguard/nginx
```

### User Directive Warning

Starting the container gives the following warning:

```
nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
```

The warning is telling us container is already running as the named user, so it doesn't have
anything to do. If the container is run as root, it would switch to the named user. We decided to
leave this configuration in despite the warning for anyone that runs with `--user` switch in Docker
or an equivalent.

## Differences to [Docker Official Image](https://hub.docker.com/_/nginx)

Where possible, the image tries to stay close to Docker official image configuration. However our
image strives for minimalism and the default image does not include a shell or package manager,
meaning it isn't possible to achieve an identical configuration. In this section we outline the
major differences.

### Default port

To support the change to an unprivileged user, the default port was moved to 8080, contrasting with
port 80 used by the official image.

### IPv6 Support

The official Docker image checks for the existence of `/proc/net/if_inet6` and automatically listens
on `[::]:80` if it exists. For simplicity, we only listen on IPv4, but IPv6 support can be easily
added by mounting a config file with a section such as:

```
server {
    listen       8080;
    listen  [::]:8080;
    ...

```

Note that the default config has the relevant section at `/etc/nginx/conf.d/default.conf`

### Users

The official Docker image starts as the root user and forks to a less privileged user. By contrast,
our image starts up as a less priviliged user and no forking is required. For most users this
shouldn't make a difference, but note the "User Directive Warning" above.

### Environment Variable Substitution

The Docker official image has support for setting environment variables that get substitued into the
config file. Currently we do not have support for this, but are [looking into options](https://github.com/chainguard-images/images/issues/435).
<!--body:end-->
