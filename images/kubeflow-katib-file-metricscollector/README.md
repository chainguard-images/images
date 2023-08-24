<!--monopod:start-->
# kubeflow-katib-file-metricscollector
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/kubeflow-katib-file-metricscollector` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kubeflow-katib-file-metricscollector/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal [file-metricscollector](https://github.com/kubeflow/katib/tree/master/cmd/metricscollector/v1beta1/file-metricscollector) image.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kubeflow-katib-file-metricscollector
```

## Usage

See the [Metrics Collector Sidecar settings](https://www.kubeflow.org/docs/components/katib/katib-config/#metrics-collector-sidecar-settings), for more details.

```shell
  -f string
    	Metric filters
  -format string
    	Metrics File Format
  -m string
    	Metric names
  -o-type string
    	Objective type
  -p duration
    	Poll interval between running processes check (default 1s)
  -path string
    	Metrics File Path
  -s-db string
    	Katib DB Manager service endpoint
  -s-earlystop string
    	Katib Early Stopping service endpoint
  -stop-rule value
    	The list of early stopping stop rules
  -t string
    	Trial Name
  -timeout duration
    	Timeout before invoke error during running processes check
  -w string
    	Whether wait for all other main process of container exiting (default "true")
```
