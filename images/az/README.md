<!--monopod:start-->
# az
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/az` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/az/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Azure CLI
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/az:latest
```
<!--getting:end-->

<!--body:start-->

## Overview

Azure Command-Line Interface (CLI) used to create and manage Azure resources.
The Azure CLI is available across Azure services and is designed to get you
working quickly with Azure, with an emphasis on automation.

### Docker setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull cgr.dev/chainguard/az
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm cgr.dev/chainguard/az --version
```
You should get output similar to this:

```
azure-cli                         2.55.0

core                              2.55.0
telemetry                          1.1.0
...
```
<!--body:end-->
