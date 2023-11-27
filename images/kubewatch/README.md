<!--monopod:start-->
# kubewatch
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubewatch` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubewatch/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[kubewatch](https://github.com/robusta-dev/kubewatch) is a Kubernetes watcher that publishes notification to available collaboration hubs/notification channels. Run it in your k8s cluster, and you will get event notifications through webhooks.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubewatch:latest
```
<!--getting:end-->

<!--body:start-->
## Using kubewatch

This image is a drop-in replacement for the upstream image.
You can run it using the official helm chart with:

```shell
$ helm repo add robusta https://robusta-charts.storage.googleapis.com
$ helm repo update
$ helm install kubewatch robusta/kubewatch \
    --set image.repository=cgr.dev/chainguard/kubewatch \
    --set image.tag=latest
    <other configuration parameters here>
```
<!--body:end-->
