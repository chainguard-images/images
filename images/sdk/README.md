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
| `latest` | `sha256:972f240faf055a63d95c16f23114f1a0faa479ca29a364e551ce10a73a2d300b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:972f240faf055a63d95c16f23114f1a0faa479ca29a364e551ce10a73a2d300b) | `amd64` `arm64` `armv7` |
| `0.0.1-r0-glibc` | `sha256:56e908a4393af1536eca44c4ff41f8deb72d30c5c3a34933e3c04789aaf8cfaf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:56e908a4393af1536eca44c4ff41f8deb72d30c5c3a34933e3c04789aaf8cfaf) |  |


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
        "docker-manifest-digest": "sha256:972f240faf055a63d95c16f23114f1a0faa479ca29a364e551ce10a73a2d300b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "740fe320a7679b3f1cb14a6fb795c9000d28d7c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB5387J3ksOeimQUZABAhoSOWODnYoJKt+ZgZmNJTyhAAiEAoo7B3xjUYSGyQ1HNZpLRx5ji8vKROEUgQ6EjN5IS88Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4N2E2YTAyMDBiNzU5MTk4OGY4Y2QyNWZmNDRmMzYwY2IwNjQ5YTQzN2NhMmVjN2Y5M2M3ZjkxYjliMDdkNDdjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURPczBMS1RtUzhaNjhRdXAyZnJDeWR6dStkSklMWHA4YjFMK1VSSUVWWXhBSWdkRG1BTjN4ZVljcTRWZExoUXhxa3ZidmZ1MGFIeU14Rkx0QXJtbTJrTjBjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlZXRm1lVVo2V25wM2RIVXdUemxrVWxRd1ZFRmpaWEppYkRWSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVjRUWHBCZVZkb1kwNU5ha2w0VFZSQk1VMUVSWGxOZWtGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVWTB0dWJTdFhlRkJ4Vm0wd1EySmlUSEpDYVdWQlZXWjZkRUpFSzBjeFUxaFhNRzhLTW5GNFdHMXNWak53Y0Znck5IVTJTVmRyWkZkQldubHhTVmRYVmtkc1kzSndTMnRNV0N0cVpEUk1hM0ZIVFdGVFRIRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4Um05S0NqazJRa294UW5sSFZFVXJSbnBWT1ZOQk0wYzRkMUpGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRucFJkMXB0VlhwTmFrSm9UbnBaTTA5WFNYcGFha1pxV1dwRk1GbFVXbTFaYW1NMVRsZE5OVTFFUVhkYVJFazBDbHBFWkdwTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZKV2EzSjVaMEZCUWtGTlFWSjZRa1pCYVVWQmNVd3lNVUpXZVZOS1ZHWnNSVmc1VURSM2FHMEtXRk5HZUVaaGVFWmlNalpYVFZaQlJVRlNOVUpEWWtsRFNVTXlkSGhSZFdVeGVFWk1ObFZ3TkdSaFJtOUxSVWhoY0RGWmIwNW9WVWREZEZOSlNGZHNSQW8wVjBjMFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRGIxWlFNM3BQVVc0ME1FVktUMlZoUnpneVZFTndTbUZIYWpNMGFHNWtPRlZWQ2xWa2FrcHlZMlJZWWpoa2JrUTRkVE5NVVhwSGVXd3lVRTlVTm1reE5VRkRUVUZ0U2xGSGRWQnNXbXhWY1c5T0t6TnNMM0ZtS3pWQlV6ZFNXVXB3V0ZjS2NUUk1USHBVUml0SU1sVldVMk52VkU1UFRGQkVOVTVKUVRrelNsWnVTRWt4WnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667610798,
          "logIndex": 6529740,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "740fe320a7679b3f1cb14a6fb795c9000d28d7c3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3397984570",
      "sha": "740fe320a7679b3f1cb14a6fb795c9000d28d7c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

