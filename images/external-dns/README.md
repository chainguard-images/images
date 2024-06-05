<!--monopod:start-->
# external-dns
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/external-dns` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/external-dns/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image to configure external DNS servers (AWS Route53, Google CloudDNS and others) for Kubernetes Ingresses and Services
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/external-dns:latest
```
<!--getting:end-->

<!--body:start-->
## Using External DNS

The Chainguard External DNS image is a drop-in replacement for the upstream image.
See the [upstream documentation](https://github.com/kubernetes-sigs/external-dns) for usage information specific to your environment.

```shell
$ docker run cgr.dev/chainguard/external-dns
usage: external-dns --source=source --provider=provider [<flags>]

ExternalDNS synchronizes exposed Kubernetes Services and Ingresses with DNS
providers.

Note that all flags may be replaced with env vars - `--flag` ->
`EXTERNAL_DNS_FLAG=1` or `--flag value` -> `EXTERNAL_DNS_FLAG=value`

Flags:
  --help                         Show context-sensitive help (also try
                                 --help-long and --help-man).
  --version                      Show application version.
  --server=""                    The Kubernetes API server to connect to
                                 (default: auto-detect)
  --kubeconfig=""                Retrieve target cluster configuration from
                                 a Kubernetes configuration file (default:
                                 auto-detect)
```
<!--body:end-->
