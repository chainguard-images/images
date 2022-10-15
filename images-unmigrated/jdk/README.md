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
| `latest` | `sha256:5335e04b6c8e2d5978aaf90a81271cf0a39ea649acb7d7e5f7e75cd66df09ba1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5335e04b6c8e2d5978aaf90a81271cf0a39ea649acb7d7e5f7e75cd66df09ba1) |  |



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
        "docker-manifest-digest": "sha256:5335e04b6c8e2d5978aaf90a81271cf0a39ea649acb7d7e5f7e75cd66df09ba1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "37a7304db8935dc1e518584af71cb473e3a44090",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDjEXwi/PxT1esXXA4MZkg6ULdSVj0WmZ39H6B/eG6sDAIhALV+/CuJioAskr6lPN8k5M5KmTe7q9uVtRod9fu2u3Nk",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OGIzOTljOTM4NWU1NzExYTg1OGZhN2E4MmEwZjYwODgzM2I3M2MyODE5ZTk2ODVjYTJlYzBjYTAwYjU2ZjkyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2wzODEvVEdQYnJBaWlKU0pZaHN5NEk3OGNQZXd4VURlTTVHdEc0MUVqWkFpQkp6K1ZEL0Z5N3E4NzYybHNQb1JQNElxb2diWStYL3ZrVTRIZzVJNURoUkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVldYcHZTMVEzWm1aSGRGTTViMVF5YzBsVVFVVmliR1kzUVdwSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFbDVUbFJSZUZkb1kwNU5ha2w0VFVSRk1VMUVTWHBPVkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQTDNoUVJGZHlXVVY2WVVkSmFWSlZTMGhFVFZsclVtRnJWM2hUVFZOV01uQlRaeXNLU1hjeGVVdHFTbTQwTVdwcVYwVm5VMlZpVlhsalZERm9OVUZrZFVSWU9URXJibGhNYmpGMlJuUjBhbTl5ZGxZMmEwdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDWTFCSUNqTXJWa0ZXZGs1SFRHeHRSVWQ0V0U1U01HUnZVRVF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRYcGthRTU2VFhkT1IxSnBUMFJyZWs1WFVtcE5WMVV4VFZSbk1VOUVVbWhhYW1ONFdUSkpNRTU2VG14Tk1rVXdDazVFUVRWTlJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRKWVdXcFRaMEZCUWtGTlFWTkVRa2RCYVVWQmJrWm9hWE5KVjFCSmFHMXpNMUZuYUd0eU0xSUtjbU16UmxWTk1XMVRjREp6WVdkUFprdHVRVk5wWW1kRFNWRkRSUzl4SzFONk5qVmlRbTQzVWxCbFIySmtSMVZ1VW1GU0sycFBjMjgxZFcxTGNtbEJhUXBKYVdWbVNVUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFUZzJjRFpQYkd4WmRYbzVaR05aVDBGNU5XdHljVzFLWTJONmFGWlpVVlJYQ2pscldXMU1kbkJJTDBGNk5sUlliR3AzVnpkSFZVZGhLMkZDZVdSVk5rUmxRV3BGUVM5UFRIY3JhVGQyWWk5eFZreEZNVE54Y2pOS1IyZHBVR2ROYUUwS09IaENjRU0yWm5OU2FqRXpRMXBLWVhKWVVXdFFZa1paYkdRME9HMVdTakJVVm1sd0NpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665800743,
          "logIndex": 5130559,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "37a7304db8935dc1e518584af71cb473e3a44090",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3254085260",
      "sha": "37a7304db8935dc1e518584af71cb473e3a44090"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

