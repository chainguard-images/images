<!--monopod:start-->
# falcoctl
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/falcoctl` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/falcoctl/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based image for `falcoctl`.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/falcoctl:latest
```
<!--getting:end-->

<!--body:start-->
`falcoctl` is a command-line tool for managing the runtime security tool Falco,
assisting with configuration, rule management, and integration in Kubernetes
environments. falcoctl runs as part of falco by default, but can also be ran
as an external service.

## Usage

`falcoctl` is the entrypoint for the container image. Run with `help` to view
list of supported commands and options:

```bash
docker run cgr.dev/chainguard/falcoctl:latest help
```

For more information, refer to the falco documentation:
- [Install and operate falco](https://falco.org/docs/install-operate/running/)
- [Falco GitHub](https://github.com/falcosecurity/falco)
<!--body:end-->
