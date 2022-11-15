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
| `latest` | `sha256:c16aae3407b5217f305f0a01b9fbe528f73ef316ba13e384982bcefd40d92eb4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c16aae3407b5217f305f0a01b9fbe528f73ef316ba13e384982bcefd40d92eb4) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:73085e4942995b1da995a5e325e3911c4b3595272b10efca6bfcaf1d3cd7755d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:73085e4942995b1da995a5e325e3911c4b3595272b10efca6bfcaf1d3cd7755d) |  |


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
        "docker-manifest-digest": "sha256:c16aae3407b5217f305f0a01b9fbe528f73ef316ba13e384982bcefd40d92eb4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "11c35d03fc848e8cfa556eb6c09751aaa7782adc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDpjfcfHYfV0nvWWNVz9BrO2xnadN45GYx/DAHv1XSwgAiA8s3oCxH8moBKwsFTglur2v9gWJB3zxyvWnHxQcAMMFQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZDUzZGIzMjM0NTBkYzFlNTc3YzI5MmZkOTA5MGUyZGI5YTkyNjBhYjM0YWE4NzhiMTdkYWRhNjBhNjY3ZTc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRnh6SDFieXZBMnYzQWxkV2kvYytaZ1JaMFY0RlgrRTVidmNBQTE1eUtYd0FpRUFpOUNkakM3NVQ4K0pJT1hTcTQ0NEpkYWgvckJNM2N6YStVRFVTejNsYytFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlVta3ZVVXhJUldVMEwyd3ZZMWs0ZFUxSWJtMHplVXBGU1Rjd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVjNUWHBSTWxkb1kwNU5ha2w0VFZSRk1VMUVSWGhOZWxFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGTmxoc1RVRkJVRlJSWkhodVFuZExURmRvTm5JNGVHdEhlak5tVG01YWF6VlhkbmtLWVhSVE5qZFBWVTlpV0RoQmVUWmtkRzlpUjB3d0wwVjJRVk5rUTAxTVFrNW9WazU1UzNaSWR5dFdRa2hJZURkcVFtRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMYmpaS0NrTkRWemhxTlV0Tk1UTkdXVlJyTkZweUwwZHhMMEpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRWUkdhazE2Vm10TlJFNXRXWHBuTUU5SFZUUlpNbHBvVGxSVk1scFhTVEpaZWtFMVRucFZlRmxYUm1oT2VtTTBDazF0Um10WmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldWT1FrbElVVUZCUWtGTlFWSjZRa1pCYVVKdVMwNTNaRUp5UlhCcVoxQk1PVzF3Tm5kTU4yMEtXV2hoZFdOdFZISnFWVVk0TVVwQ1FtdG9jazAxUVVsb1FVb3pka1ZpWjNGaWFFNTVWMWtyWlRseFMwbElaR2RMVVhoU1luQlVTMmhIUkVGQ01IZzRad3AwTjNVNVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRFYwWTNjMk5YUW5GVWQxcENTV0YzV1c1U04ybzVUVmR0WTNOTGNtcHJZMnN5Q25RNGJXWnVNVGRvYW5wVFRUQkhNbkpuVkV3MGFWSnpiU3RuY2xCVFJrVkRUVVZKVGl0bmNVZHRVR1V3VWtSbFZIVnllV1p4TkdKNWFVVlNaVVJ4U2s4S1NGSkpXRlJtVDBaTWNIWk9lRTVIVHlzMk0zQTVOMDlCYkhkMmEwRTJWREI1UVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668474236,
          "logIndex": 7093465,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "11c35d03fc848e8cfa556eb6c09751aaa7782adc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466359337",
      "sha": "11c35d03fc848e8cfa556eb6c09751aaa7782adc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

