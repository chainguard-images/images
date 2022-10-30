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
| `latest` | `sha256:1cf077cef4152b1cf193c0bef2e8a041962ff29d1131c7cb4dba30b9066adce5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1cf077cef4152b1cf193c0bef2e8a041962ff29d1131c7cb4dba30b9066adce5) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:d054204bcd0f56a28e735aadbac24965ecb5ebdba9452b7a06d9539048739ec5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d054204bcd0f56a28e735aadbac24965ecb5ebdba9452b7a06d9539048739ec5) |  |


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
        "docker-manifest-digest": "sha256:1cf077cef4152b1cf193c0bef2e8a041962ff29d1131c7cb4dba30b9066adce5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "99c1aa358c7941f617db7cd1190c05bdff77ef74",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHxbYDuLaRIuWYgPknS3DHbJqiuRitVlMKdu6PjDrMCDAiEAwfFVLZUmIuwKp+mKmzLWvXFgaPtSmrh26u4Bt9chwBc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZGUxYTI3ZjJiMjI2NTRjYjc0N2QxYzliYmYwZjYxMTVhODZlMjUxNDQwMzhkMjI5ZjNhN2M3ZTM0ZTQ4ZDQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM1bzRCRUZaT2llZU9BalBHbjdSR295RjlGcDE3NWNlWlNobGdmL1lmZU5nSWdXVzZPYU5HZGpoUlZIQTQ2MkEwL3lBdGVQRG9Wamd4Sm9aM0x6OVpkY3dZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlJFZzNPVlE0UVdFM05FNXhWM2RvU3pCVGIycDJibFZ1VG1kVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVjVUa1JSTUZkb1kwNU5ha2w0VFVSTmQwMUVSWHBPUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzZG1wUFpsTjBjalJvVEhFMVprZDNSRU12ZVdKb1MybFdXRnB0YVhSMWVuSmxOelVLV201VllYZEJhMkZZYVc5MGQzSmllVWQ1UVdGeFJITjZkMjluTjNaTmEwbHFTazl4VVhkTlRXdExOM2R2WmtaRVdHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMYkV4S0NuVXdWelJKTVdKbmMweEViMGhZWW5odmN6QlpjR3BWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxUnNhazFYUm1oTmVsVTBXWHBqTlU1RVJtMU9ha1V6V2tkSk0xa3lVWGhOVkd0M1dYcEJNVmx0VW0xYWFtTXpDbHBYV1ROT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVwdU1qUm1RVUZCUWtGTlFWSjZRa1pCYVVWQk1tZFRhVTgxUm5oelkzRlFhbXRJTWpSdU1EVUtORlJVUm5SM1NFOWthR3AyTDFwS05sSTBhRms1TDFWRFNVTnNkREpKTUhST1ZYQTJZa2d4UlhWTldWWXZhMGxDWTNWUUszWjBSRWxPYTBWWGNtbGhWZ3AyUVN0dlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVWbWNXcG9jVmQ2WTJ0TmFGRTNTRkJyUTFGa1ZVeHRNbGw2ZHpZNGJVWXJlRkptQ2pSNEsycFNjMlZKU1U0NVlqRktibUpZV0cxM2JWZFJNVTlJTlRJd1owbDNRMmx0TDBFMmJraDRjbGN3VTFkUVYwbDNSbGR4VHpSdFluRnhOblJzWlM4S2RVNXZSMVpCZVRGUmVGSlBlV1JDVGs0MllscEpZa0kwWjJGWVRIcFlka1FLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667093099,
          "logIndex": 6133010,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "99c1aa358c7941f617db7cd1190c05bdff77ef74",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353529352",
      "sha": "99c1aa358c7941f617db7cd1190c05bdff77ef74"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

