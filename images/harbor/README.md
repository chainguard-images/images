<!--monopod:start-->
# harbor-registry
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/harbor-registry` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/harbor-registry/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
A Wolf-based image for Harbor - an open-source container registry with policies and RBAC, vulnerability scans, and provides trusted image signing.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/harbor-registry:latest
```
<!--getting:end-->

<!--body:start-->
## Deploying Harbor with Helm

The easiest way to get up and running with Chainguard's Harbor images is via deployment with Harbor's official Helm chart.

To get started, we need to add Harbor's Helm repository:  

```bash
helm repo add harbor https://helm.goharbor.io
```

Now that we've added the repository, we can deploy Harbor!:

```bash
helm install harbor harbor/harbor \
  --set core.image.repository=cgr.dev/chainguard/harbor-core,core.image.tag=latest \
  --set jobservice.image.repository=cgr.dev/chainguard/harbor-jobservice,jobservice.image.tag=latest \
  --set portal.image.repository=cgr.dev/chainguard/harbor-portal,portal.image.tag=latest \
  --set registry.registry.image.repository=cgr.dev/chainguard/harbor-registry,registry.registry.image.tag=latest \
  --set registry.registryctl.image.repository=cgr.dev/chainguard/harbor-registryctl,registry.registryctl.image.tag=latest \
  --set trivy.image.repository=cgr.dev/chainguard/harbor-trivy-adapter,trivy.image.tag=latest
```

You will need to override the `image` and `tag` values for each image like we've done here to point to Chainguard's Harbor images and tags.

Additionally, you may fetch Harbor's Helm chart after adding the repository and edit values directly without overriding them on installation:

```bash
helm fetch harbor/harbor --untar
```

Afterwards, edit `values.yml` and substitute in Chainguard's images/tags. For instance, for `harbor-core`, the following changes should be made:

```yaml
core:
  ...
  image: cgr.dev/chainguard/harbor-core
  tag: latest
  ...
```

And then deploy after configuration:

```bash
helm install harbor .
```

For more information on deploying Harbor via Helm, see the official documentation [here](https://goharbor.io/docs/1.10/install-config/harbor-ha-helm/).

## Deploying Harbor with Docker Compose

Harbor provides an online installer that can be retrieved from their releases on GitHub [here](https://github.com/goharbor/harbor/releases).

Follow all of their [steps for installation](https://goharbor.io/docs/1.10/install-config/download-installer/) up until you've successfully generated your `docker-compose.yml`. At this point, you can swap the upstream images out for Chainguard's.

For instance, to switch out `harbor-core` with Chainguard's image, edit `docker-compose.yml` and make the following change:

```yaml
services:
  ...
  core:
    image: cgr.dev/chainguard/harbor-core:latest
  ...
```

Then run the following in the terminal:

```bash
docker-compose up
```

Now you're up and running with Harbor powered by Chainguard images!

## Usage

Now that you've deployed Harbor, the portal should be accessible on whatever host you've opted to use. For example, if configured to use `localhost`, the portal will be accessible at [localhost:80](http://localhost) via HTTP or [localhost:443](https://localhost) via HTTPS, if setup.

You may now login with the username and password you've set or via the default username and password, `admin` and `Harbor12345`. You'll be presented with several options, including the ability to create a new project in the registry.

Additionally, you can now login to the registry with Docker! To do so, open a terminal and run:

```bash
docker login localhost
```

Where `localhost` should be substituted with the hostname or external URL you've chosen for Harbor.

Now let's push an image using Chainguard's base container for Wolfi!

Pull Wolfi:

```bash
docker pull cgr.dev/chainguard/wolfi-base:latest
```

Tag Wolfi using the registry and project path (`library` is created by default):

```bash
docker tag cgr.dev/chainguard/wolfi-base:latest locahost/library/wolfi-base:latest
```

And finally, push Wolfi to the registry!:

```bash
docker push localhost/library/wolfi-base:latest
```

Wolfi is now being pushed to the registry and will be viewable in the portal.

<!--body:end-->
