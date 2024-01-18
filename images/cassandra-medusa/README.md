<!--monopod:start-->
# cassandra-medusa
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cassandra-medusa` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cassandra-medusa/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[cassandra-medusa](https://github.com/thelastpickle/cassandra-medusa), is a Apache Cassandra Backup and Restore Tool.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cassandra-medusa:latest
```
<!--getting:end-->

<!--body:start-->

## Usage
Medusa for Apache Cassandra® is deployed by a K8ssandra Operator install, based on the Medusa Custom Resource Definition (CRD). Once K8ssandra Operato is deployed, you can refer to the [official documentation](https://docs.k8ssandra.io/tasks/backup-restore/) for further usage of Medusa 

To use our minimal, wolfi-based image with this Helm chart you'll need to override the image used by the official helm chart and specify the chainguard image as per below example:

```shell
helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install cassandra-medusa k8ssandra/k8ssandra-operator -n cassandra-medusa
helm upgrade k8ssandra-operator \
    -n cassandra-medusa \
    --set medusa.image.registry=cgr \
    --set medusa.image.repository=chainguard/cassandra-medusa \
    --set medusa.image.tag=latest \
    --wait \
    k8ssandra/k8ssandra-operator  
```

As per [project documentation](https://github.com/k8ssandra/k8ssandra-operator/blob/main/docs/content/en/install/local/single-cluster-helm/_index.md#deploy-cert-manager), by default, the Helm installation requires cert-manager to be present in the Kubernetes installation. If you do not have cert-manager installed, follow the steps at (https://cert-manager.io/docs/installation/helm/)[cert-manager's] documentation.
<!--body:end-->
