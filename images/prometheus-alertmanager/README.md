<!--monopod:start-->
# prometheus-alertmanager
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-alertmanager` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-alertmanager/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Prometheus Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-alertmanager:latest
```

## Usage

This image comes with a default example config file at `/etc/alertmanager/alertmanager.yml`.
The values from this example can be found in the [Prometheus source tree](https://github.com/prometheus/alertmanager/blob/main/examples/ha/alertmanager.yml).

The default command for this image uses that config file and sets a default storage path of `/alertmanager`.
Both of these can be overridden with command line flags.

THe default port that alertmanager listens on is 9093.
The web browser can be viewed locally over that port by mapping that in with `-p 9093:9093`.

To test:

```shell
% docker run -p 9093:9093 cgr.dev/chainguard/prometheus-alertmanager
ts=2023-03-05T17:09:57.255Z caller=main.go:240 level=info msg="Starting Alertmanager" version="(version=0.25.0, branch=main, revision=41eb1213bb1c7ce0aa9e6464e297976d9c81cfe5)"
ts=2023-03-05T17:09:57.255Z caller=main.go:241 level=info build_context="(go=go1.20.1, platform=linux/arm64, user=root@3bc4b531f75d, date=19700101-00:00:00)"
ts=2023-03-05T17:09:57.255Z caller=cluster.go:185 level=info component=cluster msg="setting advertise address explicitly" addr=172.17.0.2 port=9094
ts=2023-03-05T17:09:57.256Z caller=cluster.go:681 level=info component=cluster msg="Waiting for gossip to settle..." interval=2s
ts=2023-03-05T17:09:57.271Z caller=coordinator.go:113 level=info component=configuration msg="Loading configuration file" file=/etc/alertmanager/alertmanager.yml
ts=2023-03-05T17:09:57.271Z caller=coordinator.go:126 level=info component=configuration msg="Completed loading of configuration file" file=/etc/alertmanager/alertmanager.yml
ts=2023-03-05T17:09:57.273Z caller=tls_config.go:232 level=info msg="Listening on" address=[::]:9093
ts=2023-03-05T17:09:57.273Z caller=tls_config.go:235 level=info msg="TLS is disabled." http2=false address=[::]:9093
ts=2023-03-05T17:09:59.257Z caller=cluster.go:706 level=info component=cluster msg="gossip not settled" polls=0 before=0 now=1 elapsed=2.000545543s
```
