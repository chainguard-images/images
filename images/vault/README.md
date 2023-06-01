<!--monopod:start-->
# vault
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/vault` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/vault.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Vault Server Image. **EXPERIMENTAL**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/vault:latest
```

## Using Vault

The Chainguard Vault image contains the [Vault](https://www.vaultproject.io/) server binary and supporting config. The image is intended to be a drop-in
replacement for the upstream [hashicorp/vault](https://hub.docker.com/r/hashicorp/vault) or
[vault](https://hub.docker.com/_/vault) images and compatible with the [official Helm
chart](https://github.com/hashicorp/vault-helm).

The default entrypoint starts a single-node instance of the server in development mode for testing and development. Note that the container must be given the IPC\_LOCK capability.

You can start the container with:

```shell
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

You can also supply config via the VAULT\_LOCAL\_CONFIG variable e.g:

```
$ docker run -e VAULT_LOCAL_CONFIG='{"cluster_name": "foo"}' cgr.dev/chainguard/vault server
```

### IPC\_LOCK Capability


If you run the container without IPC\_LOCK capabilitiy, you will get the following error:


```
$ docker run cgr.dev/chainguard/vault
Vault requires the IPC_LOCK capability. Use --cap-add IPC_LOCK or equivalent to run Vault.
If this isn't possible, use --user=root to disable IPC_LOCK.
```

IPC\_LOCK is required for the memory lock (mlock) feature that prevents memory -- possibly containing sensitive information -- being written to disk. For a full explanation of how it works, refer to the [documentation](https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-security-concerns#ensure-mlock-is-enabled).


The error can be easily fixed by running:

```
$ docker run --cap-add IPC_LOCK cgr.dev/chainguard/vault
```

Or by using the following securityContext in Kubernetes:

```
securityContext:
    runAsNonRoot: true
    runAsUser: 65532
    capabilities:
      add: ["IPC_LOCK"]
```

Alternatively, the entrypoint script will disable IPC\_LOCK automatically if run as the root user:

```
$ docker run --user=root cgr.dev/chainguard/vault
Couldn't start vault with IPC_LOCK. Disabling IPC_LOCK, please use --cap-add IPC_LOCK
==> Vault server configuration:
...


Be aware that this is not recommend by Vault.

### Differences to hashicorp/vault image

This image is not identical to the upstream image. In particular:

 - The vault binary has the IPC_LOCK capability set by default
 - The directory for configuration files is `/etc/vault`
 - The directory for filesystem driver (not used by default) is `/var/lib/vault`
 - The directory for logs (not used by default) is `/var/log/vault`
 - The vault binary and entrypoint script are stored in `/usr/bin`

This image supports the same environment variables as the
[hashicorp/vault](https://hub.docker.com/r/hashicorp/vault) image, with the exception of
`SKIP_SETCAP`.


### Persisting Storage Data

If using the file data storage plugin, please configure it to write to `/var/lib/vault`.

### Persisting Logs

By default logs will be streamed to stdout and stderr, but can be configured to write to
`/var/log/vault.


