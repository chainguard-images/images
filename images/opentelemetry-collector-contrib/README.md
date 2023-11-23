<!--monopod:start-->
# opentelemetry-collector-contrib
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/opentelemetry-collector-contrib` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/opentelemetry-collector-contrib/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [opentelemetry-collector-contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib).
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/opentelemetry-collector-contrib:latest
```
<!--getting:end-->

<!--body:start-->
## Using this image

Chainguard cgr.dev/chainguard/opentelemetry-collector-contrib is a drop in replacement for the upstream image, tested using the the community [helm chart](https://opentelemetry.io/docs/kubernetes/helm/collector/).

```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install my-opentelemetry-collector open-telemetry/opentelemetry-collector \
   --set mode=<daemonset|deployment|statefulset> \
   --set image.repository=cgr.dev/chainguard/opentelemetry-collector-contrib \
   --set image.tag=latest
```

To use custom configuration it is easier to use a values.yaml file:

```yaml
mode: daemonset
configMap:
  create: false
image:
  tag: latest
  repository: cgr.dev/chainguard/opentelemetry-collector-contrib
command:
  extraArgs:
    - "--config=/conf/custom-config.yaml"
extraVolumeMounts:
  - name: "custom-vm"
    mountPath: "/conf"
extraVolumes:
  - name: "custom-vm"
    configMap:
      name: "custom"

```
```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm install open-telemetry opentelemetry/opentelemetry-collector --namespace open-telemetry-custom-config -f values.yaml
```
<!--body:end-->
