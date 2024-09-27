<!--monopod:start-->
# kafka
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kafka` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/kafka/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for kafka

Minimal image with Kafka.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/kafka:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using KAFKA

Chainguard Kafka images include the `kafka-server-*` scripts which can be used to start up or configure Kafka or it's dependencies.
The full list of scripts is available here:

```shell
% docker run -it --entrypoint=sh cgr.dev/chainguard/kafka
/ #
/ # ls /usr/lib/kafka/bin/
connect-distributed.sh              kafka-console-producer.sh           kafka-leader-election.sh            kafka-run-class.sh                  kafka-verifiable-producer.sh
connect-mirror-maker.sh             kafka-consumer-groups.sh            kafka-log-dirs.sh                   kafka-server-start.sh               trogdor.sh
connect-standalone.sh               kafka-consumer-perf-test.sh         kafka-metadata-quorum.sh            kafka-server-stop.sh                windows
kafka-acls.sh                       kafka-delegation-tokens.sh          kafka-metadata-shell.sh             kafka-storage.sh                    zookeeper-security-migration.sh
kafka-broker-api-versions.sh        kafka-delete-records.sh             kafka-mirror-maker.sh               kafka-streams-application-reset.sh  zookeeper-server-start.sh
kafka-cluster.sh                    kafka-dump-log.sh                   kafka-producer-perf-test.sh         kafka-topics.sh                     zookeeper-server-stop.sh
kafka-configs.sh                    kafka-features.sh                   kafka-reassign-partitions.sh        kafka-transactions.sh               zookeeper-shell.sh
kafka-console-consumer.sh           kafka-get-offsets.sh                kafka-replica-verification.sh       kafka-verifiable-consumer.sh
```

The default entrypoint is set to run the `kafka-server-start.sh` script with a sample configuration at `/usr/lib/kafka/config/server.properties`.
This can be overridden with the cmd of the container.

**NOTE**: You will need to separately configure a Zookeeper instance to start and run Kafka.
You can use the Chainguard Image for Zookeeper, or another Zookeeper service.

Here's a non-production-grade quickstart to try it out locally in a single container:

```shell
$ /usr/lib/kafka/bin/zookeeper-server-start.sh /usr/lib/kafka/config/zookeeper.properties &

$ /usr/lib/kafka/bin/kafka-server-start.sh /usr/lib/kafka/config/server.properties
[2023-03-18 00:10:17,335] INFO Registered kafka:type=kafka.Log4jController MBean (kafka.utils.Log4jControllerRegistration$)
[2023-03-18 00:10:17,475] INFO Setting -D jdk.tls.rejectClientInitiatedRenegotiation=true to disable client-initiated TLS renegotiation (org.apache.zookeeper.common.X509Util)
[2023-03-18 00:10:17,525] INFO Registered signal handlers for TERM, INT, HUP (org.apache.kafka.common.utils.LoggingSignalHandler)
[2023-03-18 00:10:17,526] INFO starting (kafka.server.KafkaServer)
[2023-03-18 00:10:17,526] INFO Connecting to zookeeper on localhost:2181 (kafka.server.KafkaServer)
[2023-03-18 00:10:17,534] INFO [ZooKeeperClient Kafka server] Initializing a new session to localhost:2181. (kafka.zookeeper.ZooKeeperClient)
[2023-03-18 00:10:17,536] INFO Client environment:zookeeper.version=3.6.3--6401e4ad2087061bc6b9f80dec2d69f2e3c8660a, built on 04/08/2021 16:35 GMT (org.apache.zookeeper.ZooKeeper)
[2023-03-18 00:10:17,536] INFO Client environment:host.name=3848d9fbe7d6 (org.apache.zookeeper.ZooKeeper)
[2023-03-18 00:10:17,536] INFO Client environment:java.version=11.0.18-internal (org.apache.zookeeper.ZooKeeper)
[2023-03-18 00:10:17,536] INFO Client environment:java.vendor=wolfi (org.apache.zookeeper.ZooKeeper)
[2023-03-18 00:10:17,536] INFO Client environment:java.home=/usr/lib/jvm/openjdk-jre (org.apache.zookeeper.ZooKeeper)
...
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