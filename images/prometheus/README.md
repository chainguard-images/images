<!--monopod:start-->
# prometheus
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/prometheus` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/prometheus/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for prometheus

Minimal Prometheus Image

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/prometheus:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

This requires a prometheus configuration file to run.
An example is provided at `/etc/prometheus/prometheus.yml`.
The values from this example can be found in the [Prometheus source tree](https://github.com/prometheus/prometheus/blob/main/documentation/examples/prometheus.yml).

THe default port that prometheus listens on is 9090.
The web browser can be viewed locally over that port by mapping that in with `-p 9090:9090`.

To test:

```shell
% docker run -p 9090:9090 cgr.dev/chainguard/prometheus:latest --config.file=/etc/prometheus/prometheus.yml
ts=2022-12-27T02:32:45.181Z caller=main.go:512 level=info msg="No time or size retention was set so using the default time retention" duration=15d
ts=2022-12-27T02:32:45.181Z caller=main.go:556 level=info msg="Starting Prometheus Server" mode=server version="(version=2.41.0, branch=master, revision=WolfiLinux)"
ts=2022-12-27T02:32:45.181Z caller=main.go:561 level=info build_context="(go=go1.19.4, platform=linux/arm64, user=@dag-wfjfq, date=19700101-00:00:00)"
ts=2022-12-27T02:32:45.181Z caller=main.go:562 level=info host_details="(Linux 5.10.104-linuxkit #1 SMP PREEMPT Thu Mar 17 17:05:54 UTC 2022 aarch64 98fc282ede4c (none))"
ts=2022-12-27T02:32:45.181Z caller=main.go:563 level=info fd_limits="(soft=1048576, hard=1048576)"
ts=2022-12-27T02:32:45.181Z caller=main.go:564 level=info vm_limits="(soft=unlimited, hard=unlimited)"
ts=2022-12-27T02:32:45.183Z caller=web.go:559 level=info component=web msg="Start listening for connections" address=0.0.0.0:9090
ts=2022-12-27T02:32:45.184Z caller=main.go:993 level=info msg="Starting TSDB ..."
ts=2022-12-27T02:32:45.185Z caller=tls_config.go:232 level=info component=web msg="Listening on" address=[::]:9090
ts=2022-12-27T02:32:45.185Z caller=tls_config.go:235 level=info component=web msg="TLS is disabled." http2=false address=[::]:9090
ts=2022-12-27T02:32:45.185Z caller=head.go:562 level=info component=tsdb msg="Replaying on-disk memory mappable chunks if any"
ts=2022-12-27T02:32:45.186Z caller=head.go:606 level=info component=tsdb msg="On-disk memory mappable chunks replay completed" duration=1.417µs
ts=2022-12-27T02:32:45.186Z caller=head.go:612 level=info component=tsdb msg="Replaying WAL, this may take a while"
ts=2022-12-27T02:32:45.186Z caller=head.go:683 level=info component=tsdb msg="WAL segment loaded" segment=0 maxSegment=0
ts=2022-12-27T02:32:45.186Z caller=head.go:720 level=info component=tsdb msg="WAL replay completed" checkpoint_replay_duration=21.5µs wal_replay_duration=473.791µs wbl_replay_duration=84ns total_replay_duration=509.416µs
ts=2022-12-27T02:32:45.187Z caller=main.go:1014 level=info fs_type=794c7630
ts=2022-12-27T02:32:45.187Z caller=main.go:1017 level=info msg="TSDB started"
ts=2022-12-27T02:32:45.188Z caller=main.go:1197 level=info msg="Loading configuration file" filename=/etc/prometheus/prometheus.yml
ts=2022-12-27T02:32:45.188Z caller=main.go:1234 level=info msg="Completed loading of configuration file" filename=/etc/prometheus/prometheus.yml totalDuration=434.958µs db_storage=875ns remote_storage=709ns web_handler=208ns query_engine=417ns scrape=123.25µs scrape_sd=15.084µs notify=17.208µs notify_sd=5.75µs rules=1.208µs tracing=2.875µs
ts=2022-12-27T02:32:45.188Z caller=main.go:978 level=info msg="Server is ready to receive web requests."
ts=2022-12-27T02:32:45.188Z caller=manager.go:953 level=info component="rule manager" msg="Starting rule manager..."
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