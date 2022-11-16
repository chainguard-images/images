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
| `1.35.0-r3-glibc` | `sha256:f34cbab8bb7ebecb1366f53c1de0c4a8f2e4164bb5f036fc7148ec93164c00a7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f34cbab8bb7ebecb1366f53c1de0c4a8f2e4164bb5f036fc7148ec93164c00a7) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e5677b566a454dd24c0182a113039261d3d595d0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEh4l5t9/bSlqwxbL+DMBUUB2PJVHs1hTxqW7G1TByxmAiEA0Ehtz1F3nLVj+OMsuktwqNzyyALaejT10ekoQoHK0nI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YTA3MjEzMTc1YzFkNjAzMjYyOGIzYzYyYTAxNjc0ZGFlMWU1ZTkzMDNiY2QyY2NjYTdkNmM2NmZiYjZhZjYxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRmppcWduOXNhZnAvb3MreVBxc2VNVmFaZzBkVFJTNUhLbmFYMVpwVTJpT0FpRUF6ay8wU3BwemN2OEpFbXlsRkVWaW85aUwvRlVFaVlNK0kxUVhJVE1IYzJZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwVFowRjNTVUpCWjBsVlpsSk1UVlZFWkd4b1oyazBkbmhNTjJRcmNEaEdibGswT0V3d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFRjZUbnBSZUZkb1kwNU5ha2w0VFZSRk1rMUVRVEJPZWxGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUYUZOd2QyVkxlVmxsVkZwaE5WUXpiVlp6VlRJMFlsZG9ZVEF3ZDBkb1pWQkdTbmtLZEc1SVNEVlZXVXBoSzJWaGRETlBOV05WYWpsS1dGUlpZbEp6Y0dGa00xWlpkbmcwV0VKa01rTkNUbmxEUzJkclZUWlBRMEZzVFhkblowcFFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTYjA5bENrbGxaU3RSVEZONFJGVmFSa0pDU1VaTFozVXdlbmxGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVlRGT2FtTXpXV3BWTWs1dFJUQk9WRkpyV2tSSk1GbDZRWGhQUkVwb1RWUkZlazFFVFRWTmFsbDRDbHBFVG10T1ZHc3hXa1JCZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpjMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZabEZTTjBGSWEwRmtkMFJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsU09UTnpTa1pCUVVGRlFYZENTVTFGV1VOSlVVUmFkVTE1VGs4d1lqUUtVV2xVZEdneVUwRmFWV1JoTTBOR2VITkdkblJoZVd4dVluSlhTQzkwVkd0RGQwbG9RVXg0UjFCUFdXSkhUMmxWWmt4M0t5dHhUalJYWlZSRVpDOXFjd3B6YlZSc0sxTkJRMFkwUnpOMlVsQjFUVUZ2UjBORGNVZFRUVFE1UWtGTlJFRXlaMEZOUjFWRFRWRkRSR1p4VjNWVk1sTnRkMnRrYVhoeFZqUnpVMFY1Q214SFZXUlVWRFpEUTNOak4wTktTekpKYkhZMVNtZFpPV2RaTjNWVVIxa3hPU3RTUjBSME5sUk5NM2REVFVoUFpWRnNhWGhQWjJ4b2NHSldWM2gwYzFVS1dFazFNVmh0WVc1aFZXcHlaV2xpZWxVMGVTOHZhR040VVdKR1V6Vk1ZazVuUTA5M04zQlhUbFJuY0dkT1FUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668559084,
          "logIndex": 7167250,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "e5677b566a454dd24c0182a113039261d3d595d0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475348017",
      "sha": "e5677b566a454dd24c0182a113039261d3d595d0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

