<!--monopod:start-->
# cassandra
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/management-api-for-apache-cassandra` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/management-api-for-apache-cassandra/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Cassandra operations have historically been command line driven. The management of operational tools for Apache Cassandra have been mostly outsourced to teams who manage their specific environments.

The Management API is a sidecar service layer that attempts to build a well supported set of operational actions on Cassandra nodes that can be administered centrally. It currently works with official Apache Cassandra 3.11.x and 4.0 via a drop in java agent.

To get more detail on the Management API, please visit the [Management API GitHub repository](https://github.com/k8ssandra/management-api-for-apache-cassandra). 
<!--overview:end-->

<!--getting:start-->
## Get It!
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
