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
| `latest` | `sha256:e3c6b1139567efa9e68a1623a914be7ac58dea17486b92a924fb56e4b6bcd7ad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e3c6b1139567efa9e68a1623a914be7ac58dea17486b92a924fb56e4b6bcd7ad) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:dcf1ebb28ae44c23d91f61911fab81cf46db4b810dc92653e98d334beed256d7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:dcf1ebb28ae44c23d91f61911fab81cf46db4b810dc92653e98d334beed256d7) |  |


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
        "docker-manifest-digest": "sha256:e3c6b1139567efa9e68a1623a914be7ac58dea17486b92a924fb56e4b6bcd7ad"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "528459df50b16fc503edded6e9fd3b604ebe08e7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDrmHsdg4tN4IbGIwuScUWLuukiuPz+Uy9r01S3T7W/nwIgIUXNlGQ2steQ4Pq1IX1LnU78S0ew8eh4RFA+osUCIxY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YmRlZjljNTU0ZjE1Mjg4ZTA5NmNmNGQwODQ5ZDk5NGM0NmYxYTA1ZGZlY2IxMWM1MDVhOTk5NDU5NTZhODgyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNWTXFicml0RjJheExtZW1NckhRRmc2akN2Y2RzMVpGbjd0WktBM2dKSDB3SWdCZGRNM3d4UGN1L1hLVkg5SWM0YzR0alJ2MERrOFBsWk1tQUdpRW9PVSt3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlFrUnBhbTlDZW5ocU5FdFFjR056VGsxSGNISTNRVEZVYlVaM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlZGa3hUV3BKTkZkb1kwNU5ha2w0VFVSRk5VMVVZM2ROYWtrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJVDBNMlEwbE9la28wU1hFdmFHZzFNekp1Y1d4cFdXMTBjR0ZvZWsxeVZqVk9hMW9LY0dKdFRsUnpWR0pDYzBwTlVqWkdTMGRGVFdwYVRITlNTRzFzVjBKeFFXc3lkSEl6Y3prNE5FcHZhVzFVWTJ0YWVHRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtTUVKSUNrWmtTM3BCVVVNNFYzWlhabmxsUW5sSGVUVllLM3B6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwaDNXVXRMZDFsQ1FrRkhSSFo2UVVKQloxRlNaREk1ZVdFeVduTmlNMlJtV2tkc2VncGpSMFl3V1RKbmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbFJKTkU1RVZUVmFSMWt4VFVkSmVFNXRXbXBPVkVGNldsZFNhMXBYVVRKYVZHeHRDbHBFVG1sT2FrRXdXbGRLYkUxRWFHeE9la0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmFrSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSldhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWVscEhjM2RJVVZsTFMzZFpRa0pCUjBSMmVrRkNRbWRSVUFwamJWWnRZM2s1YjFwWFJtdGplVGwwV1Zkc2RVMUpSMHBDWjI5eVFtZEZSVUZrV2pWQloxRkRRa2h6UldWUlFqTkJTRlZCUTBkRFV6aERhRk12TW1oR0NqQmtSbkpLTkZOalVsZGpXWEpDV1RsM2VtcFRZbVZoT0VsbldUSmlNMGxCUVVGSFJEaFRhMnRMVVVGQlFrRk5RVkpxUWtWQmFVRkNVRGMyYkVsa2FGWUtZWGxOTmpsTU9FVjJTR2h4VkhGWEt6bHpXa2RwTlN0MmJucFhjSFZuTTJkS1VVbG5XVGRaU1dob00yODRMM05QTTNaM1RXUjFWWGd2TVRaU01YZEJLd3BITkU1T05XSm5hMmt3Ym5Kb05UQjNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVdEtRMjV3T1VsUGJEQlNNRGhIV25jMVRIcEdaRlZDQ25wcVJGTlpkV3BaUm1KYU4wMXZiVnAxUjJOU09XTXdZbGgxZUhSUFRVeGlZVGxWV0RRNUswUjVVVWwzUzJkNVJraFhURmRqYlV4U2VXbFVhWFJNYVVrS1FVZEJTMGhPT0RVMVRXVnViWHB5WTJKamVtOXBSMjlFVEVaWU1UTTBObFJWY2s1cU5uY3lTbmh3TW1ZS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666198368,
          "logIndex": 5442405,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "528459df50b16fc503edded6e9fd3b604ebe08e7",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3283112282",
      "sha": "528459df50b16fc503edded6e9fd3b604ebe08e7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

