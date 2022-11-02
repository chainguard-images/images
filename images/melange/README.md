# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:75195a549c4a326f31fc3d87176c82fc14f89b1af92966f13c5b3569e1e51821`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:75195a549c4a326f31fc3d87176c82fc14f89b1af92966f13c5b3569e1e51821) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:75195a549c4a326f31fc3d87176c82fc14f89b1af92966f13c5b3569e1e51821"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d8697d630dfdeb32dc896a26f37458fed05c5f50",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBw/dMa0aPzNYlXrPKgzA8ESr4SwEoUwsWeo2mnV6T26AiEAqjz2EKDt4bSeLbpQvJfi125HJqAHClsKcq1ErLJEyZM=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MzBiZTQyYjg0YzFjOWY3YzUxYTQyZjg5MGUxNzgzMDgyOThlMThmZWY4OTFiYjQxYzM3NjQzNjdlNjdjMTI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN5Y3F1Y3VHU21NV3Y5SkRIZW5oQ3k2V0RaT0kxV3dvTmhnaFgzdE9zRWd3SWdIVHlZYlVaQkNhV1picXZvd2RFVVBFaTFoN1VxQVlpKzRHUk0xMFBPOE9ZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlNIWXJNMUpxTVdoQlJWZ3lNRloyZDFCbGNVaGpVRTEwU205VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVjNUVlJCZUZkb1kwNU5ha2w0VFZSQmVVMUVSWGhOVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMZVc1SllrMUpUVk5KYkhFd09HMWtTV2t2Tms5clVYTlpaVTlFVnpodlFraE1iemtLZW5KRVluVmhObWhTWTFCdFNYbHdNMjk2YUVOUmNqUktVMXBVWjJOcldpdFJaRzFDUVRaR2JtWm1VR1JyV0c1WVIzRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4SzJKekNtbEZXRFJSV2xobk5EUXZNMkZCWkd4U1ZYWjZjRkJ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVVRST2Ftc3pXa1JaZWsxSFVtMWFSMVpwVFhwS2ExbDZaelZPYlVWNVRtMVplazU2VVRGUFIxcHNDbHBFUVRGWmVsWnRUbFJCZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsUk1USjRaRlJCUVVGRlFYZENTVTFGV1VOSlVVUnpaRGMyT0ZOcmJsZ0tUSGsyTlZKd2IycHZRVUZtYkRsR1Nub3ZTVEV6ZEdOMEwwc3pUVUk0YzA1elFVbG9RVTlzYzFOV05IVlBaVEk0YTJOcFNuSm1RMDVGYzNsWFpUWm9Md3BEV2poaFpXRkdPVE5aYWpVMlYzQlRUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkVURGxIV21wS2FFRTVObWM1ZVhwa1lXRkZZVzFxQ25Od1dUSk9kbkppY1dSc1FtSldTbEoyV1VjME56RTVTM0JsUVRWWlNETlRNVUZ2YmpnMlMzZEhNRkZEVFVjMldEaFlXbFkzYWs1dlRTdHBkRGRVTVhvS1lsbFdSbU5aTjNOR2NVNWxVSFo2YlVKTk1WcEJSV0phTWpaWlZHMWxhMFZzU1hobldHRnllR05wVDB4VVFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667350879,
          "logIndex": 6323881,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "d8697d630dfdeb32dc896a26f37458fed05c5f50",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3373984965",
      "sha": "d8697d630dfdeb32dc896a26f37458fed05c5f50"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

