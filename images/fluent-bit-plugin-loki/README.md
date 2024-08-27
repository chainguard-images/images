<!--monopod:start-->
# fluent-bit-plugin-loki
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/fluent-bit-plugin-loki` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/fluent-bit-plugin-loki/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
The Fluent Bit Loki plugin allows you to send your log or events to a Loki service.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/fluent-bit-plugin-loki:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

### Docker

You can run a Fluent Bit container with the Loki output plugin pre-installed using the following command:

```bash
docker run -v /var/log:/var/log \
    -e LOG_PATH="/var/log/*.log" -e LOKI_URL="http://localhost:3100/loki/api/v1/push" \
    cgr.dev/chainguard/fluent-bit-plugin-loki:latest
```
The [GitHub repository](https://github.com/grafana/loki/tree/main/clients/cmd/fluent-bit) has more details on running the fluent-bit plugin.  
**Note:** The default loki plugin config can be found at `/fluent-bit/etc/fluent-bit-loki.conf`.

### Helm
The plugin can also be installed using the fluent-bit helm chart by configuring the image values:

```yaml
image:
  repository: cgr.dev/chainguard/fluent-bit-plugin-loki
  tag: latest
```
For detailed instructions on setting up the Fluent Bit Loki plugin, refer to the [Loki documentation](https://grafana.com/docs/loki/latest/send-data/fluentbit/).

<!--body:end-->
