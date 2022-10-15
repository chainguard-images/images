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
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:131eac5bc9d11a07344220c563f39c1718e749fe4ff40ec010ec14618efabb09`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:131eac5bc9d11a07344220c563f39c1718e749fe4ff40ec010ec14618efabb09) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:1bdafa670533e5295b29b6c6e6222c39ba0d826e88b187ac3f4d7c6bf0e2773a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1bdafa670533e5295b29b6c6e6222c39ba0d826e88b187ac3f4d7c6bf0e2773a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:1bdafa670533e5295b29b6c6e6222c39ba0d826e88b187ac3f4d7c6bf0e2773a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6a51353189bba4bd21dc0537358e4271af4e0dc1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFbc0WBIpo3cQvkolb8q4kvrB83GQ9i3evh8Op8TdHBCAiBE8Kgtj7bXr5UEfOxbzCJD2iUguS80fY3m3neMpO0dnQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4OGRhM2Y2N2QzODg3NjMyNDkzZmMwMGQ1YWI5ZjY0YmE5OTFiYzFjMzkzOTA5ZWVhMmU2MzNjNzNhYWFlMzU1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSEdKNWZxSlZnQ2VxVllpUllqU1RTQ1JvdkxlZTF6VFBkMW55NWZPeGcySUFpRUFxaFEyWDZNM1ZRK21BL3RiRlJKZk8rVHBlQXhXS1hXZXhLTkd0Zkg1NlNrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwUFowRjNTVUpCWjBsVlIxWjNkbXhNT0dWMVpVMWlhbXczYVRsR2VXeFNNa2hGUkZkcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFRXhUVVJGZVZkb1kwNU5ha2w0VFVSRk1VMUVSWGROUkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWTUUxdU9FUjNaa1U0VXpWSlUwRXlLM0E1VGxSUk5sQkxOWGRJVUd4VGRWUnJXSEVLUmpWQldVdG9ORlpGWjJOWGRuTm5jWEpXT1hOaFptaGhkM2xrTHpoc1dERTRjM05NYXpSclRsRXZRMGhESzNVMGFUWlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWVDFGcENtRmtWRGcwYzFadWEybFpZMUJZUlZCa2N5dFJNazVSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFV21oT1ZFVjZUbFJOZUU5RWJHbFpiVVV3V1cxUmVVMVhVbXBOUkZWNlRucE5NVTlIVlRCTmFtTjRDbGxYV1RCYVZFSnJXWHBGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVdraHlaMGxCUVVGRlFYZENTRTFGVlVOSlVVUkxOREJhZFdFek0xTUtaVVpPWldSb1VsZGxkRzFrV2xaUFpGSXJOVzF1Um5aNE9VcHZRMU16WW5kS2QwbG5VVmx4YjNCRVJFZFdVblJpVkZFdldYa3ZObk5vT0VvM0wzaE5aUW8zTlhCNllVWndXVUpMZW5wSmIwMTNRMmRaU1V0dldrbDZhakJGUVhkTlJGcDNRWGRhUVVsM1NYbHFaVXRFUlVWcGIzRkhUVWg2WldWMmMyaFhZMmh5Q2pOeVUzZHdNRkZSVUVGMFZsTXpVRUowTkZKUlVURmhLMU5TUTJWSWR6azRRVVoyVFRsa2MyVkJha0o2Y1ZNMU4ycDRjRWRxZVhoUGJVbEJSalphYzBNS2QxbFdTVGQzTHpCamIxUllSWFJVTnpkWVdrNXJkMWxZUkVoUlJVVjZhbWhITmxkM2FrdFVjVGxuY3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665795031,
          "logIndex": 5126316,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "6a51353189bba4bd21dc0537358e4271af4e0dc1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253837647",
      "sha": "6a51353189bba4bd21dc0537358e4271af4e0dc1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

