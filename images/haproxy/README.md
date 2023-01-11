<!--monopod:start-->
# haproxy
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/haproxy` |
| **Variants/Tags** | `latest` |
---
<!--monopod:end-->



A minimal haproxy base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/haproxy:latest
```

## Usage

Similar to the `docker-library/haproxy` image, this image does not come with any default configuration.

Please refer to [upstream's excellent (and comprehensive) documentation](https://docs.haproxy.org/) on the subject of configuring HAProxy for your needs.

To test configuration file:

```
docker run -it --rm -v "$(pwd)/my-test-config.cfg:/etc/haproxy/haproxy.cfg" --name haproxy-syntax-check cgr.dev/chainguard/haproxy haproxy -c -f /etc/haproxy/haproxy.cfg
```

