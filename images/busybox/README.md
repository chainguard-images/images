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
| `1.35.0-r27` `latest` | `sha256:b5429a8e2bfb584e1dfb25427510491fc3112eccaf99c201faf68c3b7b5b9834`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b5429a8e2bfb584e1dfb25427510491fc3112eccaf99c201faf68c3b7b5b9834) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:89de8a236a4f9d6ff5553da6e709c53167262d5beb9f795c69a4f5bba7f2d32d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89de8a236a4f9d6ff5553da6e709c53167262d5beb9f795c69a4f5bba7f2d32d) | `amd64` |



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
        "docker-manifest-digest": "sha256:b5429a8e2bfb584e1dfb25427510491fc3112eccaf99c201faf68c3b7b5b9834"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5dad913804227a97f84fd91be5cd5e8b6cd361b2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFbhjDlENFVWy4y/fgnRrubX7sunIpZWSuPxNpjqIeDAAiEAjgZ6mSvptWEvmwwIeUWgn9BmYpiAdc0w71929KWBYJU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMGYyZGY0M2ViYTQ3ODU2MmVlYmE0ZjhhMWY3OGU0MDUzMTc0OTVkYTQ2YTg4ZjE5NjFiYjM0NmM0YTc3YjE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNCVm9nN3VQemRZejhORHhFYlptRW95WWhoYWFIL1o1clRtVERaUEZ5S09BSWdCcGt0MTdyMlNTRlkzNTJWTkp5S3hXLzR5dnI4QUdOQWxBVVE2UmxtUHhBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVllsWm5SMjFSWmk4MGFHaGtaVzFsTVRoWWFubFVhbHBUWTBkQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFRXhUa1JCZVZkb1kwNU5ha2w0VFVSSmVVMUVSWGRPUkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzZVVka1YzTlFOMGs0UmtkMWExTlBkMmRETTFwUFlsRnpOMUpqV1V4VVVHaENhemtLYVVwa05sSk1RelI2Y1dsUmJXMXlaMDFNYzBjeWFVeDRjVmsyYWpFMmRHdDZlV3BES3pWalowdDRhRzFqY25GeU1qWlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNVjNSMUNsVktZamRhY0hCWVUxbEViVFl5UkhCMGIyeHJiMlZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVm10WlYxRTFUVlJOTkUxRVVYbE5hbVJvVDFSa2JVOUVVbTFhUkd0NFdXMVZNVmt5VVRGYVZHaHBDazV0VG10TmVsbDRXV3BKZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUU9VeHlLM3BCUVVGRlFYZENTRTFGVlVOSlJGY3ZVelpzVFdVckwwVUtXRVkyU0ZrNFdtZFdWMWxwY0hwa2RIaFJObXh6ZFZOV2JWUlNaelphY0dsQmFVVkJhazE2ZGxad2NTdFJNR041T1VwU1lXWlFibWx5VTFwdGRqSmpTUXB5SzI1SVduUmhRemN6YlVsbGNVMTNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVcE1MMEZoVFhBdlpuZFlTRXBNVkRoeU1rWlpPRVJaQ21JdmFTdHFhbVoyU0VwRWVYUTBSa3haYkZZek0zaE9NMGwwVUhOVkwwSnRheTlZY1RGM05YaGFaMGw0UVVveVRrZzVWa2t6V0dKak5YaFdhVEZ0VDA4S2NXaG1NM0IwYVhGbmIyTmFUbUprVW5GaVNGWTNaMlpwWjNwc1YxazNRazFQUlZWR1luQm5OWGcwYUZkaVp6MDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1666400075,
          "logIndex": 5607979,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "5dad913804227a97f84fd91be5cd5e8b6cd361b2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301344675",
      "sha": "5dad913804227a97f84fd91be5cd5e8b6cd361b2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

