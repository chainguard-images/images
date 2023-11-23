<!--monopod:start-->
# traefik
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/traefik` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/traefik/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Traefik](https://github.com/traefik/traefik) is a cloud native application proxy.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/traefik:latest
```
<!--getting:end-->

<!--body:start-->
## Using Traefik

The default Traefik ports are 80 and 8080.

There is no default configuration in the image, but you can use a sample one like this:

```yaml
## traefik.yml


# API and dashboard configuration. DO NOT RUN IN PROD
api:
  insecure: true
```

Save the configuration file from above as `traefik.yml`, then run:

```sh
docker run -v $PWD:/etc  -p 80:80 -p 8080:8080 cgr.dev/chainguard/traefik  --configFile=/etc/traefik.yml
time="2023-01-29T12:37:55Z" level=info msg="Configuration loaded from file: /etc/traefik.yml"
```

## Users and Directories

By default this image runs as a non-root user named `traefik` with a uid of 65532.
<!--body:end-->
