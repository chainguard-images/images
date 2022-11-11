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
| `1.35.0-r27` `latest` | `sha256:133b1c84ff152116d57ebbd946204adcbd0891f82b1d2ed81e0891ea5824ebf9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:133b1c84ff152116d57ebbd946204adcbd0891f82b1d2ed81e0891ea5824ebf9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:f31b6209ef85fdd58f4f7f3fcdae5ad542bf4d75363e393689715fdc377d5fc7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f31b6209ef85fdd58f4f7f3fcdae5ad542bf4d75363e393689715fdc377d5fc7) | `amd64` |



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
        "docker-manifest-digest": "sha256:133b1c84ff152116d57ebbd946204adcbd0891f82b1d2ed81e0891ea5824ebf9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e6eccbe3e8eb8f74ccdb3d4f2151a1d1cca09a4e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFPVm3SKTbjOiZFfPRzh0YQ7AZ9Nnt1cl38JxNn9kZ4TAiEAs0rcN6gE0uCxz5OWPmYPru+Ylf5aGggTJqj5BJAVfTg=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMDZlYTE2Njc1YTBkNTMyMThiMjk1Zjg2YjY4YTU5NzY0YzMxMDQyZWIxMmUxNTNiZGRkN2QxYTM5ZjVmNzc0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR0dThvVkx6bUpPWWRuTzFvclFOK1Fzcmt5cDdFWTdXazRFTDg3QksyU01BSWdGRzl3V1BOOGxZY20rR1BmL1FZTmRxZFFCUTk5eHhrN1RWWWloc3JNaW5BPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlduZGpabEIzVVhKTWVrRlRXa0ZPTUUxVFVqbFpkVWx3Vld0UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFRXdUV3BKTVZkb1kwNU5ha2w0VFZSRmVFMUVRVEZOYWtreFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTV0hWak5IRmFXbkZsWjJ4aVJrWnlWRmMyWjJkRlNFeHJlVWhDYVhkWlZ6Qk9SVmdLU2twSldrSjFSRTVWWTI0MVowVXhRVGh1Ym5oalNYaFlTMjFhWmxkNmNrOXJNVWRsVGpOSmVTczRVMjFIVVU5dkszRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1TUcweUNtZDVTVE5vYUN0alEwZEtlazAxVVhKalRqSmtNbFpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVlRKYVYwNXFXVzFWZWxwVWFHeFphbWh0VG5wU2Fsa3lVbWxOTWxFd1dtcEplRTVVUm1oTlYxRjRDbGt5VG1oTlJHeG9Ua2RWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU2Ewa3djMDVCUVVGRlFYZENSMDFGVVVOSlJIYzJkV0p4VGs1MFVWQUthVXN5TTAxS01XRkROek40ZGxBM01ITkxiMk5sZUZkcVJtMVNjVEJ6V1hKQmFVRTFiMnh2ZWxwM09VY3dUWHBMTWxScGVGbHNVVUZEVW1waVRsVnlVQXB2VHpoTlQyVTRlSEY1Y3l0cWFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtGdGJXa3dUMWhVZDFOV2VISm1aMms0VmpVNFFsVjZTMUpIQ2pnNUsyd3lSemczSzBKTmFrTk1Va2hwTkRObldHOVRSSEpITDBkbWRreGhaVkZNUjJOMVkwTk5SRGQ2YVZKa01rRlRhRzFCZVRaRmNXMDRiVEZWTURnS1pUbEliM05UTjBKWVprTlJSbmRVWTB0TGFVRkZWa3BZU0ZCa2Jua3phVzVXZWtKVWRGcFNUM0ZuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668127366,
          "logIndex": 6847706,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "e6eccbe3e8eb8f74ccdb3d4f2151a1d1cca09a4e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441567915",
      "sha": "e6eccbe3e8eb8f74ccdb3d4f2151a1d1cca09a4e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

