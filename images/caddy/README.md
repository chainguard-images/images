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

<!--overview:start-->
Open source web server with automatic HTTPS written in Go
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/caddy:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image comes with a default configuration `Caddyfile` located in `/etc/caddy/Caddyfile`.

Please refer to [upstream's excellent (and comprehensive) documentation](https://caddyserver.com/docs/) on the subject of configuring Caddy for your needs.

The following example runs `caddy` with a custom configuration file:

```
docker run -it --rm -v "$(pwd)/Caddyfile:/etc/caddy/Caddyfile" cgr.dev/chainguard/caddy caddy run --config /etc/caddy/Caddyfile
```
<!--body:end-->
