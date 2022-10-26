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
| `1.35.0-r27` `latest` | `sha256:80da1aeb6d3deedc131846fddde45c66ed4e57b8a34de22bea0c01d202873ec4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:80da1aeb6d3deedc131846fddde45c66ed4e57b8a34de22bea0c01d202873ec4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:d1947166da3e86cfe5dad55db08b74f7e661d55dcec87697977b8e8d88dff8f0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d1947166da3e86cfe5dad55db08b74f7e661d55dcec87697977b8e8d88dff8f0) | `amd64` |



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
        "docker-manifest-digest": "sha256:80da1aeb6d3deedc131846fddde45c66ed4e57b8a34de22bea0c01d202873ec4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7b347e21b554fda366943071a44d6a1646508475",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDZFstfzW1auwJBcNZ7xRlYcytBcoSwnKVyHvDlbBswvgIhANBe2BnKfDr7Z9UyllqJtQjFHJY1vgdeObUrhQL36dc7",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNzNlMmRlMzhhYjg2NjM5ODRjODRkZjA2NjVlYTE0ZDY2ZjgyMGM1OWY3MjQ2NWM2MzQyNDVmNDIwN2JhYWNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNZL2I4S0tFeHRLK1BPOGdNeVZjWXkvTHdNeDc0cjdvVjNKTGpVZkgyTER3SWdON2svZ0xNZytMRG9nRkovVUtRbm5nTHNmMGRYQkg4cktlZTFYVis0NDVJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlVEQkdVMnRwUkZoUmExZG1RamxQU1RseWQzUTBSbGhKTjNGVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFRXdUVlJOTUZkb1kwNU5ha2w0VFVSSk1rMUVRVEZOVkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHV2s0ME1tcFBUMlF2YjBSNlJXMUZRelI2ZGtoQlkxRXZWR2h1YVdOSldsQXhNbVlLUXpSWmJsTTJiM1Z0TldOU1dEWndhM1ZqTmk4MFR6VkVLelJGYzFkeVFrMTBWbkJSUVZKVGFreDZTWFEyU0hCWWJHRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWTXpSSUNqRnpiRXBVTUc1UVJuQkpSVUZxYm5ZNWR6aHhXRXRaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFWkdsTmVsRXpXbFJKZUZscVZURk9SMXByV1ZSTk1rNXFhekJOZWtFelRWZEZNRTVIVVRKWlZFVXlDazVFV1RGTlJHY3dUbnBWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUlVuWk5WMFpCUVVGRlFYZENTRTFGVlVOSlFraE5SMUZsVFdNdmJsTUtRbUpVUzBsSGVVNVFNV2RpY1VFM0wxWkxZMGxVVFVScldVRjJTM2MzYlRsQmFVVkJiVVk0TDBoNmJXUkJOMk5WUjFSeVVXVm9hVlp5YkcxVlVWTmpUZ3BXUzBjdk0wbGhOMVZ5V21kWFJrbDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVNVNiMnR2WjNsNlVGZEJlaXRxUzBrMlIwOXVkWGxsQ25wYWVXbFVjVXBZZW1oYVZHY3ZTMG92VDI1NVpsVnJNMWxvVlVaMlRERlpTbTFHZURsUmJYUm1RVWw0UVVsdWFGSktlR1JaUkhOVlVtVnRlVXhQUjBnS1ZXc3dMelZhYWpoNmNreFNhVWhrSzJOcldYbGhlV3BuVXl0Mk1YQlhSbVpUWm0xVVVTOVdXbmxGZVVzNFp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666744920,
          "logIndex": 5870277,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "7b347e21b554fda366943071a44d6a1646508475",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325326255",
      "sha": "7b347e21b554fda366943071a44d6a1646508475"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

