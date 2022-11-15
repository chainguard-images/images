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
| `2.37.3` `2.37.3-debian-11-r9` | `sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-glibc` | `sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de) | `amd64` |
| `latest` | `sha256:0bb36c139def4ece3e2a765ed4cd6ceb57d848291ace74660ed3ea81a6876745`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0bb36c139def4ece3e2a765ed4cd6ceb57d848291ace74660ed3ea81a6876745) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0` `root` | `sha256:42097c6ec90189758e36c1dd98770726ea2424f408576fba60dde1c66c0fd7f7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:42097c6ec90189758e36c1dd98770726ea2424f408576fba60dde1c66c0fd7f7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r7` | `sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r1` | `sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.0-r1` | `sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-glibc` | `sha256:49b94c9bba3be2ad46bfd1d5b6f37fe735e508ca8282edd03a36b37d6cf7907a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:49b94c9bba3be2ad46bfd1d5b6f37fe735e508ca8282edd03a36b37d6cf7907a) | `amd64` |
| `2.38.1-r0-root-glibc` | `sha256:e8c784269e413d0be9a319d08e565ac573a9b8ffcae39fd02b4c941fa3870825`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e8c784269e413d0be9a319d08e565ac573a9b8ffcae39fd02b4c941fa3870825) | `amd64` |
| `2` `2-debian-11` `2.38.0` `2.38.0-debian-11-r2` `2.38.0-debian-11-r3` | `sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r8` `2.37.3-r0` | `sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r6` | `sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-root-glibc` | `sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4f4c1f59f269485bcfd28a3c71a4cd3745ac9e72f4090988f4b2810a385a629) | `amd64` |


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
        "docker-manifest-digest": "sha256:0bb36c139def4ece3e2a765ed4cd6ceb57d848291ace74660ed3ea81a6876745"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "7dd0c95ac87271a4e1a186855fa7658799ef268e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDLzOzfDlUr68Aide15tbCPHBqkCNXXuwcXHdnSrv1cTgIgBN7Zoy8nBI8iZ+5bxTA9aLXtsRP6itoDFpgewaCN2ds=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNzRhYzZiZjVmNzJiNWNhOWU4YTgzYmY4NDlkNzBiY2UwYzRhZDAzM2NlMGM1MmNhYTIxMmJlNDFiODVlNDEwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSFZCTFh0WVVyU0ZQZ250KzRBU2xJRlNnc1lHeThuL2lCQlkwb2JMZG4xU0FpRUEweTdOSCs4cE9LSVNRWVMxYmVRbUoyRWhrRVZPTnJGQTQ3MmVPVk1QU04wPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlVFSlJTell5TUV0bVYzZEJLMVZYTWt4NmRIbGhRVWhqTDBWTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlZHTjVUMVJGZUZkb1kwNU5ha2w0VFZSRk1VMVVZM3BQVkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwVHpJek5qbFNjR1ZqU1ZkTmFXVjVaMjF0T1ZBMVQzTkxWRXBoUVVzNVZVMVRPSElLZDNSRFNHcDNWRk16UXpOMUwwTm9abmRqZGtvMlQyeGxNMUJLZWpCemJUTnJVVmxpU0VGaFdWRmpibXhzWXpVcmFXRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4T1VWMENuUXJVVWhRTjFGNVZVMTVVbVl5Vmk5cFRsWjVhbXd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUakpTYTAxSFRUVk9WMFpxVDBSamVVNTZSbWhPUjFWNFdWUkZORTVxWnpGT1YxcG9DazU2V1RGUFJHTTFUMWRXYlUxcVdUUmFWRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWJtRllVWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHRDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2gzUldWblFqUkJTRmxCTTFRd2QyRnpZa2hGVkVwcUNrZFNOR050VjJNelFYRktTMWh5YW1WUVN6TXZhRFJ3ZVdkRE9IQTNielJCUVVGSFJXWkdXbmxuUVVGQlFrRk5RVko2UWtaQmFVVkJMMnhsYW1wMFNTOEthMHRPYWxGbVJFdHVWMWxQZFhoc1ZETm9TMDV3TUUxNVYxQm1kV0ppVDBGVFNUQkRTVVJoU0U5bmNHWXZhbUpVTVhSdVMxWjNOMjVXTDJSNVdGbFhUUXBrWlVwbEwwWXhSVU5MTUZGMGJIQlNUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkVjMEZqUmpsdE1VUjZPWEl5SzJScldGQmxjVXQ0Q2sweWJXTjFVR1pWVTJ4bGVEVklkRVpQUW1rNVRYSkRLMjVrWWpCWWJWVlJha1JGZVdKbWMzcG5TM2REVFVaeldIaE9iRlpOTWxCVmRYTlJORlZHYzFVS2JFMDJXa0pLUjFoWVpIYzRXSFo0UVRKaFVVSnNhM2xWZFRKb1N6Qm9aR2RHZERWaU16aFViVnB6WlM5bGR6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668533376,
          "logIndex": 7144950,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/git",
      "githubWorkflowSha": "7dd0c95ac87271a4e1a186855fa7658799ef268e",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3472731927",
      "sha": "7dd0c95ac87271a4e1a186855fa7658799ef268e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

