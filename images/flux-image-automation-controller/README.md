<!--monopod:start-->
# flux-image-automation-controller
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/flux-image-automation-controller` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/flux-image-automation-controller.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

## Get It

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/flux-image-automation-controller
```

## Usage

```
Usage of /usr/bin/image-automation-controller:
      --concurrent int                            The number of concurrent resource reconciles. (default 4)
      --enable-leader-election                    Enable leader election for controller manager. Enabling this will ensure there is only one active controller manager.
      --events-addr string                        The address of the events receiver.
      --feature-gates mapStringBool               A comma separated list of key=value pairs defining the state of experimental features.
      --health-addr string                        The address the health endpoint binds to. (default ":9440")
      --kube-api-burst int                        The maximum burst queries-per-second of requests sent to the Kubernetes API. (default 300)
      --kube-api-qps float32                      The maximum queries-per-second of requests sent to the Kubernetes API. (default 50)
      --leader-election-lease-duration duration   Interval at which non-leader candidates will wait to force acquire leadership (duration string). (default 35s)
      --leader-election-release-on-cancel         Defines if the leader should step down voluntarily on controller manager shutdown. (default true)
      --leader-election-renew-deadline duration   Duration that the leading controller manager will retry refreshing leadership before giving up (duration string). (default 30s)
      --leader-election-retry-period duration     Duration the LeaderElector clients should wait between tries of actions (duration string). (default 5s)
      --log-encoding string                       Log encoding format. Can be 'json' or 'console'. (default "json")
      --log-level string                          Log verbosity level. Can be one of 'trace', 'debug', 'info', 'error'. (default "info")
      --max-retry-delay duration                  The maximum amount of time for which an object being reconciled will have to wait before a retry. (default 15m0s)
      --metrics-addr string                       The address the metric endpoint binds to. (default ":8080")
      --min-retry-delay duration                  The minimum amount of time for which an object being reconciled will have to wait before a retry. (default 750ms)
      --no-cross-namespace-refs                   When set to true, references between custom resources are allowed only if the reference and the referee are in the same namespace.
      --ssh-hostkey-algos strings                 The list of hostkey algorithms to use for ssh connections, arranged from most preferred to the least.
      --ssh-kex-algos strings                     The list of key exchange algorithms to use for ssh connections, arranged from most preferred to the least.
      --watch-all-namespaces                      Watch for resources in all namespaces, if set to false it will only watch the runtime namespace. (default true)
      --watch-label-selector string               Watch for resources with matching labels e.g. 'sharding.fluxcd.io/shard=shard1'.
```
