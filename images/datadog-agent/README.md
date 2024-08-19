<!--monopod:start-->
# datadog-agent
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/datadog-agent` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/datadog-agent/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based Datadog Agent to collect events and metrics from hosts and send them to Datadog.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/datadog-agent:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The Datadog Agent collects events and metrics from hosts and sends them to Datadog.

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
<!--body:end-->
