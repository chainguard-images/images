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
| `1.35.0-r27` `latest` | `sha256:8b1554a12a78e8fbb870bbb148452a9d74bf74d3635e66bbee84a0e3b28036af`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8b1554a12a78e8fbb870bbb148452a9d74bf74d3635e66bbee84a0e3b28036af) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:ad5253c513c65022193c84275ec6395b88d82ce1e194d9bffe04084ea0aaf973`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad5253c513c65022193c84275ec6395b88d82ce1e194d9bffe04084ea0aaf973) | `amd64` |



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
        "docker-manifest-digest": "sha256:8b1554a12a78e8fbb870bbb148452a9d74bf74d3635e66bbee84a0e3b28036af"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "3da54982deda34d649aad1046bc5309ffd367458",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCBsIJq/Prluc8njKWBZFEIcwNKdnWzSXi3XkkF8dEmMAIhAPOvdmYLNiDJ3fKHXBlpRu8MDWZJfr4gIejVNR4DJTtN",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZjZhNzdkNDc2YWYyMjc4MmY0OTQxYTU1MzA5N2I5ZGJiMjJlZWRlZWM5YzE3N2VjM2VjYWZkNGQ1Y2EyYmIyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNXTFltZno0cWUvUTU0S3o2OU9mWDh0blc4UEVmME8wT0tqL004cW1jaENnSWdZMzEveTVHcy9SNnY4UUJpb3BXVVBaY2pHYTdrcGFTN1NxeWE0alFpWUl3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrclowRjNTVUpCWjBsVldtVkxkM1ZKYUdJNGJVaFRLMjh2U0VoclFVVXZTa0puVEVSQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTmFra3hUMFJWTUZkb1kwNU5ha2w0VFVSRk5VMXFUWGRQUkZVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMVFd0RVdVUjZNazlqWVRaMmNsRXdRV1J4ZW1sVmRFRTBWMFZaTVhaelluRjJNRlFLWkZKSmRXVTRaMHBYU1dWSWIyRkdNVlZKUVVKSVFsSXdjSHBtYTJVNFlUTm1VbU14VVhCR2MwTTRaME5OTkVoUVlrdFBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOU201RENqVXpMME5oT0c1M05HeDNlaXRIVEZjelNYb3dWMFZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRUSlNhRTVVVVRWUFJFcHJXbGRTYUUxNlVtdE9hbEUxV1ZkR2EwMVVRVEJPYlVwcVRsUk5kMDlYV20xYVJFMHlDazU2VVRGUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5MMG8wYmpWSlFVRkJVVVJCUldOM1VsRkpaMVZpVFVabGNrUlFkVlJFVlZkemRXZ0tOVEZCY1hneE4xWkJZVk5ZVlZVNFZWcDNlRmRyTDBaT2N6azRRMGxSUkRkb1NYZEpNVmxxVHpreGJIcHNORXRoYTBoa2JtUnNXREZoVEd3cmFuQkhUQXA2U1RkblZGbFJOMjk2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFSVUZ4ZDFsdUsyeFFRazFrTlVjNFdtSjFlbUpCYlVOUGVYRnVaa0pOQ2t4TmFXRkRkbE55U0d4eU5GVmtNM0pFUkdwWE1VZDBSbTFwZW5CTFVHOVdOVWw2ZVVGcVFraDJSalpFU2pabmRFcFhaVXRqYTFSeWFrVmFWalpZZGxFS2VteHlSSFJGVGtwTlNrbFFNbTF0VlZjMU4zUXdNbm9yWlN0bWNtWXpOMjEzUjFWQ1JVNUpQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666220355,
          "logIndex": 5459672,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "3da54982deda34d649aad1046bc5309ffd367458",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3285557502",
      "sha": "3da54982deda34d649aad1046bc5309ffd367458"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

