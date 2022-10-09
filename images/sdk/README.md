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
| `latest` | `sha256:6055d69a1e6b4267517ff7e4d333be09f19c115b0489f90726dad3f1040be586`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6055d69a1e6b4267517ff7e4d333be09f19c115b0489f90726dad3f1040be586) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:6055d69a1e6b4267517ff7e4d333be09f19c115b0489f90726dad3f1040be586"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b22a47d179193f4e201efa4c1e38c6f63b9772e5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGn7u0F7ZVQgm7S2GkvNxUAo/ekK+/vA2zD0Vd8TmqYTAiEAh48B15PKRGKNcEXIUhRa2Cx1A7Z/ZLxtqNmPT1J2RF0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MDgxOTk4MmY4NjdhYmQzNzQ4ZjQxNGU2NDkwNWY2OWIxMGE2MmYwZDJkNmViYjVjZDYyNjFjYjIwMTljMzRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQUc0OUpUWlVvS2VkU1NJYkV4eEVvN0JJVm5RWEkyYlZsN3ZMT1gzdnBVTUFpRUFuM2xVRi9PMkhIcmU3OFhEVnFuVWZQYkhiK0VlMUdXYllnRzJPK0xjSGRrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlpIcFhaV1kxZFhoaE9VOVZSWGxrUVZCQlEzRmhSMjVtU0ZNNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFVjVUbFJSTkZkb1kwNU5ha2w0VFVSQk5VMUVSWHBPVkZFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKTUhCSmNYbHBLMVZwVTJJNFpGcHZaV3N3V2pscmREbHBUWE16U0RaMGNFSnROVEVLS3poS1ZVMXpXbEZYZUVzNWVFdzFSV05EZVV4amMwOWFlRkpTVjNGTFRFSk9SMDVOZVM5d0wzTTRjVVZFV1hZd1VUWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRT1hodUNuRlBkelZ0VG1KWWVVZDZSWEo2TTNaeU1XeE5lbk5WZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldXcEplVmxVVVROYVJFVXpUMVJGTlUweVdUQmFWRWwzVFZkV2JWbFVVbXBOVjFWNlQwZE5NbHBxV1hwWmFtc3pDazU2U214T1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhWc2EyeDNkMEZCUWtGTlFWSjZRa1pCYVVKc1REUlJUWGhGWlVsU1JFcFhNRzUwYUZnMVIzY0tVVVI2V1VkaVprZFROalVyVGxkdmVHVlllVGhGZDBsb1FVcFJhRTVaV0hobVkxZ3hhbTluYVZaM1ZVOVljbmhWUmpSU1JFeFdiM2Q0VkRsVlNXZGFTZ3BXY0cxWlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRWMxWXpTMFkyTVVVNWRVZFNaVEV2YzNSM1puUllTRk00VVU1WWJrdEZWWHBCQ2xWMVNsQjFSV2c1V2prdkwyUnRhWEpxZDFaQlN6VkZXR0p1T0hkclFUUkRUVkZEWjFwaGJGUkJTWFZ6TTFkNFVESnBORnBrTlU1amNqaFBRMlJQYVhjS1pURjFlSEp1ZFV4NllVVndhWFpCTVRWM2F6SlJOVk41UmtGRFZsQTNRMlpYZDJzOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665278764,
          "logIndex": 4725521,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "b22a47d179193f4e201efa4c1e38c6f63b9772e5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212331532",
      "sha": "b22a47d179193f4e201efa4c1e38c6f63b9772e5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

