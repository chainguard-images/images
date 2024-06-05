<!--monopod:start-->
# opentofu
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/opentofu` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/opentofu/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[opentofu](https://github.com/opentofufoundation/opentofu) lets you declaratively manage your cloud infrastructure.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/opentofu:latest
```
<!--getting:end-->

<!--body:start-->
The image sets `opentofu` as the entrypoint. To run it:

```
Usage: opentofu [global options] <subcommand> [args]

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
  console       Try opentofu expressions at an interactive command prompt
  fmt           Reformat your configuration in the standard style
  force-unlock  Release a stuck lock on the current workspace
  get           Install or upgrade remote opentofu modules
  graph         Generate a Graphviz graph of the steps in an operation
  ...
```
<!--body:end-->
