<!--monopod:start-->
# kafka
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kafka` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kafka/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with Kafka. **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kafka:latest
```
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
