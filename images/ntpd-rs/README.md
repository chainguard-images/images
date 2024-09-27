<!--monopod:start-->
# ntpd-rs
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/ntpd-rs` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/ntpd-rs/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for ntpd-rs

Minimal image with [ntpd-rs](https://github.com/pendulum-project/ntpd-rs).

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/ntpd-rs:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using ntpd-rs

The Chainguard nptd-rs image contains the `ntp-daemon` server binary.

This binary requires extra capabilities to run (in order to interface with the system time).
In Docker, this can be added with `--cap-add SYS_TIME`.

To run this image, using the public `pool.ntp.org` server as a peer:

```shell
$ docker run --cap-add SYS_TIME cgr.dev/chainguard/ntpd-rs -p pool.ntp.org

2023-04-02T18:50:30.985666Z  WARN ntp_daemon::config: Fewer peers configured than are required to agree on the current time. Daemon will not do anything.
2023-04-02T18:50:31.001470Z  WARN ntp_proto::peer: Peer rejected due to invalid stratum stratum=16
2023-04-02T18:50:31.094893Z  WARN run{config=SystemConfig { min_intersection_survivors: 3, min_cluster_survivors: 3, frequency_tolerance: FrequencyTolerance { ppm: 15 }, distance_threshold: NtpDuration(1000.0000002328306 ms), frequency_measurement_period: NtpDuration(900000.0002095476 ms), spike_threshold: NtpDuration(900000.0002095476 ms), panic_threshold: StepThreshold { forward: Some(NtpDuration(1000000.0002328306 ms)), backward: Some(NtpDuration(1000000.0002328306 ms)) }, startup_panic_threshold: StepThreshold { forward: None, backward: None }, accumulated_threshold: None, local_stratum: 16, poll_limits: PollIntervalLimits { min: PollInterval(16 s), max: PollInterval(1024 s) }, initial_poll: PollInterval(16 s) } local_clock_time=NtpInstant { instant: Instant { tv_sec: 331968, tv_nsec: 938303897 } } system_poll=PollInterval(16 s) peers=[PeerIndex { index: 0 }]}:clock_select{peers=[(PeerIndex { index: 0 }, PeerTimeSnapshot { root_distance_without_time: NtpDuration(8035.252420705569 ms), statistics: PeerStatistics { offset: NtpDuration(47.34621826730347 ms), delay: NtpDuration(93.3494211857555 ms), dispersion: NtpDuration(7937.502728527762 ms), jitter: 3.814697266513178e-6 }, time: NtpInstant { instant: Instant { tv_sec: 331968, tv_nsec: 938270064 } }, stratum: 2, leap_indicator: NoWarning, root_delay: NtpDuration(60.57739259222927 ms), root_dispersion: NtpDuration(20.782470707963796 ms) })]}: ntp_proto::clock_select: No clique of peers that agree on the current time.
2023-04-02T18:50:31.094923Z  INFO ntp_proto::algorithm::standard: filter and combine did not produce a result
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