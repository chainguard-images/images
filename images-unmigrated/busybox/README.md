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
| `1.35.0-r27` `latest` | `sha256:d3b682e739668e3c44f0b0c4804ea53d4402a544d4587f967cae58a2b077611d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d3b682e739668e3c44f0b0c4804ea53d4402a544d4587f967cae58a2b077611d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:349cd4abdb1dc2771b03188ee07ce1ad159ce848e77203c627fc22cddf49c91c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:349cd4abdb1dc2771b03188ee07ce1ad159ce848e77203c627fc22cddf49c91c) | `amd64` |



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
        "docker-manifest-digest": "sha256:d3b682e739668e3c44f0b0c4804ea53d4402a544d4587f967cae58a2b077611d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "c5a6a414f5c7a992f6a47d4c6d765345383713d5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIG9+aA+Yg1Z+ojK3vpmRbgPInm0SiEerDvfpw34xBMmNAiAlcwmB0eL67ECDS6BuHBT0DGTUwAMRFfW3hkbN75PTpA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZTYwNjQ2OGUxNzZmZGFlOWJhZDAwYjc3OTBjZWZhY2I4MmYwMThhODY2Y2FkMDY4OWE3ZmIyYmQ2YzNhNTgyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFdvNHRyTzVxQ0F2SmVSODl2MXg2WDZvbXdIUk5lbG5QMy8yQWhVOVVpWEFpRUE1a0NUTFY1STdzTUxmMXpqK0xZZ21veXlRTzNOTVk4SzJITTBrWXowcTBJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlV6QjRSVGd2V0RoSFdrdzRVMVo2U2xkWlRrcFBlVkpYU0ZoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXdUbnBCTWxkb1kwNU5ha2w0VFZSQk5FMVVRVEZPZWtFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2V0Vab1RXaG9PVkZYTUdST01EZElXbmhPYkhWSVdEZzVUbUpvYmtSUGJIcEZWM2NLYWpSRk1qTkZNSFZDTTNCeGEzSnlkM2RDVms4MWJVeEtTbXBHVUVsRlkxQmxRbFE0Y2tVelpEaElXbnBNZVc1WGNXRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzZEVGRENucG1PVEpYUVU1YVZsQTRVVUlyUzNGME9XdEVWVXh2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcFdhRTV0UlRCTlZGSnRUbGROTTFsVWF6Vk5iVmt5V1ZSUk0xcEVVbXBPYlZFelRtcFZlazVFVlhwUFJFMHpDazFVVG10T1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1YVdSWVRqVlpiVGswVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGT01EbE5SM0pIZUhoRmVWbDRhMlZJU214dUNrNTNTMmxUYkRZME0ycDVkQzgwWlV0amIwRjJTMlUyVDBGQlFVSm9SbUphTUZoUlFVRkJVVVJCUldkM1VtZEphRUZQZWs1M1MxVnFiVGh4T1UxTmNYb0taR1Z3WkN0Sk5IWnFkakp6VUhCcVMxTTNMMnRRZWxwYU5UUnBkRUZwUlVFNUsyY3ZUV0ZIUnpKVGNqbEhhM0JwWmpadFJYSmtaa3BhY1dOUllsTlZiUXBhZVhSRVJHUnlkVWwwWTNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCU2tNMU5GRmFSamR3TDFadWJXbDZiRXA2YlM5b1ZtNTNTR0puQ2pGMWJYWmFSMjFNU1M5V1JGY3dMME5uUjBGR2NreFplbkZtYlZVeVpta3pUa0Z1TlRaQlNYZFFUMnd5Vm5kWWJuSm1TV28yTVRJMksxQnVhRWxpTWtzS2RWbzJMMjVyTldOVmRtTk9lRmxTV0ZsVVEwaDFkRmgxTnpOMVprTk9Na2N5UkV0TWNHdFZhZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1667904462,
          "logIndex": 6720851,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "c5a6a414f5c7a992f6a47d4c6d765345383713d5",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418659785",
      "sha": "c5a6a414f5c7a992f6a47d4c6d765345383713d5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

