<!--monopod:start-->
# telegraf
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/telegraf` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/telegraf.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with Telegraf. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/telegraf:latest
```

## Using Telegraf

The Chainguard Telegraf image contains the `telegraf` binary.

Telegraf needs a config file to run.
The default location for this config file is at `/etc/telegraf/telegraf.conf`.
One is not provided by default with the image.

This location can be overridden with the `---config` or `--config-directory` flags.

```shell
 % docker run cgr.dev/chainguard/telegraf
2023-03-28T14:07:48Z I! Loading config file: /etc/telegraf/telegraf.conf
2023-03-28T14:07:48Z E! [telegraf] Error running agent: no outputs found, did you provide a valid config file?
```
