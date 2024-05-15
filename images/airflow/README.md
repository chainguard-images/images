<!--monopod:start-->
# airflow
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/airflow` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/airflow/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
A minimal, [wolfi](https://github.com/wolfi-dev)-based image for Apache Airflow.[Apache Airflow](https://github.com/apache/airflow) is a platform to programmatically author, schedule, and monitor workflows.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/airflow:latest
```
<!--getting:end-->

<!--body:start-->
## Deploying Apache Airflow with Helm

Deploying Apache Airflow with Chainguard's images is straightforward using the official Airflow Helm chart.

First, add the Airflow Helm repository:

```bash
helm repo add airflow-stable https://airflow-helm.github.io/charts
```
Deploy Airflow using:

```bash
helm install airflow airflow-stable/airflow \
  --set env.AIRFLOW__CORE__FERNET_KEY="$(openssl rand -base64 32)" \
  --set image.repository=cgr.dev/chainguard/airflow \
  --set image.tag=latest
```

You can also customize your Helm deployment by editing the values.yaml after fetching the chart:

```helm fetch airflow-stable/airflow --untar```

Then edit values.yaml to use Chainguard's images/tags:

```bash 
image:
  repository: cgr.dev/chainguard/airflow
  tag: latest
```

Deploy your customized Helm chart:

```bash
helm install airflow .
```
For detailed instructions on deploying Apache Airflow via Helm, consult the official Apache Airflow Helm chart documentation.

Usage
With Apache Airflow running, access the web interface by navigating to http://localhost:8080. Login with the default credentials or the ones you have configured.

You can now manage workflows, create DAGs, and monitor your tasks.

<!--body:end-->
