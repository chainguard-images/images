<!--monopod:start-->
# opensearch-dashboards
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/opensearch-dashboards` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/opensearch-dashboards/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with OpenSearch Dashboards
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/opensearch-dashboards:latest
```
<!--getting:end-->

<!--body:start-->
## Using OpenSearch Dashboards

Chainguard OpenSearch images include the `opensearch` package and helper scripts which can be used to start up or configure OpenSearch.

The full list of included tools is:

```shell
$ ls /usr/share/opensearch-dashboards/bin/
opensearch-dashboards      opensearch-dashboards-plugin      opensearch-dashboards-keystore      use_node
```

The default entrypoint is set to run the included `/usr/share/opensearch-dashboards/opensearch-dashboards-docker-entrypoint.sh` script.

To get started:

Install OpenSearch and then OpenSearch Dashboards.

1. Add the OpenSearch Helm Repository

```shell
helm repo add opensearch https://opensearch-project.github.io/helm-charts
```

2. Create Your Custom OpenSearch Values File

Create a custom values file to specify the configuration for your OpenSearch deployment. Below are the contents you'll use for this example. Copy the following configuration into a file named `values-opensearch.yaml`.

```yaml
singleNode: true # useful for single node testing
majorVersion: "2"
image:
  repository: cgr.dev/chainguard/opensearch
  tag: latest
```

3. Install OpenSearch with Helm
Now, you're ready to install OpenSearch using the Helm chart and your custom values file. Run the following command to start the deployment:
```shell
helm install opensearch opensearch/opensearch -f values-opensearch.yaml
```

4. Create Your Custom OpenSearch Dashboard Values File `values-opensearch-dashboard.yaml`.

```yaml
singleNode: true
majorVersion: "2"
image:
  repository: cgr.dev/chainguard/opensearch-dasboards
  tag: latest
startupProbe:
  timeoutSeconds: 10
  initialDelaySeconds: 20
```

5. Install OpenSearch Dasboards with Helm
```shell
helm install opensearch-dashboards opensearch/opensearch-dashboards  -f values-opensearch-dashboard.yaml
```

6. Access the UI using an ingress controller or kubectl port-forward
```
kubectl port-forward svc/opensearch-dashboards 5601:5601
```

7. Access the Dashboard 

Visit http://localhost:5601

8. Login in 

Using default setup credentials `admin`/`admin`

<!--body:end-->
