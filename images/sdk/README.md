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
| `latest` | `sha256:58793e7a0ec2c8bcb2c5db814e4af815e03bbbd2a0c19b49c42a057a011f931b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:58793e7a0ec2c8bcb2c5db814e4af815e03bbbd2a0c19b49c42a057a011f931b) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:5e2966def595a589b29a509c21070edf9106ad3c9c917c2bb46ec4873b39bfb6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e2966def595a589b29a509c21070edf9106ad3c9c917c2bb46ec4873b39bfb6) |  |


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
        "docker-manifest-digest": "sha256:58793e7a0ec2c8bcb2c5db814e4af815e03bbbd2a0c19b49c42a057a011f931b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "af7402ae65f96da0783957e62efd3c5029aeea38",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIB1Sr1y5wDuyHIPvXxjRvj+JzECoyHgomjA30Y2UaaKrAiBGWklGNqCixdBuoWDFktFJSQWly/V6wYiR84fc6gJzMg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYzlmYjM2YzVlN2Q2NmU3YjllYmYyYmNkNzE4N2RkOTljYjAzZWY2NGZhNWE4M2M4Njc4NmU3OWZhMzIyMmY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRU5hd1N4U0ppUFlLTUgvYWNoUllBdzBTdmZWLzBSbDQwM1VGKzg3YVNDZEFpRUFsRGZUTHdjUUR3YUFtN1A5SStQSFpsWDF3TGdyWUUyWW5QU2k3VUtZUU04PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlJtRkpiRzlEWjFGalRsZEZVWGxIU0U1MFNUZG5SRFJYWkRGVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFVjRUWHBSTlZkb1kwNU5ha2w0VFVSSk1rMUVSWGxOZWxFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYUWtScGJVbGlXamQ1U0hGNWQycFJUVzlwUWxaT1EwVkplRmh0TVZKUmNVdExOWGNLYTB4clpsQjNjbGRsV2xsTFVIWjFRVk5CV21GMU16TnpkMUV2WVV0TWNVRm5WakUwUjFaNFlVcEtjRGRLVFdsMlRXRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0VjFvekNrWnBkVEptTTA1UlowVlRXVVJtWlRSUlNFZzVUVlp6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWZFpNMDVFUVhsWlYxVXlUbGRaTlU1dFVtaE5SR00wVFhwck1VNHlWVEpOYlZadFdrUk9hazVVUVhsUFYwWnNDbHBYUlhwUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVWa2NFeDNaMEZCUWtGTlFWTkVRa2RCYVVWQmQzVm5VR1oxVlVWS2JVNTBjMGxqTjI1VlMwSUtVMHRDU1ROUVRHTnplbmhIVDNoYWNsVjROSEZDV0VWRFNWRkRZblZFV0ZaT2NuVTNOMUZEZDNGV1oxRjRVRVZsVGtVeVJ5dHpPWFF2T1dzeVJXRkJlZ3BEUTNsRGRYcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFYVTFXbU0wUlVSb09HaHBRVkp6VlhoV1VVbDNVWGwxVm1oa1ZIcDZUV2xyQ214dlJubENRWGczV0dzeGVEWkxkVFk0YmpOelRscFFkMDVySzNVNGFXWXdRV3BGUVhWVmNXOVBjMmxRTkdOUVpWZGpNRE0xZVVaTVpqZHVSbEJCVjNvS2RESXpielpUUWxGb1JuTmFNR1F4VldKSmFtNDBXVnBKVW5oeWVFbHphVU5LV0dwNUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666746838,
          "logIndex": 5871869,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "af7402ae65f96da0783957e62efd3c5029aeea38",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325300811",
      "sha": "af7402ae65f96da0783957e62efd3c5029aeea38"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

