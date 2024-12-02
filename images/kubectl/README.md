<!--monopod:start-->
# kubectl
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kubectl` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kubectl/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kubectl

Minimal image with kubectl binary.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kubectl:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

The `kubectl` Chainguard Image provides a low-to-zero CVE environment for [`kubectl`](https://kubernetes.io/docs/reference/kubectl/) suitable for integrating into Kubernetes CI or testing workflows.

## Configuration

To load your own global configuration file, you can set the `KUBECONFIG` environment variable and mount a configuration file on your host machine to the specified location on the container using a volume.

The command below sets the `KUBECONFIG` environment variable to `.kube/config` within the `nonroot` home folder, initializes a volume at that location, and runs the container with a command that prints the current configuration. Make sure to replace $ORGANIZATION with the name of your organization.

```sh
docker run \
 -e KUBECONFIG=/home/nonroot/.kube/config \
 -v $PWD/config:/home/nonroot/.kube/config \
 cgr.dev/$ORGANIZATION/kubectl:latest-dev config view
```

If you would prefer to test this command without using your own configuration file, you can create a default `config` file in your current working directory as below:

```sh
cat << 'EOF' > config
apiVersion: v1
clusters: null
contexts: null
current-context: ""
kind: Config
preferences: {output=json}
users: null
EOF
```

## Getting Started

### Adding to a Kubernetes Cluster

In this example, we'll add the Kubectl Chainguard Image to a Kubernetes cluster. To follow this example, you'll need to install the following software to your host machine:


- [`kind`](https://kind.sigs.k8s.io/docs/user/quick-start#installation). 
- [`chainctl`](https://edu.chainguard.dev/chainguard/administration/how-to-install-chainctl)
- [`kubectl`]( https://kubernetes.io/docs/tasks/tools/)

Once the `kind` utility for creating local Kubernetes clusters is installed and on your path, create a new cluster with the following command:

```sh
kind create cluster
```

This will create a cluster with the default name `kind`.

Next, we'll need to download a pull token using Chainguard's [`chainctl`](https://edu.chainguard.dev/chainguard/administration/how-to-install-chainctl) utility. This will allow us to access your organization's Chainguard Images in environments that do not support OIDC, such as a Kubernetes cluster.

Run the following to generate a pull token:

```
chainctl auth configure-docker --pull-token --save
```

You will need to select your organization name from the menu and confirm the creation of the pull token. This will save your pull token to your Docker configuration, typically at `~/.docker/config.json`.

Now use [kubectl](https://kubernetes.io/docs/tasks/tools/) on your host machine to load the pull token as a secret. The following assumes your current working directory is your home directory, and depending on your system and configuration you may need to update the path to the `config.json`.


```
kubectl create secret generic cgsecret \
 --from-file=.dockerconfigjson=./.docker/config.json \
 --type=kubernetes.io/dockerconfigjson
```

Next, we'll run a shell command to create a configuration for the pod for our `kubectl ` Chainguard Image container. First, set your organization name as an environment variable:

```sh
ORGANIZATION=my-organization
```

Then run the following command to create the pod configuration file:


```sh
cat << EOF > kubectl.yaml
apiVersion: v1
kind: Pod
metadata:
  name: kube-pod
spec:
  containers:
  - name: kubectl-container
    image: cgr.dev/$ORGANIZATION/kubectl
    command: ["/usr/bin/kubectl", "version"]
  imagePullSecrets:
  - name: cgsecret
EOF
```

The above provides configuration for a pod that will pull the `kubectl` Chainguard Image from your organization, then run a container with a command that outputs the current `kubectl` version.

Run the following to create the pod using the configuration file:

```sh
kubectl create -f kubectl.yaml
```

The pod should now be created. Run the following command to see information on the pod and associated container:

```sh
kubectl describe pod kube-pod
```

```
Name:             kube-pod
Namespace:        default
Priority:         0
Service Account:  default
Node:             kind-control-plane/172.19.0.2
Start Time:       Tue, 26 Nov 2024 16:30:24 -0500
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.0.4
IPs:
  IP:  10.244.0.4
Containers:
  kubectl-container:
    Container ID:  containerd://e9bc0e28ae161ff9ce84842f560478728c5986ff2dc2a41f02e90b49a3919211
    Image:         cgr.dev/$ORGANIZATION/kubectl
    Image ID:      cgr.dev/$ORGANIZATION/kubectl@sha256:034d5e90723d49a31e6e98ad9ad787946143e9ea7a3728bfb38645d99305dc52
    Port:          <none>
    Host Port:     <none>
    Command:
      /usr/bin/kubectl
      version
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
...
```

In the configuration file, we provided the `/usr/bin/kubectl version` command. The above output shows this command completed. We can view the output of the command:

```sh
kubectl logs kube-pod
```

```
Client Version: v1.31.3
Kustomize Version: v5.4.2
Server Version: v1.30.0
```

The `kubectl` Chainguard Image has now been loaded into the cluster and used to run a command. To access cluster information from the container, you will need to [configure a security context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for the pod or container.

Once you're finished testing, you can shut down and delete the example `kind` cluster with the following command:

```sh
kind delete cluster
```

## Documentation and Resources

- [Chainguard Academy: Authenticating to Chainguard Registry with a Pull Token](https://edu.chainguard.dev/chainguard/chainguard-registry/authenticating/#authenticating-with-the-chainctl-credential-helper)
- [Kubernetes Reference: Kubectl Documentation](https://kubernetes.io/docs/reference/kubectl/)
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
