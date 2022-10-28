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
| `2.37.3-debian-11-r8` `2.37.3-r0` | `sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09768f17d6ce9eced953fe8e87d88c8097f867ac487d99048565fc42def493f3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.0-r1` | `sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:69c9f045a42fa3e8d60b4d88642050de653bb51f967f162d4a66accada026103) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `latest` | `sha256:4d1964945ce92781127dd884dff4e9fb1e30c1001ef36fc86fa3333a3b462bc5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4d1964945ce92781127dd884dff4e9fb1e30c1001ef36fc86fa3333a3b462bc5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2` `2-debian-11` `2.38.0` `2.38.0-debian-11-r2` `2.38.0-debian-11-r3` | `sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:79aa1b7df6773d4722dca35908903cd86dacd5d4a10656017ce8c227d9c91db3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3` `2.37.3-debian-11-r9` | `sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34a5718f96c5747b52e0cb5f217a2441be29f425ede41e946b6ec646507221e2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-glibc` | `sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80de6d31ad4d06caf1091892c7df0c181afffe80809c84ce9f562a16634752de) | `amd64` |
| `2.37.3-debian-11-r7` | `sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fecf20ec858defbd6577b95d50e072a3836d8f390e7955a8e9801444c75ca75f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-glibc` | `sha256:8317a79d44b5761152fbf3c4aa61147bf52b67c23500da9f01827c1a126fe456`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8317a79d44b5761152fbf3c4aa61147bf52b67c23500da9f01827c1a126fe456) | `amd64` |
| `2.37.3-r1` | `sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0383d919339f5095c7c81f513cab6523e2fd323d5a524fbef3a89144d117238c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.38.1-r0-root-glibc` | `sha256:09959aa83658c7084d676044a7c53f337a65b53cb32244c951126365233432f4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09959aa83658c7084d676044a7c53f337a65b53cb32244c951126365233432f4) | `amd64` |
| `2.38.1-r0` `root` | `sha256:57c229ae38ef54f3e46cd9b00c622748b23a3a3bbf3916ca3ef94dc42d67fa76`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:57c229ae38ef54f3e46cd9b00c622748b23a3a3bbf3916ca3ef94dc42d67fa76) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:4d1964945ce92781127dd884dff4e9fb1e30c1001ef36fc86fa3333a3b462bc5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c6e588d5811f939d8c5e95f75214daadd81f8ea6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGaYwxup0jMorISUv7HEzFNWo1jJxhKc7ApaGYEdNj4NAiEAudoSKxgex119V2eP8qabuDIV5SmuN591TvaEiXozJJs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMDc4YjE2ODk5N2I4OGI0ZmY1ZjYzNWRkOWQ4YzhkMDk4ZDkyYzlmZTVmZmY0ZTJhYzFmMGYzZGYyMTc2NTRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHpIZmQyMm1YTzVUTkZtanNmOEszdEFxTVZOaFJuOFNtem16VU5jVmpCRUFpRUF4MnBORHNUVi9pOVZxT1k0dkpvWnBHeVlqa2dqcVpPb3h5bkplMGVPYjFFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlIwOXNWVkpuVFVOeFEzZHlTVTlxY1hsNVRuSjBVSFZMUlhGdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFbDVUMVJKZDFkb1kwNU5ha2w0VFVSSk5FMUVTWHBQVkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqUkhkc01sZzVVVFZTTUV4Tk9HUTVOR2g2U0VkUGVrOVRZMnRRVlVFMFRqVkNhRUlLYWs5clVDdHBVa05RU1hRMk56UmpjMVptWTFSbU5XVjRhbUphVXpVNVVuaGtjSHBuYVZOSldubE1OWFpxZVVOUVQzRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKUlZKdkNpdHVWaloyTVhSeFFYQnVialZ5VDFCRVRFYzJlSEZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcGFiRTVVWnpSYVJGVTBUVlJHYlU5VVRUVmFSR2hxVGxkVk5VNVhXVE5PVkVsNFRrZFNhRmxYVW10UFJFWnRDazlIVm1oT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Ym1GWVVYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVoSGQyNTJVVUZCUWtGTlFWSjZRa1pCYVVFeFVFcGFXbkZQTjBsbldubHlabFJoYUhFeWJVNEtPVEZRTlhwSGMwZGFja0ptU0RVdlkwOTNPRUpLWjBsb1FVb3JWQ3N5T1ZoQmEybEhWemx1WWxaelZYSnJNME5wTUdsS1MzUk1kMlJPVTNORE5tZHlkd3BTY1dwVVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVVMGFEWnljMjV5VlZaMFIweDJjWE4xZDNKU2NuY3ZiV2hZVFVzMVYybFRVVEZ5Q2k4M1RtNUVhRFpqZHpoMVlVTkROSEV4VUVadFdFZHpaamxaWlZreGQwbDRRVTlZTjB0Sk5qSk9jREZKTWtwMWIybEhNelI2VDBGS2JXZFFZazlpTkU4S1dtMTZWVEJPVkRCdVoweEVWakIzYWpOeGNrVnNjMDgxTlZoRlVURnNVSFZMVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666924180,
          "logIndex": 6017556,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/git",
      "githubWorkflowSha": "c6e588d5811f939d8c5e95f75214daadd81f8ea6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342342691",
      "sha": "c6e588d5811f939d8c5e95f75214daadd81f8ea6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

