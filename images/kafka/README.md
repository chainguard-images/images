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

Minimal image for Apache Kafka, a distributed event streaming platform.

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
## Compatibility Notes

The Chainguard Kafka image is meant to serve as a drop-in replacement for the [Bitnami Kafka image](https://hub.docker.com/r/bitnami/kafka) and the [`cp-kafka` image from Confluent](https://hub.docker.com/r/confluentinc/cp-kafka/). Like most other Chainguard Images, the Kafka image has few-to-zero CVEs and does not run as the root user.

## Getting Started

Chainguard Kafka images include the server scripts which can be used to start up or configure Kafka or its dependencies. You can find the full list of available scripts in the container's `/usr/lib/kafka/bin/` directory:

```shell
% docker run -it --entrypoint=sh cgr.dev/ORGANIZATION/kafka
/ #
/ # ls /usr/lib/kafka/bin/
connect-distributed.sh          	kafka-console-consumer.sh       	kafka-get-offsets.sh            	kafka-replica-verification.sh   	kafka-verifiable-producer.sh
connect-mirror-maker.sh         	kafka-console-producer.sh       	kafka-jmx.sh                    	kafka-run-class.sh              	trogdor.sh
connect-plugin-path.sh          	kafka-consumer-groups.sh        	kafka-leader-election.sh        	kafka-server-start.sh           	windows
connect-standalone.sh           	kafka-consumer-perf-test.sh     	kafka-log-dirs.sh               	kafka-server-stop.sh            	zookeeper-security-migration.sh
kafka-acls.sh                   	kafka-delegation-tokens.sh      	kafka-metadata-quorum.sh        	kafka-storage.sh                	zookeeper-server-start.sh
kafka-broker-api-versions.sh    	kafka-delete-records.sh         	kafka-metadata-shell.sh         	kafka-streams-application-reset.sh  zookeeper-server-stop.sh
kafka-client-metrics.sh         	kafka-dump-log.sh               	kafka-mirror-maker.sh           	kafka-topics.sh                 	zookeeper-shell.sh
kafka-cluster.sh                	kafka-e2e-latency.sh            	kafka-producer-perf-test.sh     	kafka-transactions.sh
kafka-configs.sh                	kafka-features.sh               	kafka-reassign-partitions.sh    	kafka-verifiable-consumer.sh
```

Chainguard uses the following Helm values to test the Kafka image:

* `fsGroup`: part of a `podSecurityContext` object, the `fsGroup` field specifies the group ID under which all processes of the pod are part of.
* `runAsUser`: part of a `containerSecurityContext` object, this value specifies the user ID under which all processes in the container run under.
* `mountPath`: part of a `logPersistence` object, this defines the location where a log volume will be mounted.

### Logs

You can retrieve the logs for the Kafka container with the `docker logs` command. The following example assumes that you're running a Kafka container named `kafka-container`:

```shell
docker logs kafka-container
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