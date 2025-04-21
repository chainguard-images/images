<!--monopod:start-->
# haproxy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/haproxy` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/haproxy/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for haproxy

A minimal [haproxy](https://www.haproxy.org/) base image rebuilt every night from source.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/haproxy:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard’s HAProxy container image is a minimal image that comes in two variants: a `-slim` version that only contains the `haproxy` binary, as well as a regular version that contains a `docker-entrypoint.sh` script that is compatible with the external `docker-library/haproxy` image for use with Helm charts or established Docker based deployments.

## Getting Started

Similar to the `docker-library/haproxy` container image, this image does not come with any default configuration.

Let say you have a `haproxy.cfg` config file in the current working directory. To test that configuration file, you can run the following command:

```shell
docker run -it --rm -v "$(pwd):/etc/haproxy" --name haproxy-syntax-check cgr.dev/ORGANIZATION/haproxy haproxy -c -f /etc/haproxy/haproxy.cfg
```

In order for the container to work, you need to mount your custom `haproxy.cfg` file in the container. The following example runs HAProxy with a custom configuration file:

```
docker run -it --rm -v "$(pwd):/etc/haproxy" cgr.dev/ORGANIZATION/haproxy haproxy -f /etc/haproxy/haproxy.cfg
```

### Helm install

When installing in Kubernetes, `securityContexts` that drop `[ "ALL" ]` capabilities interfere with the `setcap` privileged `haproxy`. In order to support Kubernetes based installs which default to dropping `ALL` capabilities, the necessary modifications must be made to add back `NET_ADMIN` capabilities.

For example, in the `ha-redis` chart used by `argocd`, the `values.yaml` becomes:

```yaml
# values.yaml
haproxy:
  enabled: true
  containerSecurityContext:
    capabilities:
      add:
        - NET_BIND_SERVICE
```

### Note on adding users

By default, the Chainguard HAProxy container image runs as the `haproxy` user and group, with a UID and GID of `65532`. You could represent this in an `haproxy.cfg` file as follows:

```
global
  user  haproxy
  group haproxy
```

In the Kubernetes security context, this information might look like this:

```
securityContext:
  runAsUser: 65532
  runAsGroup: 65532
```

If you add a user, make sure that you use the correct matching user in your `haproxy.cfg` file. If the user listed in your `haproxy.cfg` file doesn't match what's in the Kubernetes security context, it will result in errors. 


## Documentation and Resources

Please refer to [the HAProxy documentation](https://docs.haproxy.org/) for more information on configuring HAProxy for your needs.

<!--body:end-->

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._