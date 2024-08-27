<!--monopod:start-->
# jitsucom-jitsu
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jitsucom-jitsu` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/jitsucom-jitsu/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Jitsu is an open-source Segment alternative. Fully-scriptable data ingestion engine for modern data teams. Set-up a real-time data pipeline in minutes, not days
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jitsucom-jitsu:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

There is no official Helm chart providied for Jitsu, but you can use the following Helm chart to deploy Jitsu on your Kubernetes cluster.

Here is the issue that they discussed: https://github.com/jitsucom/jitsu/issues/880

And here is the Helm chart that you can use: https://github.com/stafftastic/jitsu-chart 

which is the Helm chart we used to deploy Jitsu on Kubernetes during the tests.


```yaml
$ helm install jitsu oci://registry-1.docker.io/stafftasticcharts/jitsu -f-<<EOF
console:
  image:
    repository: cgr.dev/chainguard/jitsucom-console
    tag: latest
    pullPolicy: IfNotPresent
rotor:
  image:
    repository: cgr.dev/chainguard/jitsucom-rotor
    tag: latest
    pullPolicy: IfNotPresent
EOF
```

<!--body:end-->
