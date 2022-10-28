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
| `latest` `v0.1.0` | `sha256:3d8cf19557a686692658584b1ea81ddb13180b4e35ebe22d58cfd2f22479320a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d8cf19557a686692658584b1ea81ddb13180b4e35ebe22d58cfd2f22479320a) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:3d8cf19557a686692658584b1ea81ddb13180b4e35ebe22d58cfd2f22479320a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4b161cd99a72455742d483bc53a5b40a68f20f15",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDwNDwG1jPD5Y2CT9JfznXZsM213zQLFKzfAGYGkxJ6gwIgBXVVakaQIA+7h1UVns5bT2Fv2a9TRmezvMfdED80Fxs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhMjI0MzFjZTk3NGQwMzMzYmRiNzUxNjQ3ODgzZTQ1M2NmZTNhMzJkZDNhZjRiYjIzNTNiYWQwYWVhN2RmMTUzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR2RoSUhLVVV2N3FheGxxREFjR1pEZys5RllEb2FGamN0YWxGU2V5SUorckFpQXBZM2VNdlowVkFoRTAydTdoSTUwcW1PWFdyMWFkeWxYUnVtMDRvQURIbEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlpraDBWRnBqWkRKaGFXTnRWWGMzV1c5WFYzUnBOVEZGZUcxemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVjNUVlJOTVZkb1kwNU5ha2w0VFVSSk5FMUVSWGhOVkUweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwY0VWelpYSmtSa05VZVdsdFQyTmhUMUZxVjFKd1VFMXZZMVJ2V1c4M1JXRTNVWEFLY3pKaFJESnZRelI0ZVdSeVkyNW5aV2d2ZWprM2VUbHZUWFJSYWtwaFFrUnlUa0pxZERGR1VqTnFXSGhzVDBOcGNXRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoZWtOV0NqUlZWRUk0UlROemNqaDVNRVIzV1hSbWFYTldSMkpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVW1sTlZGbDRXVEpSTlU5WFJUTk5hbEV4VGxSak1FMXRVVEJQUkU1cFdYcFZlbGxVVm1sT1JFSm9DazVxYUcxTmFrSnRUVlJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlkwYzRPVGxCUVVGRlFYZENTRTFGVlVOSlFWVjZNV2xNZGpScE0yWUtWVXhDWjJaRGVIQlVkRFkzYzNGamJXSXlabkJIVGpoUVFqVkVlRGRLT0dKQmFVVkJlV2RFYkVaU1lrUkpiblYyTTNKUVNuQTRWMGM1Ymk4MlRscFhjQW9yYUZGM1JsaGxlbk5VU3pJMVJEaDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVbHVPU3QwSzBsTVFpOTRZVnBFTkRsNlowWjBZVzlzQ2t4aWJrNXpZa2w0WVdwVGRHRkxTM1JCYURaR2NrVm1lVEl4WTNKU1MzWjFlbFJZUTAwMGNWQnNkMGw0UVVwdFFtMWlNMFZCTW5ONlVFcG1OelU0VlVVS1JrbHljbGRsVVN0U09HdzRUakE0Y25SNWMyZFJZMGQ1VUc5clR6QlpOVFJTYXpjeFkyTldSR0YxWWxCMlFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666918909,
          "logIndex": 6013726,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "4b161cd99a72455742d483bc53a5b40a68f20f15",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3341937182",
      "sha": "4b161cd99a72455742d483bc53a5b40a68f20f15"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

