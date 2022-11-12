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
| `1.35.0-r27` `latest` | `sha256:05a8a4479305290781c9574c4e33bdfa9667e100415a211c5bd41125e48b4ec5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:05a8a4479305290781c9574c4e33bdfa9667e100415a211c5bd41125e48b4ec5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5ed61bd97b1ec0aacd1f6e132219910c86194a9fa07c20047ebc3147bd692001`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5ed61bd97b1ec0aacd1f6e132219910c86194a9fa07c20047ebc3147bd692001) | `amd64` |



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
        "docker-manifest-digest": "sha256:05a8a4479305290781c9574c4e33bdfa9667e100415a211c5bd41125e48b4ec5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2196779d8df2cd102be1b39b8042c99f2a702e8e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC4AsFYswiNNeAcNC5DEeFOBzjDfCgDpe4yvE99KyR7NQIgLP5+14WHM4u52rYEjGfJbHIctAiMGxXXosFkv1WXw+0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNGU3ZmU5M2UzZDg1NGVkZTg2YzY0Yzc3ZmZhODg4ZDBlZDRiZDg3YjVjMGMwYzllZTZiNTU1MDhlMWIwMWM1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQzTE9tZDJyaUJoMFg2ZWNhOUNyQlBPbGFob1U0WUpSMTVKSEVSS1NtTk9nSWdUdldwMkZyV3hRT3NXSWNxV29BRDQ4MVh6bDhwR24wbTN6V2ZONzVuejNFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlRFOUVlVXRVWmxsbVZGaGpOSEpIVVUxb1lsZzJMMVJ3ZWxvd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFRXdUVlJCTTFkb1kwNU5ha2w0VFZSRmVVMUVRVEZOVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyUTI1WmRtcDVRVWhRWW5CclprbEZVMDVtVW04MGVHZHRhRzV6WWxCM1QzQTFZMk1LUVhOVlRGcHlUMk16VHpoTWEyRnBVV0Y0YWxJeVpHNU9WME5uVlVoU1oyZHBhV0Z3WVVwb1JWaEJiV3N4YlVwTGIzRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOZVVWUkNuWldNRVozV1Vkd2JqSjBOblF3V1cxVWMzUndNRWQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFU1hoUFZGa3pUbnBzYTA5SFVtMU5iVTVyVFZSQmVWbHRWWGhaYWswMVdXcG5kMDVFU21wUFZHeHRDazF0UlROTlJFcHNUMGRWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2NGTklaRWxCUVVGRlFYZENSMDFGVVVOSlNIbEtSR1pPY0VoNVkyc0tTV2xoVUVkUFVXUTVXVGxLZHpWaE16WTJPVmRqVUd3dlRrc3paRUl4WmtkQmFVRnBNaXRtUzNSa1FucHBPRlJXUnpFeGRVVlVLMUJsYldWVFIwdFNVUXBtWjFBMlEzZDVRVGxyZDA5TVZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtJNU5FaGtiR2hDWWtoTWRHRkRUU3RqV2tjMGFuWXdhRXhGQ2pnMlpUZDBReTkzZW1sWlVqaHlSU3Q2WmxrNFdIVmhaRk5TTlVKS1FuTk5kalY2TUVzeWEwTk5VVVJvTldOd2FtZHFaM1YyZDBnelVtMDVPSFZLUTFZS1dWTnNUM1pSUXpWNFVHWmFZbWtyWjJNM1NEUm1UbEJLUzNKVVIxcHJUblpLU21aU05HTkJZMlZSY3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668213689,
          "logIndex": 6903025,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "2196779d8df2cd102be1b39b8042c99f2a702e8e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448867631",
      "sha": "2196779d8df2cd102be1b39b8042c99f2a702e8e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

