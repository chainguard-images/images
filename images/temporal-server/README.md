<!--monopod:start-->
# temporal-server
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/temporal-server` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/temporal-server/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Temporal-Server Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/temporal-server:latest
```

## Usage

THe default entrypoint for this image is the `temporal-server` binary.

To test:

```shell
$ docker run cgr.dev/chainguard/temporal-server:latest start --config <config dir path relative to root (default: "config")>

USAGE:
   temporal-server [global options] command [command options]  

VERSION:
   1.22.0

COMMANDS:
   start    Start Temporal server
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --root value, -r value    root directory of execution environment (default: ".") [$TEMPORAL_ROOT]
   --config value, -c value  config dir path relative to root (default: "config") [$TEMPORAL_CONFIG_DIR]
   --env value, -e value     runtime environment (default: "development") [$TEMPORAL_ENVIRONMENT]
   --zone value, --az value  availability zone [$TEMPORAL_AVAILABILITY_ZONE, $TEMPORAL_AVAILABILTY_ZONE]
   --allow-no-auth           allow no authorizer (default: false) [$TEMPORAL_ALLOW_NO_AUTH]
   --help, -h                show help (default: false)
   --version, -v             print the version (default: false)