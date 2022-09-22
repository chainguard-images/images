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
| `2.37.3-r0-glibc` | `sha256:827fd7127994e565fbedf46dbb2a51607e1be3d0f302c9f4ce53b6c570edea8e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:827fd7127994e565fbedf46dbb2a51607e1be3d0f302c9f4ce53b6c570edea8e) | `amd64` |
| `2.37.3-r0-root-glibc` | `sha256:495881420cf5a5fae488fe580f4fc8dbf7fcc8e733fe866b0b493a80db269ff3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:495881420cf5a5fae488fe580f4fc8dbf7fcc8e733fe866b0b493a80db269ff3) | `amd64` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r7` `latest` | `sha256:57848e6ffe1f56c62aebbfbf370ab166b4601ef2cdd8c8477da49114989ca43b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:57848e6ffe1f56c62aebbfbf370ab166b4601ef2cdd8c8477da49114989ca43b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:302db732e377bb3ec8b5dd1d63a167ead8b69e6e648580ae7b372b39a248a90f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:302db732e377bb3ec8b5dd1d63a167ead8b69e6e648580ae7b372b39a248a90f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:57848e6ffe1f56c62aebbfbf370ab166b4601ef2cdd8c8477da49114989ca43b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ace6c54bdaf2a1902a4e7670850f6cb1174a38e5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDkMW92Yjohinc/sj/iWKuBavGicsIAHYdSTeBGAooskwIgWe+SRW+EaZgVGcCtmDdT0zX+zG+P4zHWSdwACjLO1rY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3Y2VmNDA4Yzg3ZTVhOGYyYWE2N2RiYTBiZTYyNTk5YzY4YjNlNDUyNDFkYzc3MmZiOTQ4NGQ4MTE0NTQ3NDc5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUREYlVoN3pXNTQ1bHFZbmYyOUg2WTE4ZGE0QnRCZ0Ezb2NORzZXelRGOFFBSWhBT0xLNnFGT2x6N1d3ZTRRcmN6c2h5N0V1YXJ2bkhRU2JkSWlmb2ErNlUwMiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVldFWkZORVI2Um1kR1oybDRTM2RUYUM5cWRHc3ZPVW94WTFKWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFbDZUbFJSZUZkb1kwNU5ha2wzVDFSSmVVMUVTVEJPVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHVEZrd2MyNXFRbkpSSzFKWGJHUmpkRzkyYkRSTGNtRkpZamxaYmxod1NsZFlWR1lLVHpFM1VVMXBWVVZCU25CemMzVXhiRloyT1dONFl6aHpWakV6TjFCU2VXNU5iV3RyZDNOTE5GSTRORmswYlhSWlYzRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2VkdoUkNpdGlWR3dyYVVGaWNqTjVPVWxPWjFWVmMwbHFXVlJ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhCa1F6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWZE9iRTV0VFRGT1IwcHJXVmRaZVZsVVJUVk5SRXBvVGtkVk0wNXFZM2RQUkZWM1dtcGFhbGxxUlhoT2VsSm9DazE2YUd4T1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Ym1GWVVYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZsM01FaDNVVUZCUWtGTlFWSjZRa1pCYVVKblYzWTJNa2h4VVM5aFFtSXpkelJKZFUxUGRqY0tlR05yTHpOQ00wVTNXRVJXUjNadFVVWllXRkpHVVVsb1FVeE5XRWhvYlRrMWNrTllabnBDU0djeFRFUlJNRFoyUzBzM2FIaDZWbFpvVVdaQk0zUnhid294U0dZNFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVWT05XdHJWMHBTV2tadlFUTlFWM2dyTTNoU05XbFFXamc0YkUxNlR6STBORVJMQ2swd1IyWlViRU5JY0ZaMmJtSm9hRlJEUkRkMkwxQkdaelJGYTFwR1FVbDNSbkp6VUU5T01YYzJaRzFFUVVjMmFERlFiV0VyWmtWUVFVWXdOWGR5T1NzS2VFTnVVMUEzV2pkWVZ6QjRSRmxSVGk5eE1HOTBVbGxqYjJKbloySkJPWGtLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663814181,
          "logIndex": 3716420,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102474894",
      "sha": "ace6c54bdaf2a1902a4e7670850f6cb1174a38e5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

