<!--monopod:start-->
# istio-proxy
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/istio-proxy` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/istio-proxy/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

This is the dataplane part of Istio, consisting of:
- A custom-built Envoy that contains Istio plugins (Wasm, telemetry)
- iptables to route inbound/outbound traffic through the Envoy proxy when acting as a sidecar
- pilot-agent to bootstrap the Envoy with some Istio-specific configurations
