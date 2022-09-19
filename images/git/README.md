# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/git/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2.37.3-r0` `root` | `sha256:7b074fb059d67e1c068e323a5b623b8e29111ebc467dd2eec8ebcd2c403496df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7b074fb059d67e1c068e323a5b623b8e29111ebc467dd2eec8ebcd2c403496df) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r6` `latest` | `sha256:d7502f55a046a769c500c74a8c585642e3a3f876aa2421870eed4cc9d601b451`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d7502f55a046a769c500c74a8c585642e3a3f876aa2421870eed4cc9d601b451) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

The Git distroless image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull distroless.dev/git
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm distroless.dev/git --version
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
docker run -it -v ~/workspace:/home/git --rm distroless.dev/git clone https://github.com/distroless/git.git
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

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/distroless/git"
      },
      "image": {
        "docker-manifest-digest": "sha256:d7502f55a046a769c500c74a8c585642e3a3f876aa2421870eed4cc9d601b451"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "af22ca92d8de12023da7c9587ba5b8ced30be3a9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDvJgALHBq0tOZoRtKDhnIkzogxwodxHydLOvTAD2/d7gIgL3QtSpb1IMN81IALLYxze2F4jwvp9mRcGsLbsjBaU3U=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkM2U1MTc0OWUwMDBlMDA3MGJmYTIyNTIyODg4MzE5MDk2MzhlOGUwMDBmOGM0NjNhY2ZhMzI5M2VkZTA5MjE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ3htSTRJNTVqaUVSV0IrZENFb0JSTHFobDgvV0FOWktqR1NSdXY0VFFiSkFpRUEzZm5HSmt3TTY4WGdkVExlZFNubGtaQnFlMVdUa2k4R0VScVFEMHJIOTIwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJla05EUVhodFowRjNTVUpCWjBsVlVFOTZURk5SVVdSbE5HaDJTRVJMVTI4eFVsSjZXa3RXUzBrd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDRUVVJOTlZkb1kwNU5ha2wzVDFSRk5VMXFTWGxOUkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyWVdwSVNHTTROM2hXY2pOSmNqRkpVV3B5SzJwamRFOWtUREpTYjI0dlVuVlZNa1lLVldORFRXMVRNMVpzWVd4cWVUbE1iVVZyWlZSbE1rUlJkalkxTmtSamVYTjVlbk5xVEhnMVltTkVZMHRtV0ZSeFltRlBRMEZxWjNkblowa3dUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaVEZCWUNtbDNRMVJEZDNwdVkzRTNSVkF2WVV4NFlTdFBTMXBuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSMFp0VFdwS2FsbFVhM2xhUkdocldsUkZlVTFFU1hwYVIwVXpXWHByTVU5RVpHbFpWRlpwVDBkT2JGcEVUWGRaYlZWNldWUnJkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWJtRllVWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTMEpuYjNKQ1owVkZRV1JhTlFwQloxRkRRa2gzUldWblFqUkJTRmxCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsWTRNbTlUWjBGQlFrRk5RVko2UWtaQmFVSXZUR1pyZHk5cFJXOXdUa2MwUm5wM1prRTJkMHcxTW1sRE5GcHVhVkJhYTJaak5rTkNTWFZqY0U5M1NXZ0tRVkF2U3poYVZ6bHVkbWhLU0hKUE0yZFBiRTVsUlV0WldISjNkbWRIZFVFNVRFVkdkbEZGS3pFME4wTk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RUXBOUjFWRFRVaDBiall2U0dkS1pIWk5NRWhNTWtOMmFtNURSSEpTV0dOdFNsQTFOSGR0U2xoMGJrZG1kblF5UlZCRlZYVnVLM2R0UjFJNVdtOXlZM2hIQ25aeldrMTRkMGw0UVVwR1lqbEhWRkpOYjNWcUt6WkJkQ3RVZVZkYVRqazJWMGRQZEdoSlFWWmxNbXBzZUZwemFsUnZRalJMVnpKdk9FRnFUak0yWkVFS2JtdHNaRmt3YnpoMlp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663625478,
          "logIndex": 3564306,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085957640",
      "sha": "af22ca92d8de12023da7c9587ba5b8ced30be3a9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

