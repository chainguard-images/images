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
| `latest` | `sha256:b2f493124e7b0a80785b1d4b4f1729623661fdebcfdd41bef514201dbc96956c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b2f493124e7b0a80785b1d4b4f1729623661fdebcfdd41bef514201dbc96956c) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:ca62f8fe2643a33fde3c94d24542c60741470089483d8f31cd42b34c8a5ffad1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca62f8fe2643a33fde3c94d24542c60741470089483d8f31cd42b34c8a5ffad1) |  |


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
        "docker-manifest-digest": "sha256:b2f493124e7b0a80785b1d4b4f1729623661fdebcfdd41bef514201dbc96956c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f916968e896656a71574ea990096139bb37764e4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDFlj/FQIyEIWgID/KKNf6hX1YCqLCpXVPJUK/N5rEqFQIgfq/q27bC32wbTsWEmq/QTZxFFJxzWowdn7L6zd5ubW8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNWY1NzA5MzczOGUyOGU2MGRmZDI0ODg2MmIzMjhkM2RhZjA1NzI3MzMzY2U1OGJhZDNkN2IxZDllOTYzNzdmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQzJ3eU10UXdwS2s5ZEs0Y2VId0k4dHRSSFdyVEY1OHVBY0FxaXJ0MnY4QkFpQVBuYi9zMEFtSUt6RUx2elJOQ3JxSzd4YTNWNWxLaTZKTEJySWFaTlZLaFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlFWVTFhRTh4Y0hkdVJ6bEZjaXREUjNoNU1YRkdXSFpsU1hoM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVjRUWHBCTlZkb1kwNU5ha2w0VFZSRmQwMUVSWGxOZWtFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1UjNwSFoxcHlZazF4ZG1GQmIyUm5SbE5XVjJaa1JHTjJiV3d3Y21wa09WVXlSVEVLZW5VMlJHeHhTV1ZwZGs5NFVEZ3JTR2d5U21RNFdtY3pWWEYxUTBwcFoyeHlhWE5oWVhOMk1EUnNTWHBxTW5KV2IyRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxWTBGWkNtNXZPV3BTVm1OMlVIUnZTa1pyYnk5NmFHcERhMjVOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtcHJlRTVxYXpKUFIxVTBUMVJaTWs1VVdtaE9la1V4VG5wU2JGbFVhelZOUkVFMVRtcEZlazlYU21sTmVtTXpDazVxVW14T1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZoNGExSkNkMEZCUWtGTlFWSnFRa1ZCYVVGQ04zb3ZVRFpST0dwSUwwSkNSa2xOUzNjMkszY0tPVklyVDAxbk1DOVpka053WlZsbldIWnpUMHBGUVVsblJsUlBZM2hGYWtSSlVXazJURWxDUmpOcE5HbHRUakpHWm5Nck5IQnNUMGhtYUhWNmNtUk5jQXBhSzNOM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVV0amFFdEZTREprVTAxclYwRlBibXBwWkc0NVZFaHZVUzlQVlVOQ1JUWnNSMXBKQ21jdlRubDJWMlUwYlU5QmQzcHRkVTlPWlVzNFNGVnpRWFprUmpsVlowbDNWWEIwYUdaQlVYZFBVMHB2TkZoamMwRm1VUzkyTDFVMFNGaE9XalpLWjJrS1FsaFhhWFJOTTBKTFoxQmhaWGxzV0ZsUWJFNDBSamhqT0U1MGEweDBORzhLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668042804,
          "logIndex": 6805476,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "f916968e896656a71574ea990096139bb37764e4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3432975567",
      "sha": "f916968e896656a71574ea990096139bb37764e4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

