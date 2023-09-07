<!--monopod:start-->
# opentf
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/opentf` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/opentf/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

[OpenTF](https://github.com/opentffoundation/opentf) lets you declaratively manage your cloud infrastructure.


## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/opentf
```

The image sets `opentf` as the entrypoint. To run it:

```
Usage: opentf [global options] <subcommand> [args]

The available commands for execution are listed below.
The primary workflow commands are given first, followed by
less common or more advanced commands.

Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure

All other commands:
  console       Try OpenTF expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote OpenTF modules
  graph         Generate a Graphviz graph of the steps in an operation
  ...
```
