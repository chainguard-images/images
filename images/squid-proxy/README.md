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
Squid Proxy is an open-source, high-performance, and highly configurable caching and forwarding web proxy. It is widely used for speeding up web servers by caching web, DNS, and other computer network lookups for a group of people sharing network resources, and for aiding security by filtering traffic.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/squid-proxy:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

Squid Proxy is compatible with a wide range of operating systems including Linux, *BSDs, macOS, and Windows. It supports HTTP, HTTPS, FTP, and more. For detailed compatibility information, refer to the specific version documentation.
<!--compatibility:end-->

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
