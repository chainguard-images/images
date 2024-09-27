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
# Chainguard Image for eck-operator

Elastic Cloud on Kubernetes

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/eck-operator:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.