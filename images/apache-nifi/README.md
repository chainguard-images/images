<!--monopod:start-->
# apache-nifi
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/apache-nifi` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/apache-nifi/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Apache NiFi was made for dataflow. It supports highly configurable directed graphs of data routing, transformation, and system mediation logic.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/apache-nifi:latest
```
<!--getting:end-->

<!--body:start-->
### Usage

To get started with Chainguard's NiFi image, run it with Docker:

```bash
docker run -p 8443:8443 --name nifi cgr.dev/chainguard/apache-nifi:latest
```

NiFi will take a moment to start. Once it is finished, you'll see a message stating the Web UI is available:
     
```
NiFi has started. The UI is available at the following URLs
```

To obtain the username and password, check the Docker logs:

```bash
docker logs nifi | grep Generated
```

You can now access the Web UI at [localhost:8443](https://localhost:8443).

A user guide for NiFi can be found [here](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html).

<!--body:end-->
