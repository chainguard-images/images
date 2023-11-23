<!--monopod:start-->
# pgbouncer
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pgbouncer` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/pgbouncer/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
This image contains the CLI for the [pgbouncer](https://www.pgbouncer.org/) connection pooler for PostgreSQL. This image contains the `pgbouncer` binary and can be used directly.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/pgbouncer:latest
```
<!--getting:end-->

<!--body:start-->
## Use It!

The image can be run directly and sets the `pgbouncer` tool as the entrypoint:

```
docker run cgr.dev/chainguard/pgbouncer:latest
/usr/bin/pgbouncer is a connection pooler for PostgreSQL.

Usage:
  /usr/bin/pgbouncer [OPTION]... CONFIG_FILE

Options:
  -d, --daemon         run in background (as a daemon)
  -q, --quiet          run quietly
  -R, --reboot         do an online reboot
  -u, --user=USERNAME  assume identity of USERNAME
  -v, --verbose        increase verbosity
  -V, --version        show version, then exit
  -h, --help           show this help, then exit

Report bugs to <https://github.com/pgbouncer/pgbouncer/issues>.
PgBouncer home page: <https://www.pgbouncer.org/>
```

Note that `pgbouncer` typically needs a configuration file to run.
One is not provided here in the image by default.
You can find documentation on how to configure one in the [upstream documentation](https://www.pgbouncer.org/config.html#authentication-settings)..
<!--body:end-->
