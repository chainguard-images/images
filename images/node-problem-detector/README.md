<!--monopod:start-->
# node-problem-detector
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/node-problem-detector` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/node-problem-detector/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

[node-problem-detector](https://github.com/kubernetes/node-problem-detector) aims to make various node problems visible to the upstream layers in the cluster management stack.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node-problem-detector
```

## Usage

Install via `helm` using the upstream source shown below:

```bash
helm repo add deliveryhero https://charts.deliveryhero.io/
helm upgrade --install npd deliveryhero/node-problem-detector \
  --namespace node-problem-detector \
  --create-namespace \
  --set image.repository=cgr.dev/chainguard/node-problem-detector \
  --set image.tag=latest
```

> WARNING: The example above should _not_ may work directly. In the official image, binary located under `/` path whereas we put under `/usr/bin/`. You may have to patch it: `$ kubectl patch daemonsets.apps npd-node-problem-detector --type='json' -p='[{"op": "remove", "path": "/spec/template/spec/containers/0/command"}, {"op": "add", "path": "/spec/template/spec/containers/0/args", "value": ["--config.system-log-monitor=/config/kernel-monitor.json,/config/docker-monitor.json", "--prometheus-address=0.0.0.0", "--prometheus-port=20257", "--k8s-exporter-heartbeat-period=5m0s"]}]'`
