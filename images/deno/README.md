<!--monopod:start-->
# deno
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/deno` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/deno.svg) |
---
<!--monopod:end-->

Minimal container image for running deno apps

The image specifies a default non-root `deno` user (UID 65532), and a working directory at `/app`, owned by that `deno` user, and accessible to all users.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/deno:latest
```

## Usage Example

Navigate to the [`example/`](./example/) directory:

```
cd example/
```

The Dockerfile is based on [Deno's webserver tutorial](https://deno.land/manual@v1.28.3/examples/http_server), but packages it up into a Chainguard deno image.

Build the application on the deno base image.

```
docker build \
  --tag deno-docker \
  .
```

Then you can run the image:

```
docker run \
  --rm -it \
  -p 8080:8080 \
  deno-docker
```

...and test to see that it works:

```
$ curl localhost:8080
Your user-agent is:

curl/7.84.0%
```
