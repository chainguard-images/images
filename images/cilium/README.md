<!--monopod:start-->
# cilium
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/cilium` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cilium/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Cilium](https://cilium.io/) is an open source, cloud native solution for providing, securing, and observing network connectivity between workloads using eBPF
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cilium:latest
```
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

## cilium-hubble-relay

The Hubble Relay aggregates the observability provided by the Hubble servers (embedded in the Cilium agents) across the nodes. In other words is the Hubble component that brings multi-node support. It leverages the Peer service to obtain information about Hubble instances and consume their gRPC API in order to provide a more rich API that covers events from across the entire cluster (or even multiple clusters in a ClusterMesh scenario).

## cilium-hubble-ui-backend

The Hubble UI Backend component processes the data provided by the lower-level Hubble components (Relay, Server), and feed that to the Cilium Hubble UI.

## cilium-hubble-ui

The Hubble UI, a ReactJS app served by nginx, visually depicts the network connectivity, policies, and dependencies of the cluster in a user-friendly manner.
<!--body:end-->
