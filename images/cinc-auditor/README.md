<!--monopod:start-->
# cinc-auditor
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cinc-auditor` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/cinc-auditor/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Open source toolkit for applying Chef Inspec audit and test profiles.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->

## Compatibility Notes

The Chainguard `cinc-auditor` image is intended as a drop-in implementation of the upstream [CINC Auditor Toolkit](https://cinc.sh/start/auditor/).

To retrieve basic information about an InSpec profile, run a command like the following:

```shell
docker run --rm cgr.dev/ORGANIZATION/cinc-auditor:latest check /usr/share/chainguard-inspec/
```

```
Location :   /usr/share/chainguard-inspec/
Profile :    chainguard_stig_v3r2
Controls :   9
Timestamp :  2026-01-08T07:04:47+00:00
Valid :      true

No errors, warnings, or offenses
```

If you have an InSpec profile that you want to evaluate, you can first create a directory to store the files:

```shell
mkdir -p inspec-content
```

Then evaluate the InSpec profile by mounting the content directory into your container; for example

```shell
docker run --rm \
  -v $(pwd)/inspec-content:/inspec-content \
  cgr.dev/ORGANIZATION/cinc-auditor:latest \
  exec /inspec-content ---reporter cli --reporter json:/inspec-content/output.json
```

To evaluate a profile against a container, start the target container:

```shell
docker run --name target -d cgr.dev/chainguard/wolfi-base:latest tail -f /dev/null
```

Then run the cinc-auditor image at the target container using the `--target` argument to cinc-auditor (Note that the docker socket is being mounted into the cinc-auditor container, and the use of privilege.):

```shell
docker run -it --rm -u 0:0 --pid=host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/out:/out \
  cgr.dev/ORGANIZATION/cinc-auditor:latest \
  exec /usr/share/chainguard-inspec/ \
     --no-create-lockfile --reporter json:/out/output.json \
     --user root --target docker://target
```

The results will be in the `out/output.json` file. For output to the terminal, the argument `--reporter cli` can be given instead.

Finally, stop the target container.

### Auditing a container running in Kubernetes

The image also bundles the [`train-k8s-container`](https://github.com/mitre/train-k8s-container) transport plugin (along with `kubectl`), which lets cinc-auditor audit a container running in a Kubernetes pod by executing into it with `kubectl exec`. Select it with a `--target` (or `-t`) URI of the form `k8s-container://<namespace>/<pod>/<container>`.

cinc-auditor shells out to `kubectl`, so it needs network access to the cluster API server and a kubeconfig whose credentials can `get` pods and `create` on `pods/exec` in the target namespace. For example, mounting your local kubeconfig to audit a pod:

```shell
docker run --rm \
  -v $HOME/.kube/config:/tmp/kubeconfig:ro \
  -e KUBECONFIG=/tmp/kubeconfig \
  cgr.dev/ORGANIZATION/cinc-auditor:latest \
  exec /usr/share/chainguard-inspec/ \
    --no-create-lockfile --reporter cli \
    --target k8s-container://NAMESPACE/POD/CONTAINER
```

When running cinc-auditor as a pod inside the cluster instead, first build a kubeconfig from the pod's mounted service-account token (under `/var/run/secrets/kubernetes.io/serviceaccount/`): `kubectl` does not pick up in-cluster credentials automatically.

> [!NOTE]
> Many security scanning operations require elevated privileges or access to host system information. Consider using `--privileged` or specific capability flags when performing system scans.

<!--body:end-->

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._