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
| `latest` | `sha256:0b74fe3c8082c22d7528a34ac8aa3dafdb63a26538a35bd66cbf8e1f4d37e2fc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0b74fe3c8082c22d7528a34ac8aa3dafdb63a26538a35bd66cbf8e1f4d37e2fc) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:e8dfb6235f663d4286cf30ce7ae27a46a79a3361a8f712bef71ddfb90bff5f3f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e8dfb6235f663d4286cf30ce7ae27a46a79a3361a8f712bef71ddfb90bff5f3f) |  |


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
        "docker-manifest-digest": "sha256:0b74fe3c8082c22d7528a34ac8aa3dafdb63a26538a35bd66cbf8e1f4d37e2fc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2a05419173b026b24dbe004a0765cdb04dbdb661",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDp9yvHzkbUmyAQ0Elht2TZB+NZwtRHfxgEQ/r235ARZgIge+6CNtWEkCdaU6f/wUCvtor/XTtoZ4xL5v9owkHdpKs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNjc5M2RiMzY3YjhkYzQwMTJmNjAyMTc0MzRkYzE3ZWIxMTdjZTM4NjIwZTg1NDhhNDBmMWY5YWVkNGJjMWRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR3pWSEJTWUtkdmhIUElYSXpHRmFrUXl4Slg1R0xqT0pRQnNOMWhWWGZKOEFpRUF2TkJERzhWTE4zTGJNQWExNkFCQU9Mek1ubnl6ZGIwbXdRYjMxNWE3MzlBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlFrRlBiSGcwUmpBNGFGcHhhR2RUWmxaUWFVTm5VMUZOVTJKQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVjZUa1JSTTFkb1kwNU5ha2w0VFZSQmVFMUVSVEJPUkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLV21kNFQxSldXRzV5Y0hRck4wczRWbVpFYVRaWk5tNW5LMVIzY1dkbGFUbFZSbGtLYUd0a2MwRnZPREJEVUVaVGVrcEVWVXhuT0ZKTmIxWndObVJyZUZSQ2EyWmhjbU0wWldGbGRITXlURlJ0VXpBeVNFdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZaZUhOMkNuZzRSamd2WkV0MFIyYzJOelpYVkRKek5ISklSRkZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRXMUZkMDVVVVhoUFZFVXpUVEpKZDAxcVdtbE5hbEpyV1cxVmQwMUVVbWhOUkdNeVRsZE9hMWxxUVRCYVIwcHJDbGxxV1RKTlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlUxT1QyeEdRVUZCUWtGTlFWTkVRa2RCYVVWQk5qQTVVR1pxWTA5NE9UZEtPRGMzY1RoWlNXUUtWa3N2V1c5S1kyMXlWbFYxWm1kemEwbFJZbE5pUXpCRFNWRkVNV3h5WTI1TFZqbE5jR013TjNaMGQzRlFhaTlTWnpRck5taDJWMHR1WmpKcFRtVlRNUW96UkdONFYzcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQlJrSkRURzlWTldWMVFsRndTalpsUjBWQlZtSXlNa05OY2s1UVkzaGxaRVJZQ2xZd0x6SlpZbUZKUnpCTGFrSjNUbk13ZDNKdE1FUlFiR1Y1Wm1Oc01HTkRUVUl4ZW5acloxaHFTRzRyUkRodk1FaFFXVmhuUkVGR04wUjRiemM1UXpNS01XMTBPVzVRV1VsS1JVVlRVazVXY2tORVUycGphRWhpTm5reE5FdG9VQzhyVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667266497,
          "logIndex": 6261931,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "2a05419173b026b24dbe004a0765cdb04dbdb661",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3365852656",
      "sha": "2a05419173b026b24dbe004a0765cdb04dbdb661"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

