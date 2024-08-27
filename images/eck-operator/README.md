<!--monopod:start-->
# eck-operator
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/eck-operator` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/eck-operator/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Elastic Cloud on Kubernetes
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/eck-operator:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

There are several ways to deploy the ECK operator. You can follow up the [Quickstart guide](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html) or you can use the [Helm Chart](https://artifacthub.io/packages/helm/elastic/eck-operator) available in Artifact Hub to deploy the operator.

The following example is going to show how to deploy the ECK operator using a its Helm Chart.

### Deploy the ECK operator using Helm

1. Add the Elastic Helm repository:

```bash
helm repo add elastic https://helm.elastic.co
```

2. Install the ECK operator:

```bash

helm install elastic-operator elastic/eck-operator --namespace elastic-system --set image.repository=cgr.dev/chainguard/eck-operator --set image.tag=latest
```

### Deploy an Elasticsearch cluster

1. Create a file called `elasticsearch.yaml` with the following content:

```yaml
apiVersion: elasticsearch.k8s.elastic.co/v1
kind: Elasticsearch
metadata:
  name: quickstart
spec:
  version: 8.13.3
  nodeSets:
  - name: default
    count: 1
    config:
      node.store.allow_mmap: false
```

2. Deploy the Elasticsearch cluster:

```
kubectl apply -f elasticsearch.yaml
```

3. Check the Elasticsearch cluster status:

```
kubectl get elasticsearch quickstart -o=jsonpath='{.status.phase}'
```

4. Access the Elasticsearch cluster:

```
kubectl port-forward service/quickstart-es-http 9200
```

5. Get the password for the `elastic` user:

```
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)
```

6. Access the Elasticsearch cluster using curl:

```
curl -u "elastic:$PASSWORD" -k "https://localhost:9200"
```

That's it! You have deployed an Elasticsearch cluster using the ECK operator.

<!--body:end-->
