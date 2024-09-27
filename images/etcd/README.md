<!--monopod:start-->
# etcd
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/etcd` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/etcd/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for etcd

[etcd](https://etcd.io/) Distributed reliable key-value store for the most critical data of a distributed system

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/etcd:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using etcd

The default listening ports in etcd are 2379 and 2380.
To run a container listening on these ports, try:

```sh
docker run -p 2379:2379 -p 2380:2380 --rm cgr.dev/chainguard/etcd
{"level":"info","ts":"2022-12-27T15:56:52.651Z","caller":"etcdmain/etcd.go:73","msg":"Running: ","args":["etcd"]}
{"level":"warn","ts":"2022-12-27T15:56:52.651Z","caller":"etcdmain/etcd.go:105","msg":"'data-dir' was empty; using default","data-dir":"default.etcd"}
{"level":"info","ts":"2022-12-27T15:56:52.651Z","caller":"embed/etcd.go:124","msg":"configuring peer listeners","listen-peer-urls":["http://localhost:2380"]}
{"level":"info","ts":"2022-12-27T15:56:52.652Z","caller":"embed/etcd.go:132","msg":"configuring client listeners","listen-client-urls":["http://localhost:2379"]}
{"level":"info","ts":"2022-12-27T15:56:52.652Z","caller":"embed/etcd.go:306","msg":"starting an etcd server","etcd-version":"3.5.6","git-sha":"0a7cb3c","go-version":"go1.19.4","go-os":"linux","go-arch":"arm64","max-cpu-set":8,"max-cpu-available":8,"member-initialized":false,"name":"default","data-dir":"default.etcd","wal-dir":"","wal-dir-dedicated":"","member-dir":"default.etcd/member","force-new-cluster":false,"heartbeat-interval":"100ms","election-timeout":"1s","initial-election-tick-advance":true,"snapshot-count":100000,"max-wals":5,"max-snapshots":5,"snapshot-catchup-entries":5000,"initial-advertise-peer-urls":["http://localhost:2380"],"listen-peer-urls":["http://localhost:2380"],"advertise-client-urls":["http://localhost:2379"],"listen-client-urls":["http://localhost:2379"],"listen-metrics-urls":[],"cors":["*"],"host-whitelist":["*"],"initial-cluster":"default=http://localhost:2380","initial-cluster-state":"new","initial-cluster-token":"etcd-cluster","quota-backend-bytes":2147483648,"max-request-bytes":1572864,"max-concurrent-streams":4294967295,"pre-vote":true,"initial-corrupt-check":false,"corrupt-check-time-interval":"0s","compact-check-time-enabled":false,"compact-check-time-interval":"1m0s","auto-compaction-mode":"periodic","auto-compaction-retention":"0s","auto-compaction-interval":"0s","discovery-url":"","discovery-proxy":"","downgrade-check-interval":"5s"}
{"level":"info","ts":"2022-12-27T15:56:52.657Z","caller":"etcdserver/backend.go:81","msg":"opened backend db","path":"default.etcd/member/snap/db","took":"4.238167ms"}
{"level":"info","ts":"2022-12-27T15:56:52.664Z","caller":"etcdserver/raft.go:494","msg":"starting local member","local-member-id":"8e9e05c52164694d","cluster-id":"cdf818194e3a8c32"}
{"level":"info","ts":"2022-12-27T15:56:52.664Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"8e9e05c52164694d switched to configuration voters=()"}
{"level":"info","ts":"2022-12-27T15:56:52.664Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"8e9e05c52164694d became follower at term 0"}
{"level":"info","ts":"2022-12-27T15:56:52.664Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"newRaft 8e9e05c52164694d [peers: [], term: 0, commit: 0, applied: 0, lastindex: 0, lastterm: 0]"}
{"level":"info","ts":"2022-12-27T15:56:52.664Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"8e9e05c52164694d became follower at term 1"}
{"level":"info","ts":"2022-12-27T15:56:52.665Z","logger":"raft","caller":"etcdserver/zap_raft.go:77","msg":"8e9e05c52164694d switched to configuration voters=(10276657743932975437)"}
{"level":"warn","ts":"2022-12-27T15:56:52.674Z","caller":"auth/store.go:1234","msg":"simple token is not cryptographically signed"}
{"level":"info","ts":"2022-12-27T15:56:52.680Z","caller":"mvcc/kvstore.go:393","msg":"kvstore restored","current-rev":1}
{"level":"info","ts":"2022-12-27T15:56:52.681Z","caller":"etcdserver/quota.go:94","msg":"enabled backend quota with default value","quota-name":"v3-applier","quota-size-bytes":2147483648,"quota-size":"2.1 GB"}
{"level":"info","ts":"2022-12-27T15:56:52.686Z","caller":"etcdserver/server.go:854","msg":"starting etcd server","local-member-id":"8e9e05c52164694d","local-server-version":"3.5.6","cluster-version":"to_be_decided"}
{"level":"info","ts":"2022-12-27T15:56:52.688Z","caller":"etcdserver/server.go:738","msg":"started as single-node; fast-forwarding election ticks","local-member-id":"8e9e05c52164694d","forward-ticks":9,"forward-duration":"900ms","election-ticks":10,"election-timeout":"1s"}
{"level":"info","ts":"2022-12-27T15:56:52.688Z","caller":"fileutil/purge.go:44","msg":"started to purge file","dir":"default.etcd/member/snap","suffix":"snap.db","max":5,"interval":"30s"}
{"level":"info","ts":"2022-12-27T15:56:52.688Z","caller":"fileutil/purge.go:44","msg":"started to purge file","dir":"default.etcd/member/snap","suffix":"snap","max":5,"interval":"30s"}
{"level":"info","ts":"2022-12-27T15:56:52.688Z","caller":"fileutil/purge.go:44","msg":"started to purge file","dir":"default.etcd/member/wal","suffix":"wal","max":5,"interval":"30s"}
{"level":"info","ts":"2022-12-27T15:56:52.694Z","caller":"embed/etcd.go:275","msg":"now serving peer/client/metrics","local-member-id":"8e9e05c52164694d","initial-advertise-peer-urls":["http://localhost:2380"],"listen-peer-urls":["http://localhost:2380"],"advertise-client-urls":["http://localhost:2379"],"listen-client-urls":["http://localhost:2379"],"listen-metrics-urls":[]}
{"level":"info","ts":"2022-12-27T15:56:52.694Z","caller":"embed/etcd.go:586","msg":"serving peer traffic","address":"127.0.0.1:2380"}
{"level":"info","ts":"2022-12-27T15:56:52.696Z","caller":"embed/etcd.go:558","msg":"cmux::serve","address":"127.0.0.1:2380"}
```

## Users and Directories

By default this image runs as a non-root user named `etcd` with a uid of 65532.
The default data directory for this image is `/var/lib/etcd`, and that directory is write-able by the `etcd` user.

If you change the user, UID, or data directory, you'll need to ensure the user running the etcd process has permissions to that
directory.
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