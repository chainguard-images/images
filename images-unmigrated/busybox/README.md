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
| `1.35.0-r3-glibc` | `sha256:e4af26ff72ba964e03aa077225329b88368f33f1e97ac9be45ac8c890dad7db0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e4af26ff72ba964e03aa077225329b88368f33f1e97ac9be45ac8c890dad7db0) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:090429dc4381088a96f6538eb8091c646d3008748f0248f9f11de4ff196ce90a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:090429dc4381088a96f6538eb8091c646d3008748f0248f9f11de4ff196ce90a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |



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
        "docker-manifest-digest": "sha256:090429dc4381088a96f6538eb8091c646d3008748f0248f9f11de4ff196ce90a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "af57623a1c19d2b14d55afc547ad576adee1bca8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGfhK+07mhiMQFf65VXvYPMz2N2f4pUFyZEoUd7K9py5AiAdGvDY9TULc6PPC1lDU7iZWYKLCt6v8pQzlVAyFw3DRQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2Y2MxYWUzNGE4ZmEyOGZiM2UyOTgyMjJkNWY4NDk5NDcwMzBlMWE3ZjlmMWY5NmRiZTY1Y2I2Nzg3NGJhNGViIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUMwR0xLR1E4cndZTHBZbTRKT0xBeUFheENHdmJIb3lpUUM2NUdzd2V5SWxBSWhBSUJQd3hBclhpc0xSYnlVWU9EYk8rREo1QVMxMGlwYjJMYy9rYzAwN2F4eCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlpXOWtTakZhVms1TmF6aHRWbWd3WkROc1lXeEhia1JhWWxsdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFRXdUbFJKZUZkb1kwNU5ha2w0VFZSQmVVMUVRVEZPVkVsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTYWpsWU9GbDJZWGRyTVRkMmMybDBkVGRNYzNCdlVsVXdNRGcxT1ZVdlVTOTRhVzhLWkRBclJtcDFiV1poWkUxdmJGSXZURUZGY21KbFEzWjJWblY2UWsxU1prdHBlSFIwTUVWRFMzTkhiVW95V0VWa1JVdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0Y2xwNUNrOU1LekZNWTJ3M1kyMWxRbmt4TW0xUllVSm9kMms0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIUm0xT1ZHTXlUV3BPYUUxWFRYaFBWMUY1V1dwRk1GcEVWVEZaVjFwcVRsUlJNMWxYVVRGT2VscG9DbHBIVm14TlYwcHFXVlJuZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsUk1YcE1PWGxCUVVGRlFYZENSMDFGVVVOSlFUVmxWU3RMYVVWdFNFRUtWVGgyVW5ReWVIbzFXWGs0YTNWblRIQnNaRTFFVUM5VEwxRm9ZVll2VW5oQmFVSnFURk52VkhKbFFtOUljMlkwUWpaelVtdEthMGQwYVRKdVJHOXJNUXBJSzFSQ1EydDJNVGxOV0dVNFJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQmFGZ3ZkUzlQYUc5YVlsbFVRVUo0VWtoR2IwUkdlVlowQ25wRU5EVnROVUZITkV0T2JWZG5la2wxUXpkeGJuUTVRVkp4ZDNsdFdITXpORXh1V1cxb1lrWkJha0ZrTTFGUFpsRldOV2RQT1RFck1DOTJhbk5NYnpZS1VGWllNbWhYZEM4M1YxaDZWVTVFVFRrclJFUXpOakpVUTB0NE5WTktWSEZRUjFaVVJWTnVhMWNyTkQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667349942,
          "logIndex": 6323166,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "af57623a1c19d2b14d55afc547ad576adee1bca8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3373997367",
      "sha": "af57623a1c19d2b14d55afc547ad576adee1bca8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

