<!--monopod:start-->
# prometheus-redis-exporter
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-redis-exporter` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/prometheus-redis-exporter.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

A redis exporter for Prometheus.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-redis-exporter
```

## Using Redis Exporter

By default the prometheus-redis-exporter serves on port 0.0.0.0:9121 at /metrics:

```sh
docker run -p 9121:9121 cgr.dev/chainguard/prometheus-redis-exporter:latest
```

```sh
$ docker run -p 9121:9121 cgr.dev/chainguard/prometheus-redis-exporter:latest
INFO[0000] Redis Metrics Exporter v1.50.0    build date: 2023-05-24-03:16:53    sha1: b5e02003cea4b73054abe29433c264dec16cc1f0    Go: go1.20.4    GOOS: linux    GOARCH: amd64 
INFO[0000] Providing metrics at :9121/metrics   
```

## Users and Directories

By default this image runs as a non-root user named `nonroot` with a uid of 65532.
