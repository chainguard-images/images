# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.0.1-r0-glibc` | `sha256:9e27a876e657951c76c5a96d21470d29ac3f2922594048fd2465cba71c25422b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9e27a876e657951c76c5a96d21470d29ac3f2922594048fd2465cba71c25422b) |  |
| `latest` | `sha256:da5b9e9cd298bf442a7aee19c41c73fbbcb4e26fea22126ba97d1898359778c1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da5b9e9cd298bf442a7aee19c41c73fbbcb4e26fea22126ba97d1898359778c1) | `amd64` `arm64` `armv7` |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the melange codebase
by running the following:

```
make melange install
```

Then run melange commands as normal:

```
melange keygen

melange build \
  --arch x86_64,arm64 \
  --empty-workspace \
  --repository-append packages \
  --signing-key melange.rsa \
  examples/gnu-hello.yaml
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the apko codebase
by running the following:

```
make apko install
```

Then run apko commands as normal:

```
apko build --debug \
  examples/alpine-base.yaml \
  alpine-base:latest output.tar
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/sdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/sdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:da5b9e9cd298bf442a7aee19c41c73fbbcb4e26fea22126ba97d1898359778c1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b0a29cddef1e178a434f70b02d415c8058f1dba4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGmQ1LNTTr1S+xvRQXZl+rWQTPoO9Kl8ZeQgup223MSJAiEAm1jE2ltg743XNce3oY4+k95w2wwfkN7rd5vYDBfA5bg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMmI5Zjk3ZjBlNDFmZmI4YzJiMjVkMzJiZDFhZWZiMzI2ZjMwN2JhMzA4YmEyYzkzZGEzNThmZGMyMzZmODQyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNFb2swaENUYm0xSUROdTlHejJDWTlzRjFwRFhwVjNaWFpaSVZXVGUyOUdRSWhBS3J0Tk1JdktYVzh2b2F5V2FObEx3bWM1YXZxTmhLTC9TdHNqVmdHRXhOeCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVldEQjJNV1ZDUW1nek9YTmllRXBWU1hGNlFYTk9VakpuUmxGemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVjNUVlJCTkZkb1kwNU5ha2w0VFZSQk5FMUVSWGhOVkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOVFVRM1VIcFRVM2hLYlc5RFNtRXdlV0ZJY0RaNlpsbFVRVXcwUkhsNE0yeFFhVkVLTWtKSVVtbFNZMmcxU0M5S04yTTFXWEZxVnpkeFFrczNaVkZYVlhSb1YyZHBkR0pYVVRJNVUyOXZWR2h5VW5SMWJXRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOY0c0NENtTnpXamxKZUZCWE5VcDRWM0JSVXpaUFZYa3lVMEZKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcENhRTFxYkdwYVIxSnNXbXBHYkUxVVl6UlpWRkY2VGtkWk0wMUhTWGROYlZFd1RWUldhazlFUVRGUFIxbDRDbHBIU21oT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZaTlJsbHZVVUZCUWtGTlFWTkVRa2RCYVVWQmQyaDBOVEZMU0ROV1lsQmhNRXROVW1WbWFtSUtaMUpGY2poaGFEQlVLMlJSWlZaM1dHbGlOR0kyVHpoRFNWRkRRbEZHWmtaWGR6Z3ZkbGRYZDBGSVZXRkVNUzlJTlVNMVRuZzNOamxLWVRkTlowZG9Md3BuZEVKck1VUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQlJqbEZZVUZPVFhKUmFDOXNTWEZzZFZob1YwdGlia3BDT0ROS1dreEpabVYyQ2tOWFNFWjFhVFkxSzNkaU9ITlZRamhYYUZCWlJHdFNZM01yVlVGSksxRkRUVVpXUVVwR2JYSkZRVkp0UzNwM09HTnlkbTR6VkZFeE1XcHFOVzFzVmt3S2VWQmlOMXBQTTNoSWNtMVdSRWhXWTNCT1luWmpSVUpSUkhGR01uWk5VVXBpUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667869279,
          "logIndex": 6703599,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "b0a29cddef1e178a434f70b02d415c8058f1dba4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415276584",
      "sha": "b0a29cddef1e178a434f70b02d415c8058f1dba4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

