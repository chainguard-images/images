<!--monopod:start-->
# fluentd
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/fluentd` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/fluentd/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for fluentd

[Fluentd](https://www.fluentd.org/): Unified Logging Layer (project under CNCF)

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/fluentd:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using fluentd

Run a Fluentd instance that will receive messages over TCP port 24224 through the Forward protocol, and send the messages to the STDOUT interface in JSON format

Run the fluentd container and mount the fluent.conf in [examples/](https://github.com/chainguard-images/images/tree/main/images/fluentd/examples)

```sh
docker run --rm -p 127.0.0.1:24224:24224 -v ${PWD}/examples/basic_docker.conf:/etc/fluent/fluent.conf cgr.dev/chainguard/fluentd
```

In another terminal try sending some logs to fluentd with another container

```sh
docker run --rm --log-driver=fluentd --log-opt tag="docker.{{.ID}}" cgr.dev/chainguard/wolfi-base echo 'Hello Fluentd!'
```

The Fluentd container should receive the message and print it to stdout:

```sh
2023-02-24 17:06:32 +0000 [info]: starting fluentd-1.15.3 pid=1 ruby="3.2.0"
2023-02-24 17:06:32 +0000 [info]: spawn command to main:  cmdline=["/usr/bin/ruby", "-Eascii-8bit:ascii-8bit", "/usr/bin/fluentd", "--under-supervisor"]
2023-02-24 17:06:32 +0000 [info]: init supervisor logger path=nil rotate_age=nil rotate_size=nil
2023-02-24 17:06:32 +0000 [info]: #0 init worker0 logger path=nil rotate_age=nil rotate_size=nil
2023-02-24 17:06:32 +0000 [info]: adding match pattern="*.*" type="stdout"
2023-02-24 17:06:32 +0000 [info]: adding source type="forward"
2023-02-24 17:06:32 +0000 [warn]: #0 define <match fluent.**> to capture fluentd logs in top level is deprecated. Use <label @FLUENT_LOG> instead
2023-02-24 17:06:32 +0000 [info]: #0 starting fluentd worker pid=11 ppid=1 worker=0
2023-02-24 17:06:32 +0000 [info]: #0 listening port port=24224 bind="0.0.0.0"
2023-02-24 17:06:32 +0000 [info]: #0 fluentd worker is now running worker=0
2023-02-24 17:06:32.824499403 +0000 fluent.info: {"pid":11,"ppid":1,"worker":0,"message":"starting fluentd worker pid=11 ppid=1 worker=0"}
2023-02-24 17:06:32.824689854 +0000 fluent.info: {"port":24224,"bind":"0.0.0.0","message":"listening port port=24224 bind=\"0.0.0.0\""}
2023-02-24 17:06:32.825323737 +0000 fluent.info: {"worker":0,"message":"fluentd worker is now running worker=0"}
2023-02-24 17:06:54.000000000 +0000 docker.eb2613ef91b4: {"container_id":"eb2613ef91b4fa0989b7af9f3b1310bc4de6c13aae5ee42901d553e81b575045","container_name":"/focused_fermat","source":"stdout","log":"Hello Fluentd!"}
```

## Using the -dev variant

The `-dev` variant contains a shell and tools like `apk` to allow users to easily debug and modify the image. The `-dev` variant uses the same entrypoint as the regular image so if you want to get a shell make sure to override the entrypoint like so.

```sh
docker run --rm --entrypoint 'sh' cgr.dev/chainguard/fluentd
```
<!--body:end-->

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.