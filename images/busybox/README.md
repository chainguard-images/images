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
| `1.35.0-r27` `latest` | `sha256:b2db633cd50508f814ce1e9c42e55c632eedc3f857733eba364ab30991b3f29c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b2db633cd50508f814ce1e9c42e55c632eedc3f857733eba364ab30991b3f29c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:3022a815bc0ad98160f70437e0b8207904a2a46e349b05d394313d1e1d7414b3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3022a815bc0ad98160f70437e0b8207904a2a46e349b05d394313d1e1d7414b3) | `amd64` |



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
        "docker-manifest-digest": "sha256:b2db633cd50508f814ce1e9c42e55c632eedc3f857733eba364ab30991b3f29c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d1785af0eadcdd0aa3664096479b7e5459c3f191",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCqZUhGmHtfAyG/MxIeSUHF1PqRI5lu+J/ay3gW0mza3wIgezOCch3WMJuzGBJsE21ap4v7C225Kr/zpQzhfVDbDEU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4MmQ3YTU5ZGNkNzM2OWFiYTg5MGFmNjU5ODYzODZhNzI0ZTAwYzA5NzliM2FkNGQyNzIzY2MwNDNlNjY2OTNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNrK2VPTVVtV1cwZFhzM0FzS3dWZExHZTB1emNFWitHVGZvVi9RZGhCMFFBSWhBT00ySmhocnJHeEhhNEtOTDhnQWZYb0s1TDMvQ28wZ0hUWXRYS2RSejUzViIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwVFowRjNTVUpCWjBsVldFUjZUMjlwVDNSck1UZERZbmg1TUc1aFNEQkpjSFJZV0doamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFRXdUV3BWTUZkb1kwNU5ha2w0VFZSQk1FMUVRVEZOYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrYUhBclEyeGFjRUprTkZWUGEwUXlUak5zWVhCMmVXRk1lWFZTSzBwaWR6Wk9LMlVLVTBGWVkyeGlhVlV5Ymt0NWNFTnZWSE5TT0ZoRGFGVXhlRkZ6Vm5oTlRXMTJTR2d6TkdndlIxVlJjSE5YUkVOS2JuRlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNYzFsRENqRjNTaTk0VVRFd09WSjFRVko1YVVoaFkzYzFaWEU0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVVhoT2VtY3hXVmRaZDFwWFJtdFpNbEpyVFVkR2FFMTZXVEpPUkVFMVRtcFJNMDlYU1ROYVZGVXdDazVVYkdwTk1sbDRUMVJGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU1FVWjZiakZCUVVGRlFYZENTVTFGV1VOSlVVUkpWMnh5TUVwbFNVWUtRVU5RVDNwc1NXWkdiMlJaZVdKa1JYQlNOSGQyUkhFeFRWSlJkV1pOU1dKUlVVbG9RVTlVTmpCUWVTOWpSME4wYUZGVVZHbzNXa1l6YVdkdVl5OTVkZ3BZTDFweU1XczNia1JwWjFKaFoydHRUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlhMEZOUjFsRFRWRkVRWFZtT1ROd1FXaDZTRGhEZUZGSGRVbHhRMjVDQ2xreFFWZFRiMjF1WVVKQ1ZtOU1kMjUzTVRScFNFOWFVWG94VUdwcVVrSnlRMGRoYkVnMlNsb3JibU5EVFZGRE0xRXlVVEI1VmtOWlZYTTJWelZuV2xRS2RUSlJjblpGYmtrdmMyeHlVV013UVc1a2RIUTNjVWxuTVZZMGRHUlljRFJNYUhkTU5EZ3ZVM05qYnpGSU5YYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667522594,
          "logIndex": 6457073,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "d1785af0eadcdd0aa3664096479b7e5459c3f191",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390381073",
      "sha": "d1785af0eadcdd0aa3664096479b7e5459c3f191"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

