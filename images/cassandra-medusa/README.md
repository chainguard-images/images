<!--monopod:start-->
# cassandra-medusa
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cassandra-medusa` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cassandra-medusa/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for cassandra-medusa

[cassandra-medusa](https://github.com/thelastpickle/cassandra-medusa), is a Apache Cassandra Backup and Restore Tool.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/cassandra-medusa:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage
Medusa for Apache Cassandra® is deployed by a K8ssandra Operator install, based on the Medusa Custom Resource Definition (CRD). Once K8ssandra Operator is deployed, you can refer to the [official documentation](https://docs.k8ssandra.io/tasks/backup-restore/) for further usage of Medusa 

To use our minimal, wolfi-based image with this Helm chart you'll need to override the image used by the official helm chart and specify the chainguard image as per below example:

```shell
kubectl create ns cassandra-medusa

helm repo add k8ssandra https://helm.k8ssandra.io/stable
helm repo update

helm install cassandra-medusa k8ssandra/k8ssandra-operator -n cassandra-medusa

# create a secret, needed for medusa
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
 name: medusa-bucket-key
 namespace: cassandra-medusa
type: Opaque
stringData:
 # Note that this currently has to be set to credentials!
 credentials: |-
   [default]
   aws_access_key_id = k8ssandra
   aws_secret_access_key = k8ssandra
EOF

# create a K8ssandraCluster using Chainguard's cassandra-medusa image
cat <<EOF | kubectl apply -n ${NAMESPACE} -f -
apiVersion: k8ssandra.io/v1alpha1
kind: K8ssandraCluster
metadata:
  name: demo
  namespace: "${NAMESPACE}"
spec:
  cassandra:
    serverVersion: "4.0.1"
    datacenters:
      - metadata:
          name: dc1
        size: 1
        storageConfig:
          cassandraDataVolumeClaimSpec:
            storageClassName: standard
            accessModes:
              - ReadWriteOnce
            resources:
              requests:
                storage: 5Gi
        config:
          jvmOptions:
            heapSize: 512M
        stargate:
          size: 1
          heapSize: 256M
  medusa:
    containerImage:
      registry: cgr.dev
      repository:chainguard
      name: cassandra-medusa
      tag: latest
      pullPolicy: Always
    storageProperties:
    #   storageProvider: s3_compatible
      bucketName: k8ssandra-medusa
      prefix: test
      storageSecretRef:
        name: medusa-bucket-key
    #   host: minio-service.minio.svc.cluster.local
    #   port: 9000
      secure: false
EOF
```

For further checks and operations on backup and restore with Medusa, please refere to this [official documentaion](https://docs.k8ssandra.io/tasks/backup-restore/)

As per [project documentation](https://github.com/k8ssandra/k8ssandra-operator/blob/main/docs/content/en/install/local/single-cluster-helm/_index.md#deploy-cert-manager), by default, the Helm installation requires cert-manager to be present in the Kubernetes installation. If you do not have cert-manager installed, follow the steps at (https://cert-manager.io/docs/installation/helm/)[cert-manager's] documentation.
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