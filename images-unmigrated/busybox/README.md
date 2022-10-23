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
| `1.35.0-r27` `latest` | `sha256:2243729077e02e8262566c20d81e02e502d5f8771ba5875f8bbc6ab7aac3f83c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2243729077e02e8262566c20d81e02e502d5f8771ba5875f8bbc6ab7aac3f83c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:ced0493b187e3b82c741440da6f2acdb1af7e2ffa392705923b468c9a2843e5e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ced0493b187e3b82c741440da6f2acdb1af7e2ffa392705923b468c9a2843e5e) | `amd64` |



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
        "docker-manifest-digest": "sha256:2243729077e02e8262566c20d81e02e502d5f8771ba5875f8bbc6ab7aac3f83c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1c8b4dd94c5e0810bc13a4a769e5cae51f96c80b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICxZgwM4mkuyNc6B5C4VMXeaMTXh6PxKuA2ITPZZRQNKAiEAkicCNcWQG0fF9Og9j42w/qIHkGP39gzwgg8nfuxJ6T0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MWIyZGI3ODNmOGRkODc2NjdiNmRmMGIyMDJhMDQyN2VkYzViN2FhYTE4NjdkMjgxNzQ2MmEyN2MzN2I2ZTA0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURCTTloYTJvaUtjTS9tSGloWXp6bURPSzI2cThJOTVhZm1BZC9qWXpTZWtnSWhBSUtjTzFxdm5SZ2xUTUZla0lUdzNjdlNwcXlnZnlRZ0F5MVJRcUtWd1dKeSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlQyWXZLek01ZWpJeWJFMTNSblU1VGt4MFNFUXhNSEJtUkdWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFRXhUV3BCTVZkb1kwNU5ha2w0VFVSSmVrMUVSWGROYWtFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzT1daa1Uya3JiVUZaTDJKTldqWjBhMmRqZEVkbVYxaGhUVXR3Y0ZaUVV6azNjV1VLTmpNdk4yaEZNMjFEY0hsa1NISkNiSHBPUXpKTmR6UkdNM1pyTlVVd2NEVk9hV1ZCWTNGTWQxSlpXbkV2VW1WdVltRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzV1dsMUNteFNibTVoTUZWbmRXZDVlbVJ6V2xsU1NtSjJhRkZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFUm1wUFIwa3dXa2RSTlU1SFRURmFWRUUwVFZSQ2FWbDZSWHBaVkZKb1RucFpOVnBVVm1wWlYxVXhDazFYV1RWT2JVMDBUVWRKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlExVXhRVUZCUVVGRlFYZENTVTFGV1VOSlVVUlNZM1JDTVZwMmNXOEtURWx1VkRKMVJrbGhLMDk1Uld3MFIyeFRWMmxzTmtsM2RHRnBOVGt2YUhvM1owbG9RVXRyYmpWdVZucDZVbmgwVERsck4xSXlVR3RJTnpWeldYZG5hQXBXU0RGeU5rOWtWM04xTTNaRE1HVkxUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRVUm9Va0V3UjJ4NUswTlJNMVZxY1ZsbFVuYzBiQ3MwQ25aQ2FtOXpNRnBJYVc5RmFIVnlNV1JPVGpOcFExSlplU3N2ZUU5MVVYQXpSamRIZDBZMWNURlZaMGw0UVU1MU5uZGtXRFFyTDFOWlIyNVhRWE5aWnpVS1dUQjZSVzlEWlhZd1NqZDJjMHRvWTNvM0wxaHVjMG81TjJKVWRVczFjVzB5YkN0WGJHa3hUM1J6Ym1Oa2R6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666486356,
          "logIndex": 5669589,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "1c8b4dd94c5e0810bc13a4a769e5cae51f96c80b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305284753",
      "sha": "1c8b4dd94c5e0810bc13a4a769e5cae51f96c80b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

