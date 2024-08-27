<!--monopod:start-->
# management-api-for-apache-cassandra
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/management-api-for-apache-cassandra` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/management-api-for-apache-cassandra/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
RESTful / Secure Management Sidecar for Apache Cassandra
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/management-api-for-apache-cassandra:latest
```
<!--getting:end-->

<!--body:start-->

# Usage

You can run the Management API as a standalone Docker container:

 > docker run -p 8080:8080 -it --rm cgr.dev/chainguard/management-api-for-apache-cassandra:latest

 > curl http://localhost:8080/api/v0/probes/liveness
 OK

 # Check service and C* are running
 > curl http://localhost:8080/api/v0/probes/readiness
 OK

<!--body:end-->
