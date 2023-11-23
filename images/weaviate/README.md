<!--monopod:start-->
# weaviate
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/weaviate` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/weaviate/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal container image for running the weaviate vector database.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/weaviate:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image should be a drop-in replacement for the upstream `weaviate` image.

Note that this image does not include a config file by default, and one is required to start the server.
This can be specified using the `--config-file` paramter.

```
% docker run cgr.dev/chainguard/weaviate --help
Usage:
  weaviate [OPTIONS]

Cloud-native, modular vector search engine

Application Options:
      --scheme=            the listeners to enable, this can be repeated and
                           defaults to the schemes in the swagger spec
      --cleanup-timeout=   grace period for which to wait before killing idle
                           connections (default: 10s)
      --graceful-timeout=  grace period for which to wait before shutting down
                           the server (default: 15s)
      --max-header-size=   controls the maximum number of bytes the server will
                           read parsing the request header's keys and values,
                           including the request line. It does not limit the
                           size of the request body. (default: 1MiB)
      --socket-path=       the unix socket to listen on (default:
                           /var/run/weaviate.sock)
      --host=              the IP to listen on (default: localhost) [$HOST]
      --port=              the port to listen on for insecure connections,
                           defaults to a random value [$PORT]
      --listen-limit=      limit the number of outstanding requests
      --keep-alive=        sets the TCP keep-alive timeouts on accepted
                           connections. It prunes dead TCP connections ( e.g.
                           closing laptop mid-download) (default: 3m)
      --read-timeout=      maximum duration before timing out read of the
                           request (default: 30s)
      --write-timeout=     maximum duration before timing out write of the
                           response (default: 60s)
      --tls-host=          the IP to listen on for tls, when not specified it's
                           the same as --host [$TLS_HOST]
      --tls-port=          the port to listen on for secure connections,
                           defaults to a random value [$TLS_PORT]
      --tls-certificate=   the certificate to use for secure connections
                           [$TLS_CERTIFICATE]
      --tls-key=           the private key to use for secure connections
                           [$TLS_PRIVATE_KEY]
      --tls-ca=            the certificate authority file to be used with
                           mutual tls auth [$TLS_CA_CERTIFICATE]
      --tls-listen-limit=  limit the number of outstanding requests
      --tls-keep-alive=    sets the TCP keep-alive timeouts on accepted
                           connections. It prunes dead TCP connections ( e.g.
                           closing laptop mid-download)
      --tls-read-timeout=  maximum duration before timing out read of the
                           request
      --tls-write-timeout= maximum duration before timing out write of the
                           response

Connector config & MQTT config:
      --config-file=       path to config file (default: ./weaviate.conf.json)

Help Options:
  -h, --help               Show this help message
```
<!--body:end-->
