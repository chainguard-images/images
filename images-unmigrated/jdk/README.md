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
| `latest` | `sha256:53efb12579afac6e86152fd2ec173c4843232b7cfb735670f84d8badc05cc83a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:53efb12579afac6e86152fd2ec173c4843232b7cfb735670f84d8badc05cc83a) |  |



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
        "docker-manifest-digest": "sha256:53efb12579afac6e86152fd2ec173c4843232b7cfb735670f84d8badc05cc83a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d76e72f56340f7553306e6d917e93e7ec2590010",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDHycKEnydV7Nrwxzo0sLE+/OEXJMYK/mGPCezb//wEVAIhAMEv3J4mPhJ/BtUgyYJnlzD/cXXSgZe1ZwqaXQjsvS39",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmNTI3NjJiMzUyMjkyNzMxNTQ1N2JhOWQ5NzU2ZjEzNjE1Yzk4Y2ExYmNkNTkyYzU0NzhjZTBmZmIyMTk3ZTI4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNWK3RjdllkVWRBR1NMNjVVZG1PZVdURzlFc09QVVp2RHVWRHgxM2wzbDlBSWdjWjdabk9Jb1VVTm5RTWp3K1Z2YVE3aXNrQS95K3VJbFlaY1VrTUtVRTJnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsdFowRjNTVUpCWjBsVVNtTmpOREEyYm5OUmNqUTRWbEpRYWtNeFQycDVWa1pZU25wQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZkMDFFYTNkTmFrVjVUV3BvWVVaM01IbE5ha1YzVFVScmQwMXFTWGxOYW1oaFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVMmd3T1daallVUk5WbmRtVkVab01VaEtPRFpsT1RoWU0yRkxTMGRtY1dGc01qSlBWelVLSzBJNVRrUkJkbWxHY0hKNmFqVkVUak4yTDNkUVdGVldTa1YzUWtNMlIxTnZjbk5IYTA5WlZraHVMMFJ4TUN0SGJ6UkpRMU5VUTBOQmExVjNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNVVVExYlZSb0Nsa3hhRzUxTURRelpuRjVlV3h6YlRaVVpuZHJVVlJCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDYkVKblRsWklVa1ZDUVdZNFJWZDZRbHBvYkdSdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbUZ0VW5KTWVUVnVZVmhTYjJSWFNYWmtNamw1WVRKYWMySXpaSHBNTTBwc1lrZFdhR015VlhWbFYwWjBZa1ZDZVZwWFducE1NbWhzQ2xsWFVucE1NakZvWVZjMGQwOVJXVXRMZDFsQ1FrRkhSSFo2UVVKQlVWRnlZVWhTTUdOSVRUWk1lVGt3WWpKMGJHSnBOV2haTTFKd1lqSTFla3h0WkhBS1pFZG9NVmx1Vm5wYVdFcHFZakkxTUZwWE5UQk1iVTUyWWxSQlYwSm5iM0pDWjBWRlFWbFBMMDFCUlVOQ1FXaDZXVEpvYkZwSVZuTmFWRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJoclRucGFiRTU2U20xT1ZGbDZUa1JDYlU1NlZURk5lazEzVG0xVk1scEVhM2hPTWxVMVRUSlZNMXBYVFhsT1ZHdDNDazFFUlhkTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5OUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUmxkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZUREp3YTJGNlFXUkNaMjl5UW1kRlJVRlpUeTlOUVVWSFFrRTVlVnBYV25wTU1taHNXVmRTZWdwTU1qRm9ZVmMwZDJkWmEwZERhWE5IUVZGUlFqRnVhME5DUVVsRlpYZFNOVUZJWTBGa1VVRkpXVXBNZDB0R1RDOWhSVmhTTUZkemJtaEtlRVphZUdsekNrWnFNMFJQVGtwME5YSjNhVUpxV25aalowRkJRVmxQTm1jclJIbEJRVUZGUVhkQ1IwMUZVVU5KUkdkR2FtSkZlalZWTUhKUE9XbG9VR0ZvV25GS00wNEtjVmxFWkhCa05rVjVXblJzTW1Nd0wxTk1NMHRCYVVGcVdFMVpaMnAwTWxWeVRrbENNVzFXZVhkNGRIRnRLMFJ5UkV0VE5ETkViMWxsT1dkMVRsTjNWUW8yUkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYmtGRVFtdEJha0pHZUZKMVF6Rk9WVWhtVUdORE9XdHpNVzFXU1VoVU56bE5SVUZWTVVnd2RtNU1XVzlJQ25GbFNteEVVSEV5TUVaa1lTdERPV3BxTlVGTlpqTktVemwyVlVOTlJHRnNielJOWkRkcGRqa3lkMUZwVDNkVlEzZEpSMEpuVEZNMFFuZFpXbFZLTmpNS1RXNUpORWRGWmxScmNEWmxOWEJJUWtFNU1uQmlXRVZ6Tm00d1FXZDNQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665281549,
          "logIndex": 4727533,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "d76e72f56340f7553306e6d917e93e7ec2590010",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212551221",
      "sha": "d76e72f56340f7553306e6d917e93e7ec2590010"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

