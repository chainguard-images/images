<!--monopod:start-->
# apache-superset
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/apache-superset` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/apache-superset/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A minimal, [wolfi](https://github.com/wolfi-dev)-based image for Apache Superset. [Apache Superset](https://github.com/apache/superset/tree/master)is a Data Visualization and Data Exploration Platform
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/apache-superset:latest
```
<!--getting:end-->

<!--body:start-->
## Deploying Apache Superset with Helm

Deploying Apache Superset with Chainguard's images is straightforward using the official Superset Helm chart.

First, add the Superset Helm repository:

```bash
helm repo add superset https://apache.github.io/superset

# Deploy Superset using:

helm install superset superset/superset \
  --set extraSecretEnv.SUPERSET_SECRET_KEY="$(openssl rand -base64 42)" \
  --set image.repository=cgr.dev/chainguard/superset \
  --set image.tag=latest
```

You can also customize your Helm deployment by editing the values.yaml after fetching the chart:

helm fetch superset/superset --untar
Then edit values.yaml to use Chainguard's images/tags:

```
image:
  repository: cgr.dev/chainguard/apache-superset
  tag: latest
```
Deploy your customized Helm chart:

```
helm install superset .
```

For detailed instructions on deploying Apache Superset via Helm, consult the official Apache Superset Helm chart documentation.

## Deploying Apache Superset with Docker Compose
Superset also provides a Docker Compose setup, which can be customized to use Chainguard images. Start by downloading the official Superset Docker Compose configuration from their GitHub:

```bash
wget https://github.com/apache/superset/blob/master/docker-compose.yml
```
Modify the docker-compose.yml to use Chainguard's images:

```
services:
  superset:
    image: cgr.dev/chainguard/apache-superset:latest
```
Then, start your Superset instance:

```
docker-compose up
```

## Usage
With Apache Superset running, access the web interface by navigating to http://localhost:8088. Login with the default credentials or the ones you have configured.

You can now manage databases, create visualizations, and configure your dashboards.

<!--body:end-->
