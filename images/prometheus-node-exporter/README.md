<!--monopod:start-->
# prometheus-node-exporter
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-node-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-node-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Prometheus Node Exporter Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-node-exporter:latest
```

## Usage

This image listens on port 9100 by default.

To test:

```shell
2023-03-04T23:06:01.434Z caller=node_exporter.go:180 level=info msg="Starting node_exporter" version="(version=1.5.0, branch=master, revision=c914f0052629e3c99449bdfb4fa7189ce09e77b5)"
ts=2023-03-04T23:06:01.435Z caller=node_exporter.go:181 level=info msg="Build context" build_context="(go=go1.20.1, platform=linux/arm64, user=root@167b63aef3b8, date=19700101-00:00:00)"
ts=2023-03-04T23:06:01.435Z caller=node_exporter.go:183 level=warn msg="Node Exporter is running as root user. This exporter is designed to run as unprivileged user, root is not required."
ts=2023-03-04T23:06:01.435Z caller=filesystem_common.go:111 level=info collector=filesystem msg="Parsed flag --collector.filesystem.mount-points-exclude" flag=^/(dev|proc|run/credentials/.+|sys|var/lib/docker/.+|var/lib/containers/storage/.+)($|/)
ts=2023-03-04T23:06:01.435Z caller=filesystem_common.go:113 level=info collector=filesystem msg="Parsed flag --collector.filesystem.fs-types-exclude" flag=^(autofs|binfmt_misc|bpf|cgroup2?|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|iso9660|mqueue|nsfs|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|selinuxfs|squashfs|sysfs|tracefs)$
ts=2023-03-04T23:06:01.435Z caller=diskstats_common.go:111 level=info collector=diskstats msg="Parsed flag --collector.diskstats.device-exclude" flag=^(ram|loop|fd|(h|s|v|xv)d[a-z]|nvme\d+n\d+p)\d+$
ts=2023-03-04T23:06:01.436Z caller=diskstats_linux.go:264 level=error collector=diskstats msg="Failed to open directory, disabling udev device properties" path=/run/udev/data
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:110 level=info msg="Enabled collectors"
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=arp
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=bcache
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=rapl
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=schedstat
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=selinux
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=sockstat
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=softnet
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=stat
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=tapestats
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=textfile
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=thermal_zone
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=time
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=timex
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=udp_queues
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=uname
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=vmstat
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=xfs
ts=2023-03-04T23:06:01.436Z caller=node_exporter.go:117 level=info collector=zfs
ts=2023-03-04T23:06:01.436Z caller=tls_config.go:232 level=info msg="Listening on" address=[::]:9100
ts=2023-03-04T23:06:01.436Z caller=tls_config.go:235 level=info msg="TLS is disabled." http2=false address=[::]:9100
```

## Configuration

The image can be configured through flags.
Run it with the `--help` flag to see the full list:

```shell
$ docker run cgr.dev/chainguard/prometheus-node-exporter --help
usage: node_exporter [<flags>]

Flags:
  -h, --help                     Show context-sensitive help (also try
                                 --help-long and --help-man).
      --collector.arp.device-include=COLLECTOR.ARP.DEVICE-INCLUDE
                                 Regexp of arp devices to include (mutually
                                 exclusive to device-exclude).
      --collector.arp.device-exclude=COLLECTOR.ARP.DEVICE-EXCLUDE
                                 Regexp of arp devices to exclude (mutually
                                 exclusive to device-include).
      --collector.bcache.priorityStats
                                 Expose expensive priority stats.
      --collector.cpu.guest      Enables metric node_cpu_guest_seconds_total
      --collector.cpu.info       Enables metric cpu_info
      --collector.cpu.info.flags-include=COLLECTOR.CPU.INFO.FLAGS-INCLUDE
                                 Filter the `flags` field in cpuInfo with a
                                 value that must be a regular expression
      --collector.cpu.info.bugs-include=COLLECTOR.CPU.INFO.BUGS-INCLUDE
                                 Filter the `bugs` field in cpuInfo with a value
                                 that must be a regular expression
```
