<!--monopod:start-->
# newrelic-nri-statsd
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/newrelic-nri-statsd` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/newrelic-nri-statsd/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
The StatsD integration lets you easily get StatsD data into New Relic
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/newrelic-nri-statsd:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

To run the container, you can use the following command:

```bash
docker run \
  -d --restart unless-stopped \
  --name newrelic-statsd \
  -h $(hostname) \
  -e NR_ACCOUNT_ID=YOUR_ACCOUNT_ID \
  -e NR_API_KEY=NEW_RELIC_LICENSE_KEY \
  -p 8125:8125/udp \
  cgr.dev/chainguard/newrelic-nri-statsd:latest
```

Here is the link to get more detail about it, [official documentation](https://docs.newrelic.com/docs/more-integrations/open-source-telemetry-integrations/statsd/statsd-monitoring-integration/).


<!--body:end-->
