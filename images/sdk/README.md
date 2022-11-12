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
| `0.0.1-r0-glibc` | `sha256:da3900f22bd413ed49a55dea807339ea781ba1eef8b01f4aa2aed85650b38c04`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da3900f22bd413ed49a55dea807339ea781ba1eef8b01f4aa2aed85650b38c04) |  |
| `latest` | `sha256:f0175b1618d4fc11b0fbeb03f50c8621fe2b5c6e51fd74d22b0e62e56360c8ee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0175b1618d4fc11b0fbeb03f50c8621fe2b5c6e51fd74d22b0e62e56360c8ee) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:f0175b1618d4fc11b0fbeb03f50c8621fe2b5c6e51fd74d22b0e62e56360c8ee"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f0b7d5172d5a8214ba10ab5e466bb06878bf3d4b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCwZAxCfExzBxrmaMwIQK6qTKHztrBXMrFqJh5j2xZJYAIgN3PrAQXVuiCXFiGTrx7hGmwLTmn+nZhRMXRHQ32atXs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmOTUwYTNlNDBjYTEyY2ExNzg0NmViMmZhMmM3MjIyYmI2ZTMwMDZkM2RkNmJlNGEzZmNmMzg2NGExMmIzYTZjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSCtpWHVFQTg1SGdiT0VlLzZqT2JYT0xWVTFGNjVQQzdtWXRYeGFaUXJtZEFpQnJxL1ZrU2YyUVYyd3dQNkQ2dVhEM2N5QXZNYWhCelMzQ0lyN1lDWGNtZUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVlJtNTJhM1ZTU0ZsNU0zWlhOazl0UjFWNlptSnVXalpaV0VoamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVjRUbXBKTVZkb1kwNU5ha2w0VFZSRmVVMUVSWGxPYWtreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpVVhWUE1WSlpSa1JsY2xOMGMyVXpWMU5TU1daNUwyTmpLM2htZGxKNU0yZDRXamNLYTJwRFZIRnlaa2RKTmxVMU1tMVBaa2xzZGtwMlJVaE1la0paVGxoS1ZsQnBlVkJsU2lzelkydFBabEJNUjFKRFJXRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxZEhReUNtNUxhVkZ6Tm5jMk1HSXZlbWcxVVhJdlRHVlZVRkZyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtcENhVTR5VVRGTlZHTjVXa1JXYUU5RVNYaE9SMHBvVFZSQ2FGbHFWbXhPUkZreVdXMUpkMDVxWnpOUFIwcHRDazB5VVRCWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldGWGFraGlaMEZCUWtGTlFWSjZRa1pCYVVGalQzZHdRamxCZURKSGJXczNSMDB3WTBOamIwa0tjall6TTA5R2EwMXJjRVpUUVVkNFpGWkVXbGM0VVVsb1FVMVpiMHQzYjNKYU0zbzJjakkwVG1oelVucEVjMjlLY1RZeFdsRnVUVmh6ZFN0c1ZqZHhaZ3BFZGxBNVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVKU1puZzFjSFUyTkRsck1YaDZXakZWVjFOcFRVTXpWMVZ1T0N0NlRHZFZaWGQyQ204NE5sRllUbTVWZHl0a01WVnFhalZYYjNaemMwUllUMHRUVlZVMmQwbDNTazlzVGpnd1dVTkhhR2RqVkZVeVRqRjNSVnAyZEhocWEyVnllVTFoU25RS1kyRlVaME4zTldGVmEzaHVWbGtyVFdkUk5rVlVZVTEzVms1SllucHZXamNLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668215795,
          "logIndex": 6904647,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "f0b7d5172d5a8214ba10ab5e466bb06878bf3d4b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448845708",
      "sha": "f0b7d5172d5a8214ba10ab5e466bb06878bf3d4b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

