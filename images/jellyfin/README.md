<!--monopod:start-->
# jellyfin
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jellyfin` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/jellyfin/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal [Jellyfin](https://github.com/jellyfin/jellyfin) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jellyfin:latest
```
<!--getting:end-->

<!--body:start-->
## Running the Image
To get started, open a terminal and run:

```bash
docker run -p 8096:8096 cgr.dev/chainguard/jellyfin
```

The Jellyfin Web UI will start on port 8096. To check availability, run:

```bash
curl -vsL localhost:8096/health
```

If you see `HEALTHCHECK=healthy`, the Web UI is available for use.

For any additional configuration, please see Jellyfin's official [container](https://jellyfin.org/docs/general/installation/container/) documentation.

<!--body:end-->
