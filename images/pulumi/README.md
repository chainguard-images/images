<!--monopod:start-->
# pulumi
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/pulumi` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/pulumi/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for pulumi

Minimal Pulumi Image

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/pulumi:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

### Kubernetes Pod Example

In this directory, check the `examples/` folder.
You should find an example app for the following support Pulumi languages/runtimes:

- dotnet
- go
- java
- nodejs
- python
- yaml

This will show an example of using Pulumi SDKs to create an Nginx pod in
a kind cluster.

Try running these commands from this directory in the repo.

Set the desired language to the env var `TEST_LANG`:

```
export TEST_LANG=go
```

Start a kind cluster:

```
kind create cluster
```

Extract the kubeconfig, and modify it to use an internal IP:

```
KIND_IP="$(docker ps | grep 'control-plane' | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["kind"].IPAddress')"

mkdir .kube
kind get kubeconfig | yq '.clusters[].cluster.server = "https://'${KIND_IP}':6443"' \
    > ".kube/config"
```

Create a temporary Pulumi home directory, and do a local login:

```
mkdir .pulumi
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    cgr.dev/chainguard/pulumi:latest \
    login file://.
```

Decide a unique stack name:
```
export STACK_NAME="${TEST_LANG}-$(date +%s)"
```

Next, init a stack (for you decided language):

```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    cgr.dev/chainguard/pulumi:latest \
    stack init --non-interactive --stack ${STACK_NAME}
```

Note: for some runtimes, you may need to install language-specific dependencies ahead of time.
Here is an example of preinstalling Node.js dpendencies using `npm install`:

```
docker run --rm -w /work/smoketest-${lang} \
    -v "${TMPDIR}:/work" \
    --entrypoint npm \
    cgr.dev/chainguard/pulumi:latest \
    install
```

Finally, create the stack:

```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    -e KUBECONFIG=/work/.kube/config \
    cgr.dev/chainguard/pulumi:latest \
    up --yes --config name=${STACK_NAME}
```

You should notice a pod in the default namespace has been created:

```
$ kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
go-1683319492   1/1     Running   0          24s
```

To teardown the stack, run the following:
```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    -e KUBECONFIG=/work/.kube/config \
    cgr.dev/chainguard/pulumi:latest \
    destroy --yes
```

Now check for pods, there should not be any:
```
$ kubectl get pods
No resources found in default namespace.
```
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