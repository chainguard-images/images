<!--monopod:start-->
# chromium
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/chromium` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/chromium/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal [Chromium](https://chromium.googlesource.com/chromium/src/) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/chromium:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Running Chromium doesn't require passing any additional parameters to Docker:

```bash
docker run cgr.dev/chainguard/chromium:latest
```

Please note that Chromium is ran in a headless state with the sandbox and GPU access disabled with the flags:

```
--headless --no-sandbox --disable-gpu
```

We run Chromium headless with GPU access disabled due to the container not having GPU access.

Chromium's sandbox has been disabled as the container is sandboxed from the host environment.

This can be overriden via the environment variable `CHROMIUM_USER_FLAGS` though this is unsupported.

<!--body:end-->
