<!--monopod:start-->
# kibana
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kibana` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kibana/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Your window into the Elastic Stack.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kibana:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

Note that Kibana only supports running the same major version as its backend Elasticsearch container, so be sure to run 8.x Kibana with an 8.x version of Elasticsearch. See the [Kibana Guide](https://www.elastic.co/guide/en/kibana/master/setup.html#elasticsearch-version) for more details.
<!--compatibility:end-->

<!--body:start-->
For details on how to run Kibana, refer to the Elastic documentation on [Installing Kibana with Docker](https://www.elastic.co/guide/en/kibana/master/docker.html).
<!--body:end-->
