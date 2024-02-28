<!--monopod:start-->
# k8ssandra-system-logger
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/k8ssandra-system-logger` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/k8ssandra-system-logger/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Sidecar for DataStax Kubernetes Operator for Apache Cassandra
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/k8ssandra-system-logger:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

```shell
docker run cgr.dev/chainguard/k8ssandra-system-logger:latest
```

## Helm

```shell
helm repo add k8ssandra https://helm.k8ssandra.io/
helm install cass-operator k8ssandra/cass-operator \
  --namespace cass-operator \
	--create-namespace \
  --set imageConfig.systemLogger="cgr.dev/chainguard/k8ssandra-system-logger:latest"
```

## About

This image basically combination of the three packages:
- `cass-operator-config`
- `vector`
- `libstdc++`
<!--body:end-->
