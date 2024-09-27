<!--monopod:start-->
# vault
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/vault` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/vault/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for vault

Vault Server Image

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/vault:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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