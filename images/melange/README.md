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
| `latest` `v0.1.0` | `sha256:5578ce852cbb8f16d849dd981ce2ccf43ab58256b95872d5e5025735a9775dde`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5578ce852cbb8f16d849dd981ce2ccf43ab58256b95872d5e5025735a9775dde) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:5578ce852cbb8f16d849dd981ce2ccf43ab58256b95872d5e5025735a9775dde"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cb6166362c4f0253ab85d521c9480cbb830af224",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIE1lFLp+MdqSHo+V8lP69IXIUZv9fBDjZHPwRcTvecvyAiA24pXJa6wiRNUcLR8IQsDBxywdk8lwzR8gDasgGvQ3MQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMGQwMTI1YjVhMjI3NDM3ODM5MDA1ZDJiNDkxODZlMWE0NTExMWZkMTJlNjhlYTliY2VmMThjM2MyYWMzOGNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURWTGM3c201cHBRRjFIcDZFOFFISGNvckE2WmVONlpqdFRWZ3FmNFhPeDJRSWdmc1I0Mk5VVE9LUERhZDdpRi9ndk9MRXdZSDAvTTJ4Rjd6WTM1YXluYXY4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlVFcGFTREV5UkhWaVRXRllaWGt6ZEZCVFdGTTBjVEpvWTI1bmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFVjNUVVJWTTFkb1kwNU5ha2w0VFVSRk1VMUVSWGhOUkZVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0YlRNelJrcFNMMWxHZG1SYU4zWnFUV1ZCVXpscFFUbE1iRTVQTTJSQldFdzVWRVFLUWpJd1dGRkNaazl4TnpkUE5XSjBTMVpFZGxacU1GZ3lVV05NWmtGdlVEZE5UVUl2UVdNNWEyaE9jVzlGWVZGM1NIRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2SzFoNUNuTTVNVlJFWWpkeVlXUTRTMlJETVZaYVEzQlJSMkZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVG1sT2FrVXlUbXBOTWsxdFRUQmFha0Y1VGxST2FGbHFaekZhUkZWNVRWZE5OVTVFWjNkWk1rcHBDazlFVFhkWlYxbDVUV3BSZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVdrdEpOekpCUVVGRlFYZENTRTFGVlVOSlFWZG5OWGswT1dkUWNUSUtTSFpIY0RVNWFGUjNVakJNVFZFMU5tTlFOVmh6TVVkdmNrNUROekZhVVVWQmFVVkJjSE5vTnpsYVpIZFNaVlpWVUdFd1RtbHNiVlJqVWtWQ1lsQnZSd3AyTlhaaU1FSllWbXh4Y0M5alZuZDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVOW1ielZDUW1kSGFuQmpjMkpCTUdSTGRHOHlWVFZOQ2tGSlJHOXJRbFpDYzBOTGVXUnJRM3BDUkdsUmRIaFhhRE56SzJocWJIWmhSM0JtY2psb01UVjRRVWw0UVU1aFFVWldjemhpYkV4Qk1uQTFla1ZFY0ZNS1VXd3hRV0kwY0hsTU1HNUthbWRpVXpFeU5VRXJNVVpCZFhoVlJFbDJURWcwY0hSSlZEUktWRzVHZG5oU1FUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665795666,
          "logIndex": 5126811,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "cb6166362c4f0253ab85d521c9480cbb830af224",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253825318",
      "sha": "cb6166362c4f0253ab85d521c9480cbb830af224"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

