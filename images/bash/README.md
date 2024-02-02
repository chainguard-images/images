<!--monopod:start-->
# bash
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bash` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/bash/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image with only Bash and libc. Suitable for running any small scripts or binaries that need Bash instead of the BusyBox shell.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bash:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

You open up an interactive shell in the Bash Image with a command like the following:

```sh
docker run -it cgr.dev/chainguard/bash:latest /bin/bash
```

You can also use a bind mount to test scripts from your local machine on the Bash Image:

```sh
docker run -it --rm -v /path/to/local-script.sh:/container-script.sh cgr.dev/chainguard/bash:latest /container-script.sh
```
<!--body:end-->
