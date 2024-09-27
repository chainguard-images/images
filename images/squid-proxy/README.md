<!--monopod:start-->
# squid-proxy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/squid-proxy` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/squid-proxy/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for squid-proxy

Squid Proxy is an open-source, high-performance, and highly configurable caching and forwarding web proxy. It is widely used for speeding up web servers by caching web, DNS, and other computer network lookups for a group of people sharing network resources, and for aiding security by filtering traffic.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/squid-proxy:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
This image provides a high-performance Squid proxy server suitable for a wide range of caching and forwarding requirements. It is a drop-in replacement for traditional Squid proxy images but is enhanced for security and minimized to reduce its attack surface. Ideal for both development and production environments where a proxy server is required.

Note: We are running this image as non-root user called `squid` by default for more security.

## Usage

### Running the Squid Proxy Container
To run the squid-proxy container with default settings:

```bash
docker run --rm -p 3128:3128 cgr.dev/chainguard/squid-proxy:latest
```

#### Testing it with curl

```bash
export PROXY_HOST="localhost"
export PROXY_PORT="3128"
export URL="http://example.com"

curl -x http://"$PROXY_HOST":"$PROXY_PORT" "$URL" -o /dev/null -w '%{http_code}\n' -s
```

You will get a 403 response on this very likely, because of ACL on the default `/etc/squid.conf`. Access Control Lists (ACLs) in `squid.conf` are a crucial part of Squid's configuration. They allow you to define rules that grant or deny access to internet resources based on various criteria such as source IP, destination IP, URLs, protocols, and more.

Log may not be visible with default configuration, you can set it using the below custom configuration.

### Custom Configuration For Docker

Add the following lines to the 'squid.conf' to redirect the logs to the '/dev/stdout':

```
http_port 3128
logfile_rotate 0
cache_log stdio:/dev/stdout
access_log stdio:/dev/stdout
cache_store_log stdio:/dev/stdout
```

For custom configurations, mount your squid.conf file into the container:

```bash
docker run --rm -v /path/to/your/squid.conf:/etc/squid.conf -p 3128:3128 cgr.dev/chainguard/squid-proxy:latest
```

### Custom Configuration For Kubernetes

For working in Kubernetes, you can also run a parallel container in a pod containing squid container. This container will tail these (/var/log/squid/{cache,access}.log or any other) logs on its stdout.

```yaml
---
kind: Pod
apiVersion: v1
metadata:
  name: squid-proxy
  labels:
    app: squid
spec:
  volumes:
  - name: log-dir
    emptyDir: {}
  containers:
  - name: squid
    image: cgr.dev/chainguard/squid-proxy:latest
    volumeMounts:
    - name: log-dir
      mountPath: "/var/log/squid/"
  - name: tailer
    image: busybox
    command:
    - "/bin/sh"
    - "-c"
    args:
    - tail -F /var/log/squid/access.log
    volumeMounts:
    - name: log-dir
      mountPath: "/var/log/squid/"
```

For more detailed instructions and advanced configurations, refer to the [Squid Official Documentation](https://www.squid-cache.org/Doc/).
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