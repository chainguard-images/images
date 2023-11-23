<!--monopod:start-->
# vault
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/vault` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/vault/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Vault Server Image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vault:latest
```
<!--getting:end-->

<!--body:start-->
## Using Vault

The Chainguard Vault image contains the [Vault](https://www.vaultproject.io/) server binary and supporting config. The image is intended to be a drop-in
replacement for the upstream [hashicorp/vault](https://hub.docker.com/r/hashicorp/vault) or
[vault](https://hub.docker.com/_/vault) images and compatible with the [Hashicorp Helm
chart](https://github.com/hashicorp/vault-helm).

The default entrypoint starts a single-node instance of the server in development mode for testing
and development. Note that the container should be given the `IPC_LOCK` capability.

You can start the container with:

```
$ docker run --cap-add IPC_LOCK cgr.dev/chainguard/vault
==> Vault server configuration:

             Api Address: http://0.0.0.0:8200
                     Cgo: disabled
         Cluster Address: https://0.0.0.0:8201
   Environment Variables: GODEBUG, HOME, HOSTNAME, PATH, PWD, SHLVL, SSL_CERT_FILE
              Go Version: go1.20.4
              Listener 1: tcp (addr: "0.0.0.0:8200", cluster address: "0.0.0.0:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level:
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.13.2

==> Vault server started! Log data will stream in below:
...
```

To configure Vault for production or other environments, supply a configuration file in the `/etc/vault` directory e.g:

```shell
$ docker run -v $PWD/vault.hcl:/etc/vault/vault.hcl cgr.dev/chainguard/vault server
```

You can also supply config via the `VAULT_LOCAL_CONFIG` variable e.g:

```
$ docker run --cap-add=IPC_LOCK -e 'VAULT_LOCAL_CONFIG={"storage": {"file": {"path": "/var/lib/vault"}}, "listener": [{"tcp": { "address": "0.0.0.0:8200", "tls_disable": true}}], "default_lease_ttl": "168h", "max_lease_ttl": "720h", "ui": true}' -p 8200:8200 cgr.dev/chainguard/vault server
```

### Helm Chart Usage

This image and the [vault-k8s image](https://github.com/chainguard-images/images/tree/main/images/vault-k8s) can be used with the [Hashicorp Helm chart](https://github.com/hashicorp/vault-helm). To replace the official
images with the Chainguard images, provide the chart with the following values:

```
injector:
  image:
    repository: "cgr.dev/chainguard/vault-k8s"
    tag: "latest"

  agentImage:
    repository: "cgr.dev/chainguard/vault"
    tag: "latest"

server:
  image:
    repository: "cgr.dev/chainguard/vault"
    tag: "latest"
```

Assuming these values are saved in `cgr_values.yaml`, you should be able to run:

```
$ helm repo add hashicorp https://helm.releases.hashicorp.com
$ helm install vault hashicorp/vault --values cgr_values.yaml
```

### IPC\_LOCK Capability

If you run the container without `IPC_LOCK` capabilitiy, you will get the following warning:


```
Couldn't start vault with IPC_LOCK. Disabling IPC_LOCK, please use --cap-add IPC_LOCK
==> Vault server configuration:
...
```

`IPC_LOCK` is required for the memory lock (mlock) feature that prevents memory -- possibly containing sensitive information -- being written to disk. For a full explanation of how it works, refer to the [documentation](https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-security-concerns#ensure-mlock-is-enabled).


The error can be easily fixed by running:

```
$ docker run --cap-add IPC_LOCK cgr.dev/chainguard/vault
```

Or by using the following `securityContext` in Kubernetes:

```
securityContext:
    runAsNonRoot: true
    runAsUser: 65532
    capabilities:
      add: ["IPC_LOCK"]
```

### User

The image starts as root and switches to the lower privileged `vault` user in the entrypoint
script.

### Differences to hashicorp/vault image

This image is not identical to the hashicorp/vault image. In particular:

 - The directory for configuration files is `/etc/vault`
 - The directory for filesystem driver (not used by default) is `/var/lib/vault`
 - The directory for logs (not used by default) is `/var/log/vault`
 - The vault binary and entrypoint script are stored in `/usr/bin`
 - The underlying OS is [Wolfi](https://wolfi.dev) (which is glibc based) whereas the Hashicorp image uses Alpine (which is musl based)

This image supports the same environment variables as the
[hashicorp/vault](https://hub.docker.com/r/hashicorp/vault) image.

### Persisting Storage Data

If using the file data storage plugin, please configure it to write to `/var/lib/vault`.

### Persisting Logs

By default logs will be streamed to stdout and stderr, but can be configured to write to
`/var/log/vault`.
<!--body:end-->
