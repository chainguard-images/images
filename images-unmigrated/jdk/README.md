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
| `latest` | `sha256:326ba5fdb8290fd26ff86597b7467fc1cb302bf0a0e44e7414ee17b8f9147518`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:326ba5fdb8290fd26ff86597b7467fc1cb302bf0a0e44e7414ee17b8f9147518) |  |



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
        "docker-manifest-digest": "sha256:326ba5fdb8290fd26ff86597b7467fc1cb302bf0a0e44e7414ee17b8f9147518"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "19220d5823355b3aeeae2cea813111027d0f90c5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAltvDoRpF6LVzl3quX1qh9m4vw83mrpXLfb4kHrw3z2AiEAp/T7RcKoxjnG/L/DBC0efuieOAHNzFMTWDxFU9vTFxs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMzhhOWU3M2QxZjIxOWZmNTU2OTk2MjUxOGU3MjQwYTBlM2YyZDVkMzU5MGNmYTlhZjczNTk1ZTI4ZDQyNDU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURDZTVBUS9OcjZOVlRsTmgzdUZnN3FXaVN1S2VJTXl6VXpES1gzT2RENW9BSWdid202YU5Zd293QmF3eHhEZGd1WnBaN0w1aSt5R2JoT2VnMW14ODVwUnVZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlRrZzRlREZMVmlzM1VGSmxNVE5XWlcxbFRsWmhlVmRxTUZCSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFbDNUbnBKZDFkb1kwNU5ha2w0VFVSSmVVMUVTWGhPZWtsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSWjNCcGJFNXZiR3N4VFhBNWNqWjBXV2hMY0hOWU4xSlhjRGRFYTFFd1lubHRTekVLWlVSbmRXazVWazVDUVZvclN6VnpRbGswTTFCUVlsWjJjRW9yVVhSMGFHVkJjMDFNYm5VdlUwTjVaMGhrUjBaSFEyRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2TkdrNUNtRlNielEwVEhjM05uWjJjRGxxYW5keFpucEZaa3hWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRWUnJlVTFxUW10T1ZHZDVUWHBOTVU1WFNYcFpWMVpzV1ZkVmVWa3lWbWhQUkVWNlRWUkZlRTFFU1ROYVJFSnRDazlVUW1wT1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkM5WVNGcHZaMEZCUWtGTlFWSjZRa1pCYVVWQmFVaGlhRGxJTlRKMmJuZEZhRUpuZDJVNUwwSUtUbTVPTjFObWVYWnpNREpNYVU4NGVIWlpjV1JEVWpoRFNVTjNURzUyWkVsNk5HbDBaSEEyVW5rM2NFaDVibkoxT1dWNFdFbDNVMUpvU0dod1ExZEVSd3BOZEdOa1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVSV09GRjROVEZLZFdOdlpYcG5VRmRTVjNOU09HOWxXbXg1UjNwbFkxQktSV0l6Q2xWSldYa3hUVlpLV1RReWNtcG9hVU5oY0hZeFNEQllTbkJIVFhvM2QwbDRRVTgzY2tSMlVUaFZkek5VVTBGTVQwcG9VamRrTVVwRmN6RkNWM2hhZUdzS05XTlZjV1ZYVDFkd1ZpczBZVnB3UjB0aGRYVnZXR1pxWjFCRlEwdGhSVVoxVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666404441,
          "logIndex": 5611620,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "19220d5823355b3aeeae2cea813111027d0f90c5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301554206",
      "sha": "19220d5823355b3aeeae2cea813111027d0f90c5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

