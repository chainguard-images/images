<!--monopod:start-->
# minio
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/minio` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/minio/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with Minio.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/minio:latest
```
<!--getting:end-->

<!--body:start-->
## Using Minio

The Chainguard Minio image contains the `minio` server binary.
The default entrypoint just runs the `minio` binary without any flags.

```shell
$ docker run cgr.dev/chainguard/minio
NAME:
  minio - High Performance Object Storage

DESCRIPTION:
  Build high performance data infrastructure for machine learning, analytics and application data workloads with MinIO

USAGE:
  minio [FLAGS] COMMAND [ARGS...]

COMMANDS:
  server  start object storage server

FLAGS:
  --certs-dir value, -S value  path to certs directory (default: "/root/.minio/certs")
  --quiet                      disable startup and info messages
  --anonymous                  hide sensitive information from logging
  --json                       output logs in JSON format
  --help, -h                   show help
  --version, -v                print the version

VERSION:
  DEVELOPMENT.2023-03-24T21-41-23Z
```

To start minio in a server configuration, make sure to override the `MINIO_ROOT_USER` and `MINIO_ROOT_PASSWORD` environment variables,
and pass a data volume to the `server` command.

```shell
$ docker run -v $(pwd):/data -e MINIO_ROOT_USER=MYNAME -e MINIO_ROOT_PASSWORD=MYPASSWORD cgr.dev/chainguard/minio server /data
MinIO Object Storage Server
Copyright: 2015-2024 MinIO, Inc.
License: GNU AGPLv3 <https://www.gnu.org/licenses/agpl-3.0.html>
Version: DEVELOPMENT.2024-04-18T19-09-19Z (go1.22.2 linux/arm64)

API: http://172.17.0.3:9000  http://127.0.0.1:9000 
WebUI: http://172.17.0.3:37953 http://127.0.0.1:37953 

Docs: https://min.io/docs/minio/linux/index.html
Status:         1 Online, 0 Offline. 
STARTUP WARNINGS:
- The standard parity is set to 0. This can lead to data loss.
```
<!--body:end-->
