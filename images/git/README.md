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
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-debian-11-r6` | `sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdede9d61b563ccb0a378233218a0040d24b4a97e0418d736708caa8394c7f55) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0-glibc` | `sha256:af5152abd84478baea8b1e0a687434b17688b285cec289e6142cbb03f4b96059`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:af5152abd84478baea8b1e0a687434b17688b285cec289e6142cbb03f4b96059) | `amd64` |
| `2.37.3-r0-root-glibc` | `sha256:998ad4405f08428440e6914c31cff5f248367a9c39976149b5cf27b506f466bb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:998ad4405f08428440e6914c31cff5f248367a9c39976149b5cf27b506f466bb) | `amd64` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r7` `latest` | `sha256:d4814fe2fb862c829f0fcaa0df07c192c2c139c9cb3a33dd40d38b458c4b1c25`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d4814fe2fb862c829f0fcaa0df07c192c2c139c9cb3a33dd40d38b458c4b1c25) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:1c276c30bca35bbacddf78fd89502ad7971e033ed40104455f2ad33e1be871d3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c276c30bca35bbacddf78fd89502ad7971e033ed40104455f2ad33e1be871d3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d4814fe2fb862c829f0fcaa0df07c192c2c139c9cb3a33dd40d38b458c4b1c25"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "87e9d194dfa1a8b7c38b698fcb0fe46151f84154",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAtxj064456VKMJqUNZsk9Td6TNI/pLFngvawSaE6CgKAiEAz6Iol0MNK8hjIK7q7gnvADF0oUsde/Ukb8v04eTjbbU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNzc0ZjY1ODQ1MmY3OTkzMjI4Nzk3OTcyNTgxOTM1MDNkYWY1NzQxZTA2Y2FjZWFmNjlhYWVjMjlhZjY4OTlhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ25lVXowMkRXZTZrc3QwYVZPR3hQd3RmZ3RKQlRKbW9LWDliTHBNWmk3MEFpQXpxTStKd0FoU00rbXJJbGVnK0tMTVJ4SG9qcWEzTlVLSnNlODVYN3ZnK3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhsbFowRjNTVUpCWjBsVlNERnpkeXRwUVRreE9GZzBNMjR2TTNsSlYwaEdjM3BHYUd0emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlZHZDRUMFJOTkZkb1kwNU5ha2wzVDFSSmVFMVVaM2xQUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNVm0xblVYcGpOM0ZoUjJsbVZrdzJXQzlLU1RGT2JWRm1PRnBTVWxCSFlUTTNSMDRLYVhKb01taFFRalZ1YTJoUldsQkxPVkp2Y1ZCUEwxYzRhMWswVDJGWFZFSnhOSE15WlM5WllqVnBXSHBqYldSbGF6WlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaUXpCUUNqSlFMekpoU3pFdmJXMTVSMHBOY0RFeWNrZ3piWFIzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaelJPTWxVMVdrUkZOVTVIVW0xWlZFWm9UMGRKTTFsNlRUUlphbGsxVDBkYWFsbHFRbTFhVkZFeVRWUlZlRnBxWnpCTlZGVXdDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1tUndaRVJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNW9VbVpYWjBGQlFVVkJkMEpJVFVWVlEwbEVla1l3WTIxMFMyczBLMDFoYW5ZMFZHMU1LMDF6Y1dSVVZTc0tMM2RzZFUxWFpIWkxVekoyVGxObVRFRnBSVUUwTjA1SFdrbHNURXhaU0hsTlJrdDRNV1pLVEd4cmREZE1hV2hyUWpSa09VZE5XbFF3U3pKSGQza3dkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVUZCZDFwUlNYZElWRFJoTjJGa1QyZEZTekZ0V25SS2FtTkhMemQ2UVhOVFEwOXFhMHh0YkRodE9UUlhWQ3RRQ21Zd1ZFbFVRbmM0YUc1d2FqbG1ORFIyWlVSc1lWWmtia0ZxUlVGM09XTlZPR1l4TUUxS05VaDRZblZRVUZWUVNIRm9NRXhpYVhOdWVGTTJUMFJtV25vS1EwNWtVMEZZTXpKV2VHSktZakl6V1d0amNXTk1Ua2hJYlhBNGNRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663784359,
          "logIndex": 3692358,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3100134304",
      "sha": "87e9d194dfa1a8b7c38b698fcb0fe46151f84154"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

