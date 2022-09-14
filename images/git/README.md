# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/git/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2.37.3-r0` `root` | `sha256:559b7347719057a241b7e971afce77bcf4ec33a69397927901a64c81b3120c2a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:559b7347719057a241b7e971afce77bcf4ec33a69397927901a64c81b3120c2a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r5` `latest` | `sha256:671fb8204e7a8035e7c24c9754f034d091eea5167a955ce675deb78e4b6c9138`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:671fb8204e7a8035e7c24c9754f034d091eea5167a955ce675deb78e4b6c9138) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/git:latest | jq
```

Output:
```
Verification for distroless.dev/git:latest --
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
        "docker-manifest-digest": "sha256:671fb8204e7a8035e7c24c9754f034d091eea5167a955ce675deb78e4b6c9138"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "48cff8c7c928de5eefefdbe01c0b2629cd2be2c4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBRmjNrL+V+SjQy5gdmm4YUVTePo4oeZ0CFAnWFycGP7AiEAq9dpEuy/v2gSxrLJ7Pe6YWREf2UeP3PL3JFw45QWGoE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NzM1MjRhZDRmNjk3OTJhOTJjODU0YzBiZTU3Y2VlMmM2Zjk1MWNlMzQwNzYwOGJkNTE4MTYzZjQxNDdmMDU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNvbGhKUXFsdDFGcTRMOXI4ektISUN1SjRGTG13WDMxRzdSZWtwTnFqVmhBSWhBSmNHdU1taHpweHdlK1BCd3ZzVU5PQXpnOGtHNVM3TEkvR3ZaL1VCaFN5aSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJWRU5EUVhocFowRjNTVUpCWjBsVlRrTnBUVzlqVkhkM1ltcGxkR2N4YW5WNFRIZGpNMlZWWW1acmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTmFrRjVUbFJWTWxkb1kwNU5ha2wzVDFSRk1FMXFRWHBPVkZVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpYjFjeU4wSTBWVFJPTjFORWVXWjZiMVF6Vkdvd1YzQXhOVWROWkZkbFNFUndaazhLYldsRmFtWmFhamwwTnpSRUwyMXJha3hUTUc4d1RuZE5kRE5NWkVsblNFbFNLME5tTkdwMFNWVkNiblZXT1dkd05uRlBRMEZxWTNkblowbDZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwWVc0NUNqaHZabGxSTW1oWlkwRlRlbTlJYjBOdGExVkhaV1F3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWTkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRlNkMlJZVG05TlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJRcExSRkUwV1RKYWJVOUhUVE5aZW10NVQwZFNiRTVYVm14YWJWWnRXa2RLYkUxRVJtcE5SMGw1VG1wSk5Wa3lVWGxaYlZWNVdYcFJkMGhCV1V0TGQxbENDa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWhqTWxWM1NFRlpTMHQzV1VKQ1FVZEVkbnBCUWtKUlVVOWFSMng2WkVoS2RtSkhWbm9LWTNrNWJtRllVWGRJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUdOdFZtMWplVGx2V2xkR2EyTjVPWFJaVjJ4MVRVbEhTa0puYjNKQ1owVkZRV1JhTlFwQloxRkRRa2h6UldWUlFqTkJTRlZCUTBkRFV6aERhRk12TW1oR01HUkdja28wVTJOU1YyTlpja0paT1hkNmFsTmlaV0U0U1dkWk1tSXpTVUZCUVVkRUNsQmhNeTloWjBGQlFrRk5RVkpxUWtWQmFVSXJWVXRyWkUxNVFrWm9halJuUkhkMVZFcHBWbVF6WlRaQ2JqWk1jVGswU2t0UlZtRmxibFl4TUZGblNXY0tRazFFYkhGd05UazJLMDFqV2tZd2FrWmpTMUJvTUZWdFp6VkNibTFDVml0SU1GSm9la05OUWtabGEzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkd3BhUVVsM1RIRndNa2hYTkdRcmJsSjFWakV6YldwbFRFNUphbVpHUmtWVWNIbE9lRUZTVldrNVFuQk9TMnhOVm5SS2EyaHVRbkI1Y0VneGF6UXhXWEp1Q25RclpHMUJha0pHV21wMGVXZFdhbXBaYTBJclFUVkJNVEIyVFZVMFFWcGxXRzVVVDFCVVZtSmxNbTFYTm5CMVZtVlpaSGc0YnpSclZYcHlablZVY1dnS2JrSlpNbFE0WXowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1663187186,
          "logIndex": 3501278,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3055828580",
      "sha": "48cff8c7c928de5eefefdbe01c0b2629cd2be2c4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

