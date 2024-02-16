<!--monopod:start-->
# memcached
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/memcached` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/memcached/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Memcached](https://memcached.org/) is an in-memory key-value store for small chunks of arbitrary data (strings, objects) from results of database calls, API calls, or page rendering.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/memcached:latest
```
<!--getting:end-->

<!--body:start-->
## Using Memcached

The default memcached port is 11211.
To run with Docker using default configuration:

```sh
docker run -p 11211:11211 --rm cgr.dev/chainguard/memcached
```

Connect to Memcached with telnet

```sh
$ telnet localhost 11211
Trying ::1...
Connected to localhost.
Escape character is '^]'.
set foo 0 100 3
bar
STORED
get foo
VALUE foo 0 3
bar
END
quit
Connection closed by foreign host.
```

## Users and Directories

By default this image runs as a non-root user named `memcached` with a uid of 65532.
<!--body:end-->
