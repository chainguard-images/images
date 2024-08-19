<!--monopod:start-->
# helm-chartmuseum
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/helm-chartmuseum` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/helm-chartmuseum/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [chartmuseum](https://github.com/helm/chartmuseum) binary.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/helm-chartmuseum:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Create a helm chart, and package it into a `charts/` directory:

```
helm create hello
mkdir charts/
helm package hello -d ./charts
```

Start the chartmuseum server:

```
docker run --rm -p 8080:8080 -v $(pwd)/charts:/charts \
  cgr.dev/chainguard/chartmuseum:latest
```

From another terminal, use it as a helm repository:
```
helm repo add chartmuseum http://localhost:8080
helm search repo chartmuseum/
helm upgrade --install chartmuseum-demo chartmuseum/hello
```
<!--body:end-->
