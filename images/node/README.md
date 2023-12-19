<!--monopod:start-->
# node
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/node` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/node/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal container image for running NodeJS apps
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

The image specifies a default non-root `node` user (UID 65532), and a working directory at `/app`, owned by that `node` user, and accessible to all users.

It specifies `NODE_PORT=3000` by default.

<!--compatibility:end-->

<!--body:start-->
## Node Application Example

This brief example is derived from our [Getting Started with Node](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-node/) guide which is itself based on the [Docker Node example](https://docs.docker.com/language/nodejs/containerize/).

Here, we'll assume you have a node app that you want to containerize and run. You can check out [Step 1 of the Getting Started with Node guide](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-node/#step-1-setting-up-a-demo-application) for instructions on setting up an example Node app.

Navigate to your application directory. Ensure your Dockerfile uses the Chainguard `node` base image.

```sh
nano Dockerfile
```
```Dockerfile
FROM cgr.dev/chainguard/node:latest
... 
```

Next, build the application. Note that this example tags the resulting image with `node-docker`.

```sh
docker build . -t node-docker
```

Then you can run the image. This example runs an image tagged `node-docker`. It also sets up a port redirect to receive requests on `localhost:8000`. Be aware that it will block your terminal, which will show the application waiting for connections on port `8000` from within the container. 

```sh
docker run --rm -it -p 8000:8000 node-docker
```

Run the following `curl` command in another terminal window to test that the container is able to receive requests on `localhost:8000`. 

```sh
curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
```

<!--body:end-->
