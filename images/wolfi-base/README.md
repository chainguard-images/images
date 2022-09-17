# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:50ac6439e3fa12aed7bf9da370ae119ad5e3bafb02571a55973e4b76d3146754`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:50ac6439e3fa12aed7bf9da370ae119ad5e3bafb02571a55973e4b76d3146754) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:50ac6439e3fa12aed7bf9da370ae119ad5e3bafb02571a55973e4b76d3146754"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ddfb2c43f10c388703d0dffcb1a1a927b4c52829",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC7Q9mvoPVkAuhWdwulXIHqDULBno9uWk1ZiPWttP5O7wIhAIKFLn7+aYNONQa03mo4IPBQeKsBv3TOb+A3POfWu77P",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NzRhYTRlNjFiYmVjMTZmOTA1Y2JiN2E3NWVjMjAxMzg0ZGJlNjQxZmY2MDM1Y2YwODA5MjVmMzk2OWJjNzdmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNZdUYrNTZsZktlanhZcmlTWUhNcHZnQk9QZklyV2FMTExoejJiNXNGUFVnSWhBTHd1S09xWTcwbGNmVmpCc0Z2MnlwdjZRQzhtUjlkam8rc2hLSjBudFhLaCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlVIQlViVEI1VDFGMU1tTmpURU5pVFZKRlRtWkdaRGRGTlZoQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFVXdUbXBSZUZkb1kwNU5ha2wzVDFSRk0wMUVSVEZPYWxGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyYkRacWNIVjVNRGxEVVNzNFUybEtXa0pwUlZkbWQxRTNNa1ZLVEhWaE56QlhiV3dLV0dKU2FIZGlTR3hzZDFNd05YSnRSelprYldoUFNHSlNWVVJsU2tWUVFVVmpMMkZwWmtSd2FFbE1RMFV3Vkdwa1p6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsWldsTUNtMHJTV1kxYVU5QldFbFRRV3RoV0RGcVNERTJVVEozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldrZFNiVmxxU21wT1JFNXRUVlJDYWsxNlp6Uk9la0Y2V2tSQ2ExcHRXbXBaYWtab1RWZEZOVTFxWkdsT1IwMHhDazFxWjNsUFZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2EyRllUakJqYlRseldsaE9la3d6WkhaaVIxcHdURmRLYUdNeVZYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZOVFFtUldRVUZCUWtGTlFWSjZRa1pCYVVGWWVFTjFPR3BGYnpkaGR6TlVkMjVQYlVWM1NWa0tRek14WVhsRlNtUlVWblJOUVZGdE9YcE5UWFJSZDBsb1FWQllka0kxWTFkNVFXdDBXbGszVTJKTU9VVjROWGhEVEdZcllUUXJPVEIyY2tWNlJEbFNPQXA2TWxRelRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRFdFUnJhalZIZUdwWkwxbDFkVE5HZVdsNFpHeFpObk55UkdKWFlrc3ZVMUp2Q2tOQlZYVkdWalpRUzJoYVpGWkVXa281V2pCUVJFdHRhRnBOWmpGemIwRkRUVkZEVW5RMFJVcEJlVXB6WW10SlRWUTFkU3RpU2tKYVNsWkhlWE4yYVZZS04yOHJjV3BNY0U1b1lUVmFiRFppVDFScGNWRXdORzVPVm5sd05WWlFVblZFVUVrOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663379205,
          "logIndex": 3523609,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071711229",
      "sha": "ddfb2c43f10c388703d0dffcb1a1a927b4c52829"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

