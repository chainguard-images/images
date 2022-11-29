# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/git/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `migration-nonroot-20221120` | `sha256:e283948a36fd3eb50d8870be84b9f9fbd6b1bcaeeb80fa8f763e907fc0fcf7cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e283948a36fd3eb50d8870be84b9f9fbd6b1bcaeeb80fa8f763e907fc0fcf7cd) | `amd64` |
| `migration-root-20221125` | `sha256:b54700dc3a034f656539c4b2a136b068cd1e0a7d976dac9ba9f41d1e8c21e2f5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b54700dc3a034f656539c4b2a136b068cd1e0a7d976dac9ba9f41d1e8c21e2f5) | `amd64` |
| `migration-nonroot-20221125` | `sha256:ab7d91ff04e8a5e4e440e3c373c562590c43ac4af60ccb177b6adfb0cc280f58`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ab7d91ff04e8a5e4e440e3c373c562590c43ac4af60ccb177b6adfb0cc280f58) | `amd64` |
| `migration-nonroot-20221126` | `sha256:6fdc5259621b17fd56dd3ecf6a8216fcad58771e810d44cd7806873440717c69`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6fdc5259621b17fd56dd3ecf6a8216fcad58771e810d44cd7806873440717c69) | `amd64` |
| `2.37.3-debian-11-r8` `2.37.3-r0` | `sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-root` `migration-root-2` `migration-root-2.38` `migration-root-2.38.1` `migration-root-2.38.1-r0` `migration-root-20221129` | `sha256:6c79433af4e6f2db716c2a7a5a5ce94d187f97a180d255d1881b56e956423d8d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6c79433af4e6f2db716c2a7a5a5ce94d187f97a180d255d1881b56e956423d8d) | `amd64` |
| `2.38.0-r1` | `sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-nonroot-20221127` | `sha256:42c64394dd19693378fc54e752ed8a00da0c7d4920f8ab78cc3670dc13232d72`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:42c64394dd19693378fc54e752ed8a00da0c7d4920f8ab78cc3670dc13232d72) | `amd64` |
| `2` `2-debian-11` `2.38.0` `2.38.0-debian-11-r2` `2.38.0-debian-11-r3` | `sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-root-glibc` | `sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629) | `amd64` |
| `migration-nonroot-20221118` | `sha256:bc386c6aaf1de2dc6ae27656883df4d794bf02c4435306f70ce2817a446927b7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc386c6aaf1de2dc6ae27656883df4d794bf02c4435306f70ce2817a446927b7) | `amd64` |
| `migration-root-20221118` | `sha256:7761b59b4b0657cc17cbf842df0cd3f910b7aca1858320b1798fe52c72bc23ee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7761b59b4b0657cc17cbf842df0cd3f910b7aca1858320b1798fe52c72bc23ee) | `amd64` |
| `migration-root-20221119` | `sha256:fb0b51c06fbf98fde46ee8831a1aa432f147e35b6b2f16ef95342274c4998237`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fb0b51c06fbf98fde46ee8831a1aa432f147e35b6b2f16ef95342274c4998237) | `amd64` |
| `migration-root-20221124` | `sha256:fcb3ea179957aeb4cd9d377349eee0527046703b77961d491106e4c79ead7413`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fcb3ea179957aeb4cd9d377349eee0527046703b77961d491106e4c79ead7413) | `amd64` |
| `2.38.1-r0` `root` | `sha256:f026032b73d4a7c970c56e31f2d09ab012da2186fef6febc98d2352e03b66ba4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f026032b73d4a7c970c56e31f2d09ab012da2186fef6febc98d2352e03b66ba4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r1` | `sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-root-glibc` | `sha256:2706fea88bd77d52f5e2f7b60a9724eb2e0f48c9a8e5326b1702e265aaf2c90d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2706fea88bd77d52f5e2f7b60a9724eb2e0f48c9a8e5326b1702e265aaf2c90d) | `amd64` |
| `migration-root-20221120` | `sha256:65ac52217d0b4b8598d2b76789c57a10e3309d3b2ff401bd345c453d3c7f1d83`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:65ac52217d0b4b8598d2b76789c57a10e3309d3b2ff401bd345c453d3c7f1d83) | `amd64` |
| `migration-nonroot-20221123` | `sha256:19aca1f96a284c49d2cd8622d50a1d9e59e4d3a89c541c24a16b174e129b1f8a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:19aca1f96a284c49d2cd8622d50a1d9e59e4d3a89c541c24a16b174e129b1f8a) | `amd64` |
| `migration-nonroot-20221124` | `sha256:9de653d9a2707d9f95283635afbeb52d52e42f1a2a8b14ba03f274307affc20d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9de653d9a2707d9f95283635afbeb52d52e42f1a2a8b14ba03f274307affc20d) | `amd64` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r7` | `sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-nonroot-20221128` | `sha256:e3fcc53c0611309c99148bb4624bb9ebdba39b4855b9b32ecf4b4125c80258c8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e3fcc53c0611309c99148bb4624bb9ebdba39b4855b9b32ecf4b4125c80258c8) | `amd64` |
| `latest` | `sha256:4d617d8639119cf65803d0220d1116c52d1bd014d80e07208643e10ce0dbc38f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4d617d8639119cf65803d0220d1116c52d1bd014d80e07208643e10ce0dbc38f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-root-20221123` | `sha256:e24085a48e09bea0d4c17bb91d3734224072592e6c4def0a91674aec8ea0d148`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e24085a48e09bea0d4c17bb91d3734224072592e6c4def0a91674aec8ea0d148) | `amd64` |
| `2.37.3-r0-glibc` | `sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de) | `amd64` |
| `migration-nonroot-20221119` | `sha256:78a43443f0fa1ae53c843347482bc6382230317cefa390e8308f23a5fe46cd43`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:78a43443f0fa1ae53c843347482bc6382230317cefa390e8308f23a5fe46cd43) | `amd64` |
| `migration-root-20221121` | `sha256:1c4fa961b5b7d59a02c462d86d879ffce82750ce6aa338c687cdf7558a0b17bc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c4fa961b5b7d59a02c462d86d879ffce82750ce6aa338c687cdf7558a0b17bc) | `amd64` |
| `migration-nonroot-20221121` | `sha256:f64b28cfee889d05e74e06f3ec03cc2a013e5e48bac33789b959ae59d90edb4b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f64b28cfee889d05e74e06f3ec03cc2a013e5e48bac33789b959ae59d90edb4b) | `amd64` |
| `migration-nonroot-20221122` | `sha256:2c952c8e398effc31eac971e499a4c90247cac3632bb57ab69eeae82965bdc43`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2c952c8e398effc31eac971e499a4c90247cac3632bb57ab69eeae82965bdc43) | `amd64` |
| `migration-root-20221122` | `sha256:ccb1b7177e73a459363ef1faeaa74da4a122604ca15f2f02b2a6fbf876950610`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ccb1b7177e73a459363ef1faeaa74da4a122604ca15f2f02b2a6fbf876950610) | `amd64` |
| `migration-root-20221127` | `sha256:959e07c98952889f74f34934e8a02c2f157db2894bdaa7adb802c975a72dc568`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:959e07c98952889f74f34934e8a02c2f157db2894bdaa7adb802c975a72dc568) | `amd64` |
| `2.37.3-debian-11-r6` | `sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-glibc` | `sha256:98a93514b3a05486ef833f4e29a3b5a2eb28b9e34216458b10717924003c5d68`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:98a93514b3a05486ef833f4e29a3b5a2eb28b9e34216458b10717924003c5d68) | `amd64` |
| `migration-root-20221126` | `sha256:f9e78c0b25739dcecec582484228898bc8863bf76823dff3e6aac8b4cebdb13a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f9e78c0b25739dcecec582484228898bc8863bf76823dff3e6aac8b4cebdb13a) | `amd64` |
| `migration-root-20221128` | `sha256:fa7f4b1390d7a1c2e6155874dbc8d9a4f7f5e1d9871d2bb67cf66b602850eba0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fa7f4b1390d7a1c2e6155874dbc8d9a4f7f5e1d9871d2bb67cf66b602850eba0) | `amd64` |
| `2.37.3` `2.37.3-debian-11-r9` | `sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-nonroot` `migration-nonroot-2` `migration-nonroot-2.38` `migration-nonroot-2.38.1` `migration-nonroot-2.38.1-r0` `migration-nonroot-20221129` | `sha256:06132ab133430c7d7b0155ff093a3c1d3886230171b613e67a06cbe617a975e9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:06132ab133430c7d7b0155ff093a3c1d3886230171b613e67a06cbe617a975e9) | `amd64` |


