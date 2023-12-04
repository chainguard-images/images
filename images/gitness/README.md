<!--monopod:start-->
# gitness
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gitness` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/gitness/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with the `gitness` [server application](https://github.com/harness/gitness).
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gitness:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

To run `gitness`:

```
$ docker run -d \
  -p 3000:3000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /tmp/gitness:/data \
  --name gitness \
  --restart always \
  cgr.dev/chainguard/gitness

$ docker logs gitness
{"level":"info","time":"2023-09-30T16:31:40.085883346Z","message":"No valid profiler so skipping profiling ['']"}
{"level":"info","time":"2023-09-30T16:31:40.099510346Z","message":"Completed setup of system service 'gitness' (id: 1)."}
{"level":"info","time":"2023-09-30T16:31:40.100499137Z","message":"Completed setup of pipeline service 'pipeline' (id: 2)."}
{"level":"info","port":3000,"revision":"","repository":"","version":"0.0.0","time":"2023-09-30T16:31:40.100514721Z","message":"server started"}
{"level":"info","time":"2023-09-30T16:31:40.100516221Z","message":"gitrpc server started"}
{"level":"info","time":"2023-09-30T16:31:40.100517471Z","message":"gitrpc cron manager subroutine started"}
time="2023-09-30T16:31:40Z" level=debug msg="poller: request stage from remote server" thread=2
time="2023-09-30T16:31:40Z" level=debug msg="poller: request stage from remote server" thread=1
{"level":"info","time":"2023-09-30T16:31:41.560373846Z","message":"added 0 new entries to plugins"}
```

The server should then be available at `localhost:3000`.
<!--body:end-->
