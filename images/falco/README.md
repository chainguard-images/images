<!--monopod:start-->
# falco
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/falco` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/falco/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based image for `falco`.

`falco` is a cloud native runtime security tool for Linux operating systems. 
It is designed to detect and alert on abnormal behavior and potential security threats in real-time.

## Get It!

The image is available on `cgr.dev`:

```bash
docker pull cgr.dev/chainguard/falco:latest
```

## Usage

`falco` is the entrypoint for the container image. Run with `help` to view
list of supported commands and options:

```bash
docker run cgr.dev/chainguard/falco:latest help
```

For more information, refer to the falco documentation:
- [Install and operate falco](https://falco.org/docs/install-operate/running/)
- [Falco GitHub](https://github.com/falcosecurity/falco)
