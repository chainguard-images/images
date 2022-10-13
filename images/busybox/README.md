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
| `1.35.0-r3-glibc` | `sha256:587156daa27be5d5c7c95c8095a980498851648ab22bae55130dd50b3ccaea8c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:587156daa27be5d5c7c95c8095a980498851648ab22bae55130dd50b3ccaea8c) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:3aacbe2dcff99073aecaf442715305e9623032ba17beb419b397fafb13f2ac3c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3aacbe2dcff99073aecaf442715305e9623032ba17beb419b397fafb13f2ac3c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39555ca00e2261f973570cd687c101b39ddd5b96654aeb85900c1566af78fdf8) | `amd64` |



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
        "docker-manifest-digest": "sha256:3aacbe2dcff99073aecaf442715305e9623032ba17beb419b397fafb13f2ac3c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a57756cf32222568ba0221b79ac8afe4dffcf440",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGOmmwPs1aNpxAzhqbLXJqnKY++/ZRJUmFAin6iuR0BEAiBOP9eA/xt5E/acR2WkX2UqFbsZwFirV50Uq2cqxxRxyA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMzY3OGNlMWFmZmIyODVjYjM0YjA1Njk1ZTM1NWUzZmQ2YmMzNjljODNjZjA4MDg2ODg3NDVmNTlkZTE5NzYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzFFRnFDU1JYRU0zUUJ1c2xvZ0IrRDNTMGkrTG96ekk0M0orMmJ6ZjJraEFpRUFqSnliM0FJb1lXenkyWUVMOTA4NUZrendQb2FBcmFFVFZkd2Z5RVFrejI0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhwRFowRjNTVUpCWjBsVldFbERkQ3REZVhCYVprRnNOVEpNUnpVeGFrSlJiR0p2VTJscmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHdDZUWHBOTVZkb1kwNU5ha2w0VFVSRmVrMUVhekJOZWsweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6ZEVwWUx6TjNNM1ZMVTB4UlRFVkRTRTV3TVVaVlYwWkdVVkpJU21sVmNuaFZPRElLV1VkTmF6WldSRWx0YlV4RGJUSlJaekYzTDNocGEzVXdiR1pxTkdGQmVYZEZVU3Q1ZFdGbE1ubDZaRzF5VkV4c1UzRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzSzBoTkNtb3dTM3ByY1VKblVHeEZVbnBuUVZsdUwxbElSRFZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWUlZNMDU2VlRKWk1sbDZUV3BKZVUxcVZUSlBSMHBvVFVSSmVVMVhTVE5QVjBacVQwZEdiVnBVVW10YWJWcHFDbHBxVVRCTlJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PVU40VEZaM1FVRkJVVVJCUldkM1VtZEphRUZKTXpWNVNVdGxMMU54UzJsSlRUY0tWRzFQVWtZdlducFVRVWxWUm1OSWNsTTJiSFJEY21kMVVuSjNaVUZwUlVGdlNtUnRaSEV2T0hWTE9YSXlNRlkyYlZFNE5GWnZPVk16WTFwNGVXOUZOd3BXT1hCelIxUXhXbGxSU1hkRFoxbEpTMjlhU1hwcU1FVkJkMDFFV25kQmQxcEJTWGRCYkZBM1MyOVpSRVJuY0ZGRlpHOHpabmhZUkVRMWFXZE1aR0Y2Q2tWcmNYSTFjRE55ZUhCemVuQnZWemRTY25sWk5FTTFPRFpvVTJKdmFpc3hNMEUzV0VGcVFteFVWVTVJUkhCR00wbGtSVWg0V21WMU1VUlJVemhVTVVRS1dEZFBiVGx2TjNkTVJUZExkV2MzV25aaGJWSnFaMWRUZVd4QlFXTTJRbVUzVW1sTlpFMXJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665653671,
          "logIndex": 5017973,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "a57756cf32222568ba0221b79ac8afe4dffcf440",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241242553",
      "sha": "a57756cf32222568ba0221b79ac8afe4dffcf440"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

