# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:d64849d526b7e1d2f874763768b191d89e9eba707ffda48d1ae0c0f916ee488e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d64849d526b7e1d2f874763768b191d89e9eba707ffda48d1ae0c0f916ee488e) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:d64849d526b7e1d2f874763768b191d89e9eba707ffda48d1ae0c0f916ee488e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0e838b4a4bd5649fa367e2e48a890ed1f74f6287",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCj12MX9YMzD2IvscDhRuk1Bn+yzVLvkoqzR1hGsuVY6gIgNqkU9VuBi2Wi69ygVc6KYr+AP0CnxheQC4hIP0/0hhY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2Y2M1MjgyNmMzNTcxNDVjNjhmNzY4M2UxZTdlYTc5ZDEyY2RjYTIwNTFlODU0MjJkNmVjOWZhNTFkOTMwZmEwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR2ZhVUcwMmdhVEUrS1A5dTdKZGlPTFUvdnlVODJZWlVoazJEdXE4c0FsdkFpRUEvbGNoZWJBTm13bFRPaU1rM0F4Tm1MS1dFT1RBVGNCZWFiSmY2RE9iYTVRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZYVXhVM1YyTHpoTVZGbDVVVlpXZVhodVdGVTFNVmRDWVd0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFbDRUV3BSTUZkb1kwNU5ha2w0VFVSTmVFMUVTWGxOYWxFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUT0d0bFdqTTRXbkl5YTFOSU5YUlhNa05SVEZKa2VWZG9PVU54VjNGNFZHdDVMM29LV20xemJERlViMnBvVWpGaWFuTlpRVkJJYlRKeldVZFZibVV4VmtsRVlrRkdhME5XY25aSVdrOUNjR0paV2psaWJrdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyZUdWa0NqTkZaalJyT0dKUmMxcDNWVVJtYms5TlNGZHBUVzFyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRVZFZORTE2YUdsT1IwVXdXVzFSTVU1cVVUVmFiVVY2VG1wa2JFMXRWVEJQUjBVMFQxUkNiRnBFUm0xT2VsSnRDazVxU1RST2VrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVzNVFVWnpRVUZCUWtGTlFWSnFRa1ZCYVVGRU5TdHJOaTlZUnpGSVZuUlhVR2hEVVVJdlNGY0tPRWxuVVhkelpXZFNWR3hxVkVGTGFYZGtUbGhNVVVsbldVRnVkbW96ZUZOQ1IyRkhaM0YwYTFOMVlrUlFhekJGVWpKaU4wWm1LemhzVVcxcWQzZG9Ud28yTlRSM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzVFRjMk5EaGtkRzkxV0dweGNDdHFlVFpTTWswNU1VeEVXbEoxUm1kdU5XaElTalJwQ2s4eE9FVXZOa0V3WkhaSFNFZ3dkVEpUZDJWQ1ZrUjVNbUZ3TkRoQmFrVkJNbEUyV25oWVdHdG9XREJUUkhJclVtVjNhMFZEVHpoWU5GZG5LME5hUTNjS2FtTndhREpKVjBsdlRYUnBlamhPYlM5WE5TdFZkV2RpYVRSTWRFeFBUSFVLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667182365,
          "logIndex": 6193307,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "0e838b4a4bd5649fa367e2e48a890ed1f74f6287",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358047567",
      "sha": "0e838b4a4bd5649fa367e2e48a890ed1f74f6287"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

