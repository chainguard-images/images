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
| `1.35.0-r27` `latest` | `sha256:c9ef8108f6aa16edaa46601422f90a111580c4f4d3f053fbc4f7e1144c7f1a33`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c9ef8108f6aa16edaa46601422f90a111580c4f4d3f053fbc4f7e1144c7f1a33) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:d0e77db8dc1ebc7bb19af38065bc3b5239b9a921d55a4098b091cdc45d2b5b1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d0e77db8dc1ebc7bb19af38065bc3b5239b9a921d55a4098b091cdc45d2b5b1c) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5b9d10dbd14feb9c3af67d9ec21cc6e83595a66b4758bc325203520bcf71945a) | `amd64` |



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
        "docker-manifest-digest": "sha256:c9ef8108f6aa16edaa46601422f90a111580c4f4d3f053fbc4f7e1144c7f1a33"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e9ff929f6eba63f7a9861cc8686d2649f25b68de",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB/gm+zzfUiBQqXGJaftnlajByhMSlDKqVJVyf2b34IcAiEA/eJh4giIfLQCLAMZ0haF40p9EE4mooZLwUS0C6d+7Ao=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NmM3Y2NiMjA0NzVlODUxY2I3NzE0ZDQwZjMyNmEwODNmZDQzMGZmZTc4NDI3MzlhZjhiN2VjNTk4Y2NjMjg1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRDhzUzhnMjJxakF5WGp1TEthNVQ3UFpUL3BKelByaFBiYzB3cTVzc1FYN0FpRUErNmJ0OGxFZ1NTK1Qxbis1d0xFbENPSmpTbjFYS0I4cWVlL3Ird2Z3N3BZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlkweFdjbFZSTUhFcldUaFZlbmxMVFV0dE1FTnNVMEZxY1dRNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFRXhUbnBWZUZkb1kwNU5ha2w0VFVSRk1FMUVSWGRPZWxWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtZVhsSloweGFSak01ZVZKcVNEaFJPWG8wUnl0RlFUY3djbGN3VW1FeVpXbzBZekFLU0hCS2RVeEthV3BpT1c1UVdpODBNVVJFV1VwRVRYUjVVRmg0TjJoYU16aEdiMmd5VHk5NlJXZHhTamMwWkVwdVQwdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqWm1VNUNrTm5Va3BYTm5GRGQweG5PRkl5TjJwUk5qYzFOelp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVlRWYWJWazFUV3BzYlU1dFZtbFpWRmw2V21wa2FFOVVaekpOVjA1cVQwUlpORTV0VVhsT2FsRTFDbHBxU1RGWmFsazBXa2RWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUVZDOHhjbVJCUVVGRlFYZENTRTFGVlVOSlVVUm1SMlo1UVdoeWJrY0tUek55VmtWRWVVVlROVGhXVVhCNVUzUjJkRzVRUVRaUE4wczViVk55VDFadFowbG5TVFkxVEdvd01sZFdXRnB1ZDFCQ01HcE1OVmhVUXl0S1FXaEZjd3BVU0dsSGRWSmFZbEpuTUdOcWNFMTNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsNFFVdEdSMkZZV0hSdVVYSTBiVkJPTHpSS2EyUm5kbFo1Q25aNlMwSlhSVTVMZHpGSmVTOXZWa3RzZEhWU2JFb3JWaTh4U1ZseVdtbE5RMVprYmpWaVdVaFZkMGwzVEdSSVoyTkNNbkowV2xOQlZURnNRMDExYjBNS05GWkNVM0YxWTFaSmRVMTNVV3R4T1V0c09WZHdaVlJoY2l0S05GaFBlbFJGWkVveWFYaHVlVXAxY0dJS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665709091,
          "logIndex": 5061774,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "e9ff929f6eba63f7a9861cc8686d2649f25b68de",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246705607",
      "sha": "e9ff929f6eba63f7a9861cc8686d2649f25b68de"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