## Usage

The Git image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull cgr.dev/chainguard/git
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm cgr.dev/chainguard/git --version
```
You should get output similar to this:

```
git version 2.37.1
```

### Cloning a Repository Locally

Because your local system user's ID (uid) might differ from that of the container image, if you want to clone repositories locally using this image you'll need to set up special permissions for the target dir. Then, you'll be able to set up a volume and have the contents of the cloned repo replicated on your host machine.

First, create a target directory somewhere in your home folder and set the required permissions:

```shell
mkdir ~/workspace
chmod go+wrx ~/workspace
```

Now you can use `docker run` to execute the clone command, using the directory you just set up as a volume share between your local machine and the container image on `/home/git`.

```shell
docker run -it -v ~/workspace:/home/git --rm cgr.dev/chainguard/git clone https://github.com/chainguard-images/git.git
```

You should get output like this:

```
Cloning into 'git'...
remote: Enumerating objects: 57, done.
remote: Counting objects: 100% (57/57), done.
remote: Compressing objects: 100% (47/47), done.
remote: Total 57 (delta 19), reused 35 (delta 10), pack-reused 0
Receiving objects: 100% (57/57), 15.23 KiB | 866.00 KiB/s, done.
Resolving deltas: 100% (19/19), done.
```

You can now check the contents of your `workspace` directory, where you should find the cloned repo.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/git:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/git:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/git"
      },
      "image": {
        "docker-manifest-digest": "sha256:4d617d8639119cf65803d0220d1116c52d1bd014d80e07208643e10ce0dbc38f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c7aeffeae39ee2068957ecb39c2c7b532579bd6a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGdyiR62dPZTMBMbqgq6UY8qVs3pqh60SS1HvBNtNDGQAiBUKi9xrHB58YjzwKXRumxNtqv+OAqz7SxtDD9bf0IJlA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZDFmNGQ2MzcwM2JmMGY2MDY5YThhNjNlOWE3Mzk5YWU3NzNlYzcxMGJlYWIyZTg3MjE0YzdjNmEwYTg3YjEzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRFkxZG0wL0x6a2FoRElQL3VJSi83c0xEd0RzdDJTOTJvVHArZFB6TlJ0TkFpQmhKS05vMzRmMTgxVTZqMVhMVGtvaC9jcjY2NEMya1dkV25pc0d4cDNsQ3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlNHTTRNSHB5TDJVeFVsRTBNa2hTVW05NVMzQlRhVXRXUlcxRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1RWTlJFRjVUbFJWZVZkb1kwNU5ha2w0VFZSSk5VMUVRWHBPVkZWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsY1V0M1JUaGpRVEJLTW1kUVMzSklkVEl4V0Rka1YxbHlWSGRGU2tOUlRXZFljRWNLZGl0VFIxUTRZVEkyVTJOU0wwdFhXVEJFUm1SNGF6VmhLMlp0YjIxMlZGVlJOR0V2ZFhGQ05FWnVOMjFKZERGbGVHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2V25GekNqUkdaaXMxSzNjMk0weHphRVIzV21seVdHSjJXV2xuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcGthRnBYV20xYVYwWnNUWHBzYkZwVVNYZE9hbWMxVGxSa2JGa3lTWHBQVjAxNVdYcGthVTVVVFhsT1ZHTTFDbGx0VVRKWlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Ym1GWVVYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlhkTllXTjRaMEZCUWtGTlFWSjZRa1pCYVVKaVpGcFBhMVExT1hOS2RXSkRTR3BsWVdGb04yZ0tNME5UYUVsNGRrVnRZbTlxZEc1VVJESk1WVXRPVVVsb1FVdGFhRXM1ZEROeU5rSXZhRXhFY2xweFJWUlpkWFpUTVVKcVlTdENhVFJ4VVhOamVuaFdRZ3BYWjFSQ1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGREwxQlJNblZwYmtGTWNYaGxRVVZaY1M5SE1rTlJkMk5EVW1kR2NHRm9TM1pyQ25wUmJrTXhTMGQwTTNOT2RUZDRTMWhxV0ZocVNtTnlWMUJUZFV4eVZGVkRUVWc0ZVZkaU1ISnlZeTl1ZGs1alEwWk1URlZ6VkZsS1VYUk5ZM296ZFdnS2IyaFJaSEZVY2toTlozQTJXamxRWkRsalEyaGpaa2hKY1ZkNlFXeGxlbFkzUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1669681584,
          "logIndex": 8048963,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/git",
      "githubWorkflowSha": "c7aeffeae39ee2068957ecb39c2c7b532579bd6a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3569825204",
      "sha": "c7aeffeae39ee2068957ecb39c2c7b532579bd6a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

