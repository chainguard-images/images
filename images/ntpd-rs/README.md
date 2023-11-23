<!--monopod:start-->
# ntpd-rs
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/ntpd-rs` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/ntpd-rs/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [ntpd-rs](https://github.com/pendulum-project/ntpd-rs). **EXPERIMENTAL**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ntpd-rs:latest
```
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
