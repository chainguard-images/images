# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/busybox/actions/workflows/release.yaml)

Container image with only busybox and libc (available in both musl and glibc variants). Suitable for running any binaries that only have a dependency on glibc/musl.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r27` `latest` | `sha256:46ffe2af7b1192ed24e792086275b6c96b6eb43fe601765c84658227c2f7a671`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:46ffe2af7b1192ed24e792086275b6c96b6eb43fe601765c84658227c2f7a671) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/busybox:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:46ffe2af7b1192ed24e792086275b6c96b6eb43fe601765c84658227c2f7a671"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "c8adb01fb12b6a34511fbd09c75544240ad3cc43",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCQb6SPCAwGihRvPneejg+FQFegeRxsKWDvvWk/8bfOvgIhAK64PwITB8Cv55dVhi13fPOpKetMOOIS4H2id+wAFxF3",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZDMyZjM1NTg0MGZiMTFhMGE2ZDhhYTVkNWE2YWY4MzU4NzM2N2Q5Y2I1YmZiYzc0MmZkNmYwNjJiNDEwNjNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN5NmZOYSswUVVYVjNiSjNxRFNWK0hSZXJOTmE0Y1NnV2ZMY0xnMFo1Z1NRSWhBS1A4aHVUa0xSRFpJdGNLcUdDUGtrWkhGUVNwczhidGxhSldmemFDRDlJdyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlFuRkpPV3RHWnprM2FHMVRZVk5MYVVKWlVtOHJlVlZQTDJWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHc3dUV3BSTkZkb1kwNU5ha2w0VFVSRmVrMUVhekZOYWxFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyWWtocVpHcFhUR0ZsTTFveFJtUm5SVlpKT1dseVZqUlNOVmxxUzJnMWMwRnZaM1lLWlU5M1QyVldSRThyZVV0UlozZEhVRU5wWkVKSlNUTTBkbEZwYW01cGRrcFBXa1J4VEZneU0ySlNjVFZrYkVreUwzRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGYUZOWUNsQkxOSGhET1U5S2NrOWlhVVpRVFhoeGFtUlJiVTF6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcG9hRnBIU1hkTlYxcHBUVlJLYVU1dFJYcE9SRlY0VFZkYWFWcEVRVFZaZW1NeFRsUlJNRTFxVVhkWlYxRjZDbGt5VFRCTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVU0xYmxCTlFVRkJVVVJCUldkM1VtZEphRUZLTDJsc1NVRjVjakEwVkRnMGNYY0tZMjVaUkdObFRIRk9hRVZMSzI0NWJISTRRbE5NT1U1QlZWYzVia0ZwUlVGNFEyVmlNVVpxVG1wUFJYQTFkbEpKTkVsTFQyZE9aSGhITkhkRVJsRmxSd3BMU0VWd1REa3haMWR2VVhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCVG0wdmFWTk5NMk5qT1RBMGQzVktXSEZLUzNwTWRVNTVNeTkxQ2xObFdGbHNhV1JaZGtNcmJHaG5aSEJHZWxwaU9GZEZWMXAwVGs5T1VGUkxNVXROTVhwQlNYZGFUME5wVHpaVlMyTmFTazAyU0U4NWVYSldRamc1ZUVvS1JtWkJXQzg0TmpoMWVYTjBMM05wUmsxUE9VWk9hRGwyWlVodGJWWXlVbGRYUVRGcVpFMW1VZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665654205,
          "logIndex": 5018526,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "c8adb01fb12b6a34511fbd09c75544240ad3cc43",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241299042",
      "sha": "c8adb01fb12b6a34511fbd09c75544240ad3cc43"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

