<!--monopod:start-->
# cilium
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cilium` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/cilium/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for cilium

[Cilium](https://cilium.io/) is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/cilium:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
# Cilium images:

Cilium is open source software for transparently securing the network connectivity between application services deployed using Linux container management platforms like Docker and Kubernetes. At the foundation of Cilium is a new Linux kernel technology called eBPF, which enables the dynamic insertion of powerful security visibility and control logic within Linux itself. Because eBPF runs inside the Linux kernel, Cilium security policies can be applied and updated without any changes to the application code or container configuration.

Hubble is a fully distributed networking and security observability platform built on top of Cilium and eBPF to enable deep visibility into the communication and behavior of services as well as the networking infrastructure in a completely transparent manner.

Several cilium images here:

## cilium-agent

Cilium agents, the core data-plane component of Cilium, resides on every node within the cluster and implements the Kubernetes Container Networking Interface (CNI). It gathers configuration instructions through APIs or Kubernetes, defining the essential parameters for networking, network policies, load balancing, visibility, and monitoring.

Another key role for cilium agents is that embedded in them are the hubble servers, which provides visibility into network traffic and the overall health of a Kubernetes cluster.

## cilium-operator-generic

The Cilium operator is the control plane component of Cilium. It is responsible for managing Cilium resources across the cluster, such as NetworkPolicy, or IP address management.

Cloud-specific flavors of the Cilium operator exists, but the image here is the generic flavor of the Cilium operator.

## cilium-operator-aws

The Cilium operator is the control plane component of Cilium. It is responsible for managing Cilium resources across the cluster, such as NetworkPolicy, or IP address management.

This image is the AWS-specific flavor of the Cilium operator.

## cilium-hubble-relay

The Hubble Relay aggregates the observability provided by the Hubble servers (embedded in the Cilium agents) across the nodes. In other words is the Hubble component that brings multi-node support. It leverages the Peer service to obtain information about Hubble instances and consume their gRPC API in order to provide a more rich API that covers events from across the entire cluster (or even multiple clusters in a ClusterMesh scenario).

## cilium-hubble-ui-backend

The Hubble UI Backend component processes the data provided by the lower-level Hubble components (Relay, Server), and feed that to the Cilium Hubble UI.

## cilium-hubble-ui

The Hubble UI, a ReactJS app served by nginx, visually depicts the network connectivity, policies, and dependencies of the cluster in a user-friendly manner.
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