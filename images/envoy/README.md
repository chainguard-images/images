# Envoy

[Envoy](https://github.com/envoyproxy/envoy) Cloud-native high-performance edge/middle/service proxy

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/envoy:experimental
```

## Using Envoy

To run with Docker using default configuration

```sh
docker run --platform=linux/amd64 -p10000:10000 -p 9901:9901 --rm cgr.dev/chainguard/envoy:experimental envoy --config-path /etc/envoy/envoy.yaml
```

Or to use a customised envoy configuratiom see https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/overview and mount your file into the envoy container, e.g. `-v $PWD/config:/etc/envoy`

```sh
docker run --platform=linux/amd64 -p10000:10000 -p 9901:9901 --rm -v $PWD/config:/etc/envoy cgr.dev/chainguard/envoy:experimental envoy --config-path /etc/envoy/envoy.yaml
```
