<!--monopod:start-->
# datadog-agent
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/datadog-agent` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/datadog-agent/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimalist Wolfi-based DataDog Agent to collect events and metrics and send to Datadog.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/datadog-agent:latest
```

## Usage

The Datadog Agent is software that runs on your hosts. It collects events and metrics from hosts and sends them to Datadog, where you can analyze your monitoring and performance data.

### Prerequisites

    * Create a Datadog account.
    * Have your Datadog API key on hand.

The DataDog Agent getting started guide is here: [docs.datadoghq.com/getting_started/agent/](https://docs.datadoghq.com/getting_started/agent/)

### Example Usage

```bash
docker run \
 --name dd-agent \
 -e DD_API_KEY=<xxxxxxxxxxxxxxxxxxx> \
 -e DD_SITE="datadoghq.com" \
 -e DD_APM_ENABLED=true \
 -e DD_APM_NON_LOCAL_TRAFFIC=true \
 -v /var/run/docker.sock:/var/run/docker.sock:ro \
 -v /proc/:/host/proc/:ro \
 -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
 -v /var/lib/docker/containers:/var/lib/docker/containers:ro \
 cgr.dev/chainguard/datadog-agent:latest
```

For more detail, please refer to the [DataDog Agent documentation](https://github.com/DataDog/datadog-agent).
