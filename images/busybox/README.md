<!--monopod:start-->
# busybox
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/busybox` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/busybox/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Chainguard offers two different variations of the `busybox` Image. Both contain the BusyBox software but are built against different variants of `libc`:

- `latest`, meant for variants based on `musl`
- `latest-glibc`, meant for variants based on `glibc`

You can ensure that either of these Images are working correctly by testing that they can run commands and return output. The following commands will both return `hello world!` in your terminal:

`musl`:
```shell
docker run -it cgr.dev/chainguard/busybox:latest echo hello world!
```

`glibc`:
```shell
docker run -it cgr.dev/chainguard/busybox:latest-glibc echo hello world!
```

Also, note that you can open an interactive shell on either version of the Image with command like the following:

```shell
docker run -it cgr.dev/chainguard/busybox:latest sh
```
<!--body:end-->
