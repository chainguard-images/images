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
| `1.35.0-r25` | `sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62eae6a74ce7304c3ef45bdbce9f17f40929f9bdd0ec6da80c84ab4af2bb6057) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.35.0-r2-glibc` | `sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a76760a49c6966fa0516404736d7949299433d959ab9910d841e2e3a0f301d48) | `amd64` |
| `1.35.0-r3-glibc` | `sha256:e4af26ff72ba964e03aa077225329b88368f33f1e97ac9be45ac8c890dad7db0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e4af26ff72ba964e03aa077225329b88368f33f1e97ac9be45ac8c890dad7db0) | `amd64` |
| `1.35.0-r27` `latest` | `sha256:186312fcf3f381b5fc1dd80b1afc0d316f3ed39fb4add8ff900d1f0c7c49a92c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:186312fcf3f381b5fc1dd80b1afc0d316f3ed39fb4add8ff900d1f0c7c49a92c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:186312fcf3f381b5fc1dd80b1afc0d316f3ed39fb4add8ff900d1f0c7c49a92c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "83ddb1cfa40fdd6662255dc81c889e350e4bacb4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCgviKJ8LSX0e+aHKdU6hF5JuumT2muinsO+qrIsguT7wIgSvH5CmuPf++qMpbI0ETn21AFvdL2XnoRo4F2ydexAL8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1YWU2NjQ4ZTg5NjJhZjY2N2IyYWIxZmNiOWJlZGY2NjRjMTI5ZGJjOGUzZjI3YTZhOWU3MTYzNWNkMWQzN2RiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN0QWRJRWR3K0hDZGJHVGx3UE14YkIySi9lU0ZwSXpzamdoTzlVcllnY29RSWhBTG1QQ3o4cG9rZHVWL3hyNFdlMFRCZUJMbWltT0hBYjlQbWExNVJHK0tGUCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlpXbFZXR1IyUVhCTlJteFRTSGxPZGtreU1TOTZWRXRqUlhKUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlZHZDZUbXBOZDFkb1kwNU5ha2w0VFZSQmVFMVVaekJPYWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0V2psd2VrSlllRkpqTTJWbWVuQnBibVoxZUdJek1YWkpLMDVtV21WSVQyZ3dVbkVLZW5OUlQwMWpWSFpKUzI1UGEzWkpZMU5UVEhVMksyRnNaRWxXZHpsc1VrTnhkRlYxT0VWVFpWRnNlV2RSYkZGeWJrdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5ZEd4MUNrWXdUbU5sTTJ0WGFGUXhXbE5yYVVWSVdWYzJXbnBuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5U2pGak0yeHBZak5uZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWpoSFEybHpSMEZSVVVKbk56aDNRVkZKUlVWWVpIWmpiWFJ0WWtjNU13cFlNbEp3WXpOQ2FHUkhUbTlOUkZsSFEybHpSMEZSVVVKbk56aDNRVkZOUlV0RVozcGFSMUpwVFZkT2JWbFVVWGRhYlZKclRtcFpNazFxU1RGT1YxSnFDazlFUm1wUFJHYzFXbFJOTVUxSFZUQlpiVVpxV1dwUmQwaEJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1FWRlBVVE5LYkZsWVVteEpSa3BzWWtkV2FHTXlWWGNLU25kWlMwdDNXVUpDUVVkRWRucEJRa0pSVVZwWk1taG9ZVmMxYm1SWFJubGFRekZ3WWxkR2JscFlUWFpaYmxaNlpWZEtkbVZFUVdSQ1oyOXlRbWRGUlFwQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYjBkRGFYTkhRVkZSUWpGdWEwTkNRVWxGWmtGU05rRklaMEZrWjBSa0NsQlVRbkY0YzJOU1RXMU5Xa2hvZVZwYWVtTkRiMnR3WlhWT05EaHlaaXRJYVc1TFFVeDViblZxWjBGQlFWbFJNR1YzTjBwQlFVRkZRWGRDU0UxRlZVTUtTVkZFVmpVMlVFUjZLMnR3SzBkdlZYcElXakpWUmpWTWRqQnZlbTQzYm5GRVZEUmlRV28xUVdaUk5YaHJRVWxuUVRrMWFXUkJWbTlpZDB4bmNHTk9jd3BhYmpCQ2FrSlZNSGxWVUdwMmVIZ3Zia2RDYkRSRlRFUkxSMUYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVTFGV1ZaVFZVUjZaSGx5Q2xaV1RscGFabEJRY1U0MlVYTXZja1V4Tkd3eWJ6azBXRWwwVVRVdk0zWkthVnBvTVdKMWJHWlBXbXBsWmtKTmFVd3ZOVmhNWjBsM1ZWVjBXa056YVhFS09IUjNaamgxWTNneFQzZ3dhbUl3VFV0dE1rVlFkbE5MVmt4c1JHWlFkRXd5UnpkMVdrSmtRMnBYVDA1dmEwOURURXcxVXl0aE0yNEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667327812,
          "logIndex": 6306153,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/busybox/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/busybox",
      "githubWorkflowSha": "83ddb1cfa40fdd6662255dc81c889e350e4bacb4",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3371920428",
      "sha": "83ddb1cfa40fdd6662255dc81c889e350e4bacb4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

