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
| `1.35.0-r29` `latest` | `sha256:3d1bc0df9746f2c533be515408a5d97eb377f4745cf48d2b53c2ae3d7aeee8d8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d1bc0df9746f2c533be515408a5d97eb377f4745cf48d2b53c2ae3d7aeee8d8) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `migration` `migration-1` `migration-1.35` `migration-1.35.0` `migration-1.35.0-r3` `migration-20221129` | `sha256:55884ccdfde7c1523e6b3b39bcbbf20e734961d112b7ec3e9ec2f0ee92ff2495`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:55884ccdfde7c1523e6b3b39bcbbf20e734961d112b7ec3e9ec2f0ee92ff2495) | `amd64` |
| `migration-20221120` | `sha256:2a7d898f40e8b2f55463e5f2bdcb709e33bbe1ce430095c8a617514357dd33c4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2a7d898f40e8b2f55463e5f2bdcb709e33bbe1ce430095c8a617514357dd33c4) | `amd64` |
| `migration-20221122` | `sha256:4202e8da4c9436aa6e8f2dc96e75b8444a70f37e02e118500fd7bbfecc921a12`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4202e8da4c9436aa6e8f2dc96e75b8444a70f37e02e118500fd7bbfecc921a12) | `amd64` |
| `migration-20221125` | `sha256:5e334746db42bad226481d2f1b101edffdd4ce6f784186ece7bead388e07ec1f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e334746db42bad226481d2f1b101edffdd4ce6f784186ece7bead388e07ec1f) | `amd64` |
| `migration-20221126` | `sha256:8f018d7f032f68d3276cc1ba1ff3d59f1eb0ecd411a102d31a3e95d59bed11cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8f018d7f032f68d3276cc1ba1ff3d59f1eb0ecd411a102d31a3e95d59bed11cd) | `amd64` |
| `migration-20221127` | `sha256:e902d2b57e6be4dfc2e7fbd35b8f261a3e6e5a0a2f043825aac0d6fe64dbf46a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e902d2b57e6be4dfc2e7fbd35b8f261a3e6e5a0a2f043825aac0d6fe64dbf46a) | `amd64` |
| `1.35.0-r27` | `sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6e15c273db2649e47463d6672da8075fb458d403d5f0bfb17c2bcfc6f6306676) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r28` | `sha256:a76db118b1ea701cc995e8403dff6fcfc93a1970c909f75114b6ddd2593f04df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76db118b1ea701cc995e8403dff6fcfc93a1970c909f75114b6ddd2593f04df) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221121` | `sha256:9003567c9b7089cfc6e88f2e563a8e84292110ffac4de90ef13f3a07798fc454`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9003567c9b7089cfc6e88f2e563a8e84292110ffac4de90ef13f3a07798fc454) | `amd64` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r3-glibc` | `sha256:76ee255b7e796bb98998c20c7cc5c60e05e3a48820133d26800bc2a7c4441c19`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:76ee255b7e796bb98998c20c7cc5c60e05e3a48820133d26800bc2a7c4441c19) | `amd64` |
| `migration-20221123` | `sha256:ff03e7209d01ae5826b8f82a0ae9446ad7f537c1abe55f9b66acd8c5d4a41483`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff03e7209d01ae5826b8f82a0ae9446ad7f537c1abe55f9b66acd8c5d4a41483) | `amd64` |
| `migration-20221128` | `sha256:12f1c1d51f13497af2c88a12ede27e31e08d7e652e2c9595b317709d542ffaa4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:12f1c1d51f13497af2c88a12ede27e31e08d7e652e2c9595b317709d542ffaa4) | `amd64` |
| `migration-20221118` | `sha256:39dea1a94868c1a11fc74dc5a2a1328af01395d366d31bda37e61a733471ba52`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39dea1a94868c1a11fc74dc5a2a1328af01395d366d31bda37e61a733471ba52) | `amd64` |
| `migration-20221119` | `sha256:07a495a46b6704450af118a41cbc36a4320422fd7535b0cc99348bb6c2abfeb7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07a495a46b6704450af118a41cbc36a4320422fd7535b0cc99348bb6c2abfeb7) | `amd64` |
| `migration-20221124` | `sha256:17ff072fdbda83bc6fb25e0216e5e60d3804e6473e2e031293fef451efea7a5e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:17ff072fdbda83bc6fb25e0216e5e60d3804e6473e2e031293fef451efea7a5e) | `amd64` |



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
        "docker-manifest-digest": "sha256:3d1bc0df9746f2c533be515408a5d97eb377f4745cf48d2b53c2ae3d7aeee8d8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cf7e59b5acbeb74cade44d9137c0e0fd695c53f6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAbKTNRaGSFAJinWome9UfDUjk55oLr8WjaPBbyISosYAiBZ4WR+iuHHyTQM0OX03/TvghuTI+9qOmogJMHQRBupCg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MTM4NmEyOTllYTViMzhjMTEwY2M1MWRlNzk0MmZlNzE5MTY0N2M4NjBiNjVlNWZiZGE4ZWVjN2FjYWYwNDU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURoRnZjdkg3ZzcrbGVna2RjR1RaWjZIVlIvNUFqY2dMMnN1dTlGUU45MmZnSWdZeDlLRi9wRFRDM1dabjRPQW1HL3NncWRPWSt0Uk54aXpvalRKQ29nbjU0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVllXUjVRblF2ZERsMEsxWlJOMDExYTJnNVRtMXlhV3R6VFVGM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVVFhkTlJFRjNUV3BWTlZkb1kwNU5ha2w0VFZSTmQwMUVRWGhOYWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyV0U0eFRucFJUWEJVY25GNGExUXlSMEpUZFdaVWFGcERVSGRWVDNSTGJFWlhTemtLU0RBNE9FZDFabFJaV1VaRmVFZElTVlphU0hWUFZtMXZiVVo1U0M4eVFYcHNiMVIzWlhSQlpqQnNiVloyVm5aRFpHRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzU0dVNUNuQlRLMUo1VW1KRlpqWlhSVkZoZVZkNWJqWm5XVXBGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVG0xT01sVXhUMWRKTVZsWFRtbGFWMGt6VGtkT2FGcEhWVEJPUjFFMVRWUk5NMWw2UW14TlIxcHJDazVxYXpGWmVsVjZXbXBaZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWlpibFo2WlZkS2RtVkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVVJrVUZSQ2NYaHpZMUpOYlUxYUNraG9lVnBhZW1ORGIydHdaWFZPTkRoeVppdElhVzVMUVV4NWJuVnFaMEZCUVZsVVJqSkJVV3BCUVVGRlFYZENSMDFGVVVOSlFtSm9jRTlPSzB3eWJXMEtSM0pPVUd4dWFYTmlSbFJhVFVkSFZtSnNPR0ZzYkZsc2NHUmlXamR3V25WQmFVSXdjblpwVjJ4M2FuWm5UMnd5TjB4bFZWbEpkbTVxTWtaMlJHUjFMd28yV2xnNFVUSTVWakoyWXk5aVZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKV05uZGhaMDVXWTIxbFREa3JOSGRuVVdwa05teDVPVTgzQ2tjNEx6RlpZekEwYkV4S2FtaFhhbVJTYTAxU1drNTZOa05ZV1c0elpITmxXbFZoZEVGVE1FTk5SbU5MVmpFM1ZrMXBWRXgyYXpadk5WbFdiR3hKUVU4S2RGQkhNblZSU1dVNWNEZ3pkVFJxTWpnMWRGbEdRWFJ4VkROR09XZ3lkVzlWUjFocFdFMWlNRE5uUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1669766600,
          "logIndex": 8121340,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "cf7e59b5acbeb74cade44d9137c0e0fd695c53f6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3579045243",
      "sha": "cf7e59b5acbeb74cade44d9137c0e0fd695c53f6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

