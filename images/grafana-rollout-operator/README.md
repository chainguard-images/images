<!--monopod:start-->
# grafana-rollout-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-rollout-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/grafana-rollout-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Kubernetes Rollout Operator coordinates the rollout of pods between different StatefulSets within a specific namespace, and can be used to manage multi-AZ deployments
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/grafana-rollout-operator:latest
```
<!--getting:end-->

<!--body:start-->

How to install via Helm only rollout operator:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
kubectl create ns grafana-rollout-operator
helm install grafana-rollout-operator garafana/rollout-operator \
    --set image.repository=cgr.dev/chainguard/grafana-rollout-operator \
    --set image.tag=latest
```

Get Daemonset count
```bash
kubectl get deploy grafana-rollout-operator -n grafana-rollout-operator
```

This works in conjencture with [mimir-distributed](https://grafana.com/docs/helm-charts/mimir-distributed/latest/get-started-helm-charts/)

Add Labels and Annotations to ingester zones
```bash
kubectl label sts mimir-ingester-zone-a grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-a grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-port=80 -n mimir

kubectl label sts mimir-ingester-zone-b grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-b grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/rollout-downscale-leader=mimir-ingester-zone-a -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-port=80 -n mimir

kubectl label sts mimir-ingester-zone-c grafana.com/min-time-between-zones-downscale=2m -n mimir
kubectl label sts mimir-ingester-zone-c grafana.com/prepare-downscale=true -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/rollout-downscale-leader=mimir-ingester-zone-b -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-port=80 -n mimir
```

Check for logs
```bash
kubectl logs deployment/mimir-rollout-operator -n mimir
```

It should say something like
```bash
level=debug ts=2024-05-14T17:02:34.97299692Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-a
level=debug ts=2024-05-14T17:02:34.973309878Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-b
level=debug ts=2024-05-14T17:02:34.97338692Z msg="reconciling StatefulSet" statefulset=mimir-store-gateway-zone-c
level=debug ts=2024-05-14T17:02:34.97363967Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-a
level=debug ts=2024-05-14T17:02:34.973721503Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-b
level=debug ts=2024-05-14T17:02:34.973819586Z msg="reconciling StatefulSet" statefulset=mimir-ingester-zone-c
```


<!--body:end-->
