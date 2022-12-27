# Prometheus

Minimal Prometheus Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus:latest
```

## Usage

This requires a prometheus configuration file to run.
An example is provided at `/etc/prometheus/prometheus.yml`.
The values from this example can be found in the [Prometheus source tree](https://github.com/prometheus/prometheus/blob/main/documentation/examples/prometheus.yml).

THe default port that prometheus listens on is 9090.
The web browser can be viewed locally over that port by mapping that in with `-p 9090:9090`.

To test:

```shell
% docker run cgr.dev/chainguard/prometheus:latest -p 9090:9090 --config.file=/etc/prometheus/prometheus.yml
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
