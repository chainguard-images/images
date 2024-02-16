<!--monopod:start-->
# falcosidekick
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/falcosidekick` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/falcosidekick/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based image for `falcosidekick`.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/falcosidekick:latest
```
<!--getting:end-->

<!--body:start-->
`falcosidekick` is a simple daemon for connecting Falco to your ecosystem. It takes a Falco events and forward them to different outputs in a fan-out way.

## Usage

`falcosidekick` is the entrypoint for the container image. Run with `help` to view
list of supported commands and options:

```bash
docker run cgr.dev/chainguard/falcosidekick:latest help
```

For more information, refer to the falco documentation:
- [Install and operate falco](https://falco.org/docs/install-operate/running/)
- [Falco GitHub](https://github.com/falcosecurity/falco)
<!--body:end-->
