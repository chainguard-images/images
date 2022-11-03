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
| `latest` `v0.1.0` | `sha256:de5b6b7b36c4d8be61acba6c06058fcd5fd888eb79b0d6b9d6c49becd0cc7fd4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:de5b6b7b36c4d8be61acba6c06058fcd5fd888eb79b0d6b9d6c49becd0cc7fd4) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:de5b6b7b36c4d8be61acba6c06058fcd5fd888eb79b0d6b9d6c49becd0cc7fd4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7dbf482df205fc316bb5b395989972398977f51d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIARNrO8xfvN8ai7fkBSNe2kwhf3nQJaqevHxRNLi0PuiAiB9FhXso9mEUct/XQIzWmahIWjVvzQ16fbDAaZ3marCUw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMjJjYzgzZDQ2Mzk2ZmMzN2I3MDc2YTQ2NWQyZmY3MTQ0MzEzNTM2ODBkMmI5OWUzYmY4ZGZhNzFiMjQyNTNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQlBaVTl6MStjWVJHVnp1MkJIRExidUdVY1R2Z1d3K0lGV2VDclh1TzdCK0FpRUE5MlFvZ1JmRkU3UTNOU1ZhMm50aW43NjFES0ltSGIway9IbTQza2pRZStZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlVFaEdZbUZPV1VZMVZuZFhaSHBZU2xSQ2VHWlFTbkZ3YVdoemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFRXhUMFJWTlZkb1kwNU5ha2w0VFZSQmVrMUVSWGRQUkZVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWUkhSNVlrZENRVU5hYW5wUWJWZHRjR3BWYTBnMlFUVjNjM0psVW5Rek5VNU9jR3dLZFZKbllWSTFRaTk0VkRsVVJqaEVlVEZrZDIxUk5XUkJNRlk0VVZSUVRFWkJPVkJpTXpCTFlVVnlNSGxIWjNneksyRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVT1dRdkNqZHhTVUYzWjB3MmVFVTFkVUo0YzFrM00xaGtUVWRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWkd0WmJWa3dUMFJLYTFwcVNYZE9WMXBxVFhwRk1sbHRTVEZaYWswMVRsUnJORTlVYXpOTmFrMDFDazlFYXpOT01sa3hUVmRSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsUk5pODFaSGRCUVVGRlFYZENSMDFGVVVOSlFuZDZVelJyV1ZWeFNYRUtNMnc0V0hWQmQxQnFXVEo2T1ZKNGRVZHVUMWszUkZONFpVTlhkRmhQZGtOQmFVSkZXRzVtUlZJNVYzZExORTV2WVRCMlZXcEVOMVp1T1RVcmMwOXVUUW8wYmtsTlZrWktiWFJ0ZUVkVWVrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtGSWRGSjZTbFJXUVZGTFdURnBaekpaV1VwV05saExkakJvQ201MWVtY3hOamd2YURsVFNqQm9WMEZ3VldaR1ZGbGpNMVZYTWs1NVNXUlVTMDAwYVVOMmQwTk5TRWxTYldSMlNGcHdWRlk0VkRkTFEyd3hOR3B3Wm5nS1dUbENNVUp6TmpsU1FrVjNTVU5sWWpONWFFMVNZMGhRTkU5Q1UwSlpabFozYURoRE1XMWhkMmRCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667437152,
          "logIndex": 6392471,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "7dbf482df205fc316bb5b395989972398977f51d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382170140",
      "sha": "7dbf482df205fc316bb5b395989972398977f51d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

