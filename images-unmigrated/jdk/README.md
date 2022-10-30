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
| `latest` | `sha256:15b7f55d07d4e11a2afc795a963648b3043a9c04eedfb5fa140f08612f4b9fa7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:15b7f55d07d4e11a2afc795a963648b3043a9c04eedfb5fa140f08612f4b9fa7) |  |



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
        "docker-manifest-digest": "sha256:15b7f55d07d4e11a2afc795a963648b3043a9c04eedfb5fa140f08612f4b9fa7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "60a29504c50025424b554b3f489401636564b0b7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDUo+Sy3dGdxDxt9m5tLaA6sfzBO3dIrXHOYCioK25YFAIgQodJdd4rZ9/98e8I48s0AkBGrCCLMj9eSgoUC1LbBQs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwODY3YjNiOGFiZmU1ODYzNmNjMWY0YThhMjEwNWI3YTVjOWVkNzI1MDM2MjBmYzljYjZmYTU5YWY2YTEwMDM4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRmlQY1c5M3ZyNkdIdjV4ZXZjTTByRmx4Z1RnbXFyRE5NMmlMdVdEdEdOR0FpRUFzZjNVeDBiUzlUWkpNYmsrdzBnWVlCaURrNEtkMXNYbVhid1VNbG1QR2tZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlN5OUNTazlST1RWTmNESjRlSE5WUjNaMWRHVldlV3dyTW5jMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFbDRUV3BOTUZkb1kwNU5ha2w0VFVSTmQwMUVTWGxOYWswd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqYUV0amMzZFplWGsxY2xCV2RISTJSMVZOYm1FMlZWUlpVMGRpVjBzMWJtUmtkRkFLYkc1NlZEbHBiakppVUhsRlFYRkhjSEV3VFRkcVNuaHlNVVZYTjJoUFZHUlpZbFJXZWxkNU9EaHhaMWhvT1hBMk9YRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuYVhOd0NrRk1WMDlNYmpSaFVuZHRVVkpFZUZKT2NXVjZVMGgzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRtcENhRTFxYXpGTlJGSnFUbFJCZDAxcVZUQk5hbEpwVGxSVk1GbHFUbTFPUkdjMVRrUkJlRTVxVFRKT1ZGa3dDbGxxUW1sT2VrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlVweGJVWTRRVUZCUWtGTlFWSjZRa1pCYVVWQmNuQlVTemhyVEdGeFZrSldObmhsTm1kSUwxRUtSalZHU1RsME5rUjFMMUIxUzNKRmRHcDJZVEJ3U0RSRFNVWlZlbWt4UWpWSmVWcExhMU41Um1GNWFITkxOSFIwVUU4MlVYVkdaMjA1VXpNelUwaHhVZ3BzTVVGaVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVSYVZHcDZXRFo1YUV0aVNWRldNM3BYTUc5RlowUlZSV1ZGT1VnMFNFZ3pVWGRzQ25sVk4yMXRjRzV6ZWpaVFRXcEVVV0pHVjJsMWNGQjBSVGhMUjJzNFowbDRRVTlTYVZCc1ltSnVOVXN4WkcxUWVVTklaV2xSVUhvcmJYSlRhVWRGZG1jS2Frc3JZMDlQU3psVlFtODFUV1V2SzFaMVVGSnJZek5DVXpndlNHUTJjR1ptZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667095957,
          "logIndex": 6135171,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "60a29504c50025424b554b3f489401636564b0b7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353746587",
      "sha": "60a29504c50025424b554b3f489401636564b0b7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

