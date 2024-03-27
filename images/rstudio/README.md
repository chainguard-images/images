<!--monopod:start-->
# rstudio
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/rstudio` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/rstudio/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [RStudio](https://github.com/rstudio/rstudio) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/rstudio:latest
```
<!--getting:end-->

<!--body:start-->
## Running the Image
In order to run RStudio, execute the following command in a terminal:

```bash
docker run -it -p 8787:8787 cgr.dev/chainguard/rstudio:latest
```

The server will now start and the IDE will be accessible at [localhost:8787](http://localhost:8787) in your browser of choice.

<!--body:end-->
