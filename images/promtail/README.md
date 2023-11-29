<!--monopod:start-->
# promtail
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/promtail` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/promtail/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
This image contains the `promtail` application for log aggregation. `promtail` is the log aggregator that ships logs to Loki and/or Prometheus. It runs as an agent and scrapes logs from files, containers, and hosts and ships them to a logging backend.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/promtail:latest
```
<!--getting:end-->

<!--body:start-->
## Use It!

The image can be run directly and sets the promtail binary as the entrypoint with a default configuration:

```
docker run cgr.dev/chainguard/promtail:latest
level=info ts=2023-09-02T14:01:20.497084554Z caller=promtail.go:133 msg="Reloading configuration file" md5sum=64f8f10a58e874375abaf4e9f7632b07
level=info ts=2023-09-02T14:01:20.497604554Z caller=server.go:323 http=[::]:9080 grpc=[::]:41909 msg="server listening on addresses"
level=info ts=2023-09-02T14:01:20.497705346Z caller=main.go:174 msg="Starting Promtail" version="(version=2.8.4, branch=HEAD, revision=89d282c)"
level=warn ts=2023-09-02T14:01:20.497754387Z caller=promtail.go:265 msg="enable watchConfig"
```

This image is a drop-in replacement for official image at grafana/promtail.
See documentation [there](https://github.com/grafana/loki/blob/main/cmd/promtail/Dockerfile#L9) for how to configure it.
<!--body:end-->
