<!--monopod:start-->
# caddy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/caddy` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/caddy/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

A minimal caddy base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/caddy:latest
```

## Usage

To try out the image, run:

```
docker run -p 80:80 -p 443:443 cgr.dev/chainguard/caddy
```

If you navigate to `localhost`, you should see the caddy welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/usr/share/caddy/html -p 80:80 -p 443:443 cgr.dev/chainguard/caddy
```

If you navigate to `localhost`, you should see `Hello World from Caddy!`.

To use a custom `caddy.conf` you can mount the file into the container, being sure to edit the published port(s) to match your configuration, if necessary:

```
docker run -v $(pwd)/$CUSTOM_CADDY_CONF_DIRECTORY/Caddyfile:/etc/caddy/Caddyfile -p 80:80 -p 443:443 cgr.dev/chainguard/caddy
```

## Run in a read-only File System

If you want to run with read-only filesystem, you will need to mount the `/var/run` and
`/var/lib/caddy/tmp` directories. The easiest way to do this is with `--tmpfs` e.g:

```
docker run \
  --read-only \
  --tmpfs /var/lib/caddy/tmp/ --tmpfs /var/run/ \
  --cap-drop=ALL \
  --cap-add NET_BIND_SERVICE \
  -p 80:80
  -p 443:443 \
  cgr.dev/chainguard/caddy
```

## Differences to [Docker Official Image](https://hub.docker.com/_/caddy)

Where possible, the image tries to stay close to Docker official image configuration. However our
image strives for minimalism and the default image does not include a shell or package manager,
meaning it isn't possible to achieve an identical configuration. In this section we outline the
major differences.

### Default port

To support the change to an unprivileged user, the default port was moved to 8080, contrasting with
port 80 used by the official image.
