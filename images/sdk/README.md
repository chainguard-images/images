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
| `latest` | `sha256:ef0953c7e3f3a3ea485a12d8c890f779ace27da1bbda840edd77d9faa8f5e242`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef0953c7e3f3a3ea485a12d8c890f779ace27da1bbda840edd77d9faa8f5e242) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:6f7f8d333ae5a529b4f2aa4ca58d96b61cd3535d1ee703f69fca41e4ca4ba8a8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6f7f8d333ae5a529b4f2aa4ca58d96b61cd3535d1ee703f69fca41e4ca4ba8a8) |  |


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
        "docker-manifest-digest": "sha256:ef0953c7e3f3a3ea485a12d8c890f779ace27da1bbda840edd77d9faa8f5e242"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8e21530fc451da7a9d97eabaa4c515004973d07f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD7ejB3PzZoQYw7h99S9/7P8tkDby2e56sp1BT3a2xRsAIhAOBgiEJLmdaYRBLdftYKGosRm4YkRgoZD9BVv7Wn7Q4m",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMGIyMWY4NmU5YzJlMzVlMTgzZGRhNGE0YTdmNDE0ZTEyYmQxYmI1NjdlZWMxZTZmNjk3NDlkM2Y3M2MyYTAwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRjc3MmJDUlJoT1JvVndqNEc0YjNJY3VuOVZJUDdqK0E1WEZjSEJYUWRBREFpQkYvNDJsdGMxOU90NDZhblZDNlBBR3ZQa3VPT0JwZlArcFB2dENzZWloc3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlYwWkpLMHczVUZvM1NWTnJibUp1TTJSWE9YaERZMjFWUjJsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFVjRUMVJWZDFkb1kwNU5ha2w0VFVSSmVrMUVSWGxQVkZWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxV213MlZtTm5VM0V4Vlhwak1IVjVSakpFV2xZeVZtaHNTRkJ1VjNoVGRUbGlibThLZVRWSlFVeEtNalZhVHpGNmRHUlJRbnBFTWtkeGR6RnhZWEUzU0dGdlVGUk9WV05SVG5obVVWSXpaRk5VUXk5amJFdFBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqTVc1TkNqZ3hhRUp0VUhSNFdFNXdNVmx6VDJWM1dVNWpabTFWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQwZFZlVTFVVlhwTlIxcHFUa1JWZUZwSFJUTlpWR3hyVDFSa2JGbFhTbWhaVkZKcVRsUkZNVTFFUVRCUFZHTjZDbHBFUVROYWFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVGdGVUUm5kMEZCUWtGTlFWSjZRa1pCYVVWQmVVbGpVRlZZU0VwWGRuZHNNRmhtVEdkTFlWVUtUMnRCUVM5MGVsVXlTMVp1ZVRSM05HY3ZORXhxUTNORFNVRXlWSGhhVkdKelNVOWxVazFaWWtsek9ITmFWMUpVU1dwTWNuaEJiV3B4VDJGd2JXRjFRUXAyWWs4eVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVKV2FVaHpUVWxEVldRM2JWaDViMWxwT1ZKdVRrRTRWM2gwY1RFekszbGpRazQyQ25FdlJtWTFhVlZ1TjJsTVJVVlNOMnRIUVdSclFXVndVbU5TV1ZNclFVbDNabXRTVXpBclF6RklLMnRCZFhaWk9TdDVZazlEUldKeWVUZFdVRU5QUkhBS1FtVlVNMUF2WjFrdmFVRmxhVW8wZFRKUGIyVmtZMHRrTnpSbGJpc3liMmNLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666488002,
          "logIndex": 5670894,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "8e21530fc451da7a9d97eabaa4c515004973d07f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305262086",
      "sha": "8e21530fc451da7a9d97eabaa4c515004973d07f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

