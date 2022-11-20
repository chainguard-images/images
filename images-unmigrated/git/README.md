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
| `migration-root-20221118` | `sha256:7761b59b4b0657cc17cbf842df0cd3f910b7aca1858320b1798fe52c72bc23ee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7761b59b4b0657cc17cbf842df0cd3f910b7aca1858320b1798fe52c72bc23ee) | `amd64` |
| `2` `2-debian-11` `2.38.0` `2.38.0-debian-11-r2` `2.38.0-debian-11-r3` | `sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-glibc` | `sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de) | `amd64` |
| `2.37.3-r0-root-glibc` | `sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629) | `amd64` |
| `2.37.3-r1` | `sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-nonroot-20221119` | `sha256:78a43443f0fa1ae53c843347482bc6382230317cefa390e8308f23a5fe46cd43`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:78a43443f0fa1ae53c843347482bc6382230317cefa390e8308f23a5fe46cd43) | `amd64` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r6` | `sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-nonroot-20221118` | `sha256:bc386c6aaf1de2dc6ae27656883df4d794bf02c4435306f70ce2817a446927b7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc386c6aaf1de2dc6ae27656883df4d794bf02c4435306f70ce2817a446927b7) | `amd64` |
| `migration-root` `migration-root-2` `migration-root-2.38` `migration-root-2.38.1` `migration-root-2.38.1-r0` `migration-root-20221120` | `sha256:65ac52217d0b4b8598d2b76789c57a10e3309d3b2ff401bd345c453d3c7f1d83`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:65ac52217d0b4b8598d2b76789c57a10e3309d3b2ff401bd345c453d3c7f1d83) | `amd64` |
| `migration-root-20221119` | `sha256:fb0b51c06fbf98fde46ee8831a1aa432f147e35b6b2f16ef95342274c4998237`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fb0b51c06fbf98fde46ee8831a1aa432f147e35b6b2f16ef95342274c4998237) | `amd64` |
| `2.38.1-r0` `root` | `sha256:6aa30e7012ec9fc00c9101b2690ff5df31a3d200326998999d179bc2a270df15`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6aa30e7012ec9fc00c9101b2690ff5df31a3d200326998999d179bc2a270df15) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-glibc` | `sha256:f41ddc8f2f654fea7e04f963d2857ed3cbe01cbb4251fad34d957e445b987594`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f41ddc8f2f654fea7e04f963d2857ed3cbe01cbb4251fad34d957e445b987594) | `amd64` |
| `2.37.3-debian-11-r8` `2.37.3-r0` | `sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r7` | `sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.0-r1` | `sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-root-glibc` | `sha256:f634a5a9a0f70ac12d46d255f3dd60220080425f36b2623af39da3e2e66764aa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f634a5a9a0f70ac12d46d255f3dd60220080425f36b2623af39da3e2e66764aa) | `amd64` |
| `migration-nonroot` `migration-nonroot-2` `migration-nonroot-2.38` `migration-nonroot-2.38.1` `migration-nonroot-2.38.1-r0` `migration-nonroot-20221120` | `sha256:e283948a36fd3eb50d8870be84b9f9fbd6b1bcaeeb80fa8f763e907fc0fcf7cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e283948a36fd3eb50d8870be84b9f9fbd6b1bcaeeb80fa8f763e907fc0fcf7cd) | `amd64` |
| `latest` | `sha256:61d82d785c6011c64521bb97020fa68de911d4db08ea66dcde7c877654c4ce58`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:61d82d785c6011c64521bb97020fa68de911d4db08ea66dcde7c877654c4ce58) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3` `2.37.3-debian-11-r9` | `sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:61d82d785c6011c64521bb97020fa68de911d4db08ea66dcde7c877654c4ce58"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bc7c9bcf1214ec413190a5c35e37b16e98d3cc26",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDdyYtMLqmpgDkbcEC1BC3pEry8OxRUmq/iqbNrq6kBtAiEAxUsq7SaLiQPLhwn5BRB2jQYw4T/Y+izVFh3G5aKuNMU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NzA0YmQ5NDMzZWNkNjE5MGU5YTkyY2VmMjYxYTNlMDVkMWZkMWYwY2VhMGZmZDJlZjE1NGIzNWNmZmRjMjg4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR5NkZsVlRVU0E1VVgwYndEYWErK3lsWGg1S0hQbnVnREhnZFRGS0hjeHlnSWhBTUpwcmZ6TTI1TFBBYUZZWjkwRFJWeDYxMVZZSHIxM3Q3dUlCVDM5SlRSaiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlEySnVaMjQ0YURaa1FUQlpPVUZJYmpKc1FWTTVURzFyUkZObmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1hkTlJFbDNUbFJSTWxkb1kwNU5ha2w0VFZSSmQwMUVTWGhPVkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzUm5BNWMwbEhWMmhoU0ZaU2RWcGhZVWQzZDFSWllURXdZekpZZFdkRmIzZDFTVmtLVjNSMGFrUmtRMjlQUlhwSlJsTllkV2xvVlhOWGFEUlBiR28xYWxoc2JrRmhOVWxWVDIwck1qUjVVRGRsTTFVM1pVdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyVGtWekNucExla05QZDFacFYySTRTVE5CSzI5aE9IQktXRFU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXMU5NMWw2YkdsWk1sbDRUV3BGTUZwWFRUQk5WRTE0VDFSQ2FFNVhUWHBPVjFWNlRqSkplRTV0VlRWUFIxRjZDbGt5VFhsT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Ym1GWVVYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUld0emFsZHpkMEZCUWtGTlFWTkVRa2RCYVVWQmNsUkRRbGhNVTNwcmMydFpXQ3RCUVZBNU1uRUtTbmRCYzBkemJtdHBlR2RUT1dzdlRGbHNUakY0UlVWRFNWRkRkMkpuVG5ScmVUQjVaRTVWV2xaNmFrTlZNRGx3YzI1RFIybG5VMHhrWlVkMmRYVTVOd3AwU0hsR05HcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYQnJNVTlRY0RsRFRUTk5SSHAwWjNGVGVtZEtOalpQUkdkQk1UWnFZa2RXQ25oc1UycDBSWHAxTjA1S1JqSlBVWFZtZGpaalZYTnJiRE5aTDNWc1lVUlVRV3BDT1RsMmRHNHZMMjlQYVU1RmNFY3dXRzlHVnpKTFpWTXpiMFpTTVRZS1lrRk9lRTFvUzI5bWFtUlZVVEp2TlRsdWFISkplbGR5ZFVjeFExWlZaSFpTZEdNOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668909966,
          "logIndex": 7451804,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/git",
      "githubWorkflowSha": "bc7c9bcf1214ec413190a5c35e37b16e98d3cc26",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3506058072",
      "sha": "bc7c9bcf1214ec413190a5c35e37b16e98d3cc26"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

