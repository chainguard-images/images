<!--monopod:start-->
# grafana-rollout-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/grafana-rollout-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/grafana-rollout-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

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

How to install via Helm:

```bash
helm repo add grafana https://grafana.github.io/helm-charts
kubectl create ns grafana-rollout-operator
helm install grafana-rollout-operator garafana/rollout-operator
```

Get Daemonset count
```bash
kubectl get deploy grafana-rollout-operator -n grafana-rollout-operator
```

Trace the logs and look for occurences of

1) informer caches are syncing
2) informer caches have synced
3) reconcile started
4) reconcile done


<!--body:end-->
