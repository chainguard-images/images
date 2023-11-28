<!--monopod:start-->
# timoni
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/timoni` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/timoni/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with `timoni` binary. `timoni` is a package manager for Kubernetes, powered by `cue` and inspired by `helm`.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/timoni:latest
```
<!--getting:end-->

<!--body:start-->
The image contains the `timoni`  binary and a few assorted runtime dependencies.

```
docker run cgr.dev/chainguard/timoni:latest
A package manager for Kubernetes powered by CUE.

Usage:
  timoni [command]

Available Commands:
  apply       Install or upgrade a module instance
  build       Build an instance from a module and print the resulting Kubernetes resources
  bundle      Commands for managing bundles
  completion  Generates completion scripts for various shells
  delete      Uninstall a module instance from the cluster
  help        Help about any command
  inspect     Commands for getting information about installed instances
  list        Prints a table of instances and their module version
  mod         Commands for managing modules
  status      Displays the current status of Kubernetes resources managed by an instance
  version     Print the client and API version information

Flags:
      --as string                      Username to impersonate for the operation. User could be a regular user or a service account in a namespace.
      --as-group stringArray           Group to impersonate for the operation, this flag can be repeated to specify multiple groups.
      --as-uid string                  UID to impersonate for the operation.
      --cache-dir string               Default cache directory (default "/home/nonroot/.kube/cache")
      --certificate-authority string   Path to a cert file for the certificate authority
      --client-certificate string      Path to a client certificate file for TLS
      --client-key string              Path to a client key file for TLS
      --cluster string                 The name of the kubeconfig cluster to use
      --context string                 The name of the kubeconfig context to use
      --disable-compression            If true, opt-out of response compression for all requests to the server
  -h, --help                           help for timoni
      --insecure-skip-tls-verify       If true, the server's certificate will not be checked for validity. This will make your HTTPS connections insecure
      --kubeconfig string              Path to the kubeconfig file to use for CLI requests.
      --log-color                      Adds colorized output to the logs. (defaults to false when no tty)
      --log-pretty                     Adds timestamps to the logs. (default true)
  -n, --namespace string               The instance namespace. (default "default")
  -s, --server string                  The address and port of the Kubernetes API server
      --timeout duration               The length of time to wait before giving up on the current operation. (default 5m0s)
      --tls-server-name string         Server name to use for server certificate validation. If it is not provided, the hostname used to contact the server is used
      --token string                   Bearer token for authentication to the API server
      --user string                    The name of the kubeconfig user to use
  -v, --version                        version for timoni

```
<!--body:end-->
