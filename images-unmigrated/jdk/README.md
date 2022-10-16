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
| `latest` | `sha256:3a707589099a2a388ec7e225768ff61b9e4f23acb246ec91e95c88f6d26fd772`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3a707589099a2a388ec7e225768ff61b9e4f23acb246ec91e95c88f6d26fd772) |  |



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
        "docker-manifest-digest": "sha256:3a707589099a2a388ec7e225768ff61b9e4f23acb246ec91e95c88f6d26fd772"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "826fae0ff3d8b94834b390e04aa4f02cfe7396b7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFqdy7LCQ7Kg/jz26zIkQ8EnfrcehotWpD6m4qiv7jCMAiEA/oQlUV9LMQ2LA28YxHATRu+RzYwypQ61pbWpt9xV8i8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZGJjYWJmNWNjZTlmOGU3OWVjZDI5ZDdhMWZhZTVhZTU5NTU4YTcyMjVjNzdmYmFkYmRhYWU5NDdmYTg2MjNhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDhvODIwbjBlMlZDNWtjZDg4R2EyOXU5L0J5VzM0MnlyWUpNcnYwVHQ1d0FpQmVXWndLWW0rNVNFaTRMN3ZhdGRxQ08vN0NEamJuQVRzdW1HQjR2WUZIb2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlVqZE1lRFl4YWxwUU4wOU5VbHB2YTFKVFZYcEpUR2xUVERBNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFa3dUbnBSZDFkb1kwNU5ha2w0VFVSRk1rMUVTVEZPZWxGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVWjJScE1uVjZZVFJKVFhoemJuZHZVMmxzU2xkRFlpdFlSMkZSTkdoWk9FODFObEVLWlVJME5tcEZaV28xZUdGQ2VHUjRVRnBVZUZaeWVtVm9XR3hVTldrNEsxVnFlRTVzZWtzMGMyUkdkRVphYzNWdlRIRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFWW5oa0NsZHJWVWd4Wlhsck5ESlljRWRtUVc1dk5tZ3hjMkZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQwUkpNbHB0Um14TlIxcHRUVEpSTkZscWF6QlBSRTB3V1dwTk5VMUhWWGRPUjBab1RrZFpkMDF0VG0xYVZHTjZDazlVV21sT2VrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkROeVEyVjBVVUZCUWtGTlFWSjZRa1pCYVVWQk5uQmxkWFYxTW01SFFtOXFaWFZrTlVKRmRHUUtZekZYTTJSUUsyNWpUVkkzV0RkeE4xQmFabnBzWjFGRFNVaEJLMUJYUmtNNFdYaFZPRlJXYmtSb09TOVZhazh4ZFVGSVlreGliM2RLVFZSRFdXVXhUZ3AyVTJSdlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRFprbFJSR3hFZUhodFRVbGpNVWMwYVVGbVVYZFhVR3RpY0daUVNESkJlVU5LQ2xCeU1tTldibU42ZURFeldsRjFUamxYVTNaWWNFRnJVSEJ0U25SeFpXOURUVVJzU0VzMk0wRmljVGhpYVVKV05FSjBVRFZOU0hSS2NUTXpiVE5JUVhVS1ExY3dVVFF5ZDBWcVdubDRjR2RZWVVWUmFXTnlURTg1Ulc4cmRFTlhkVVpYZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665888461,
          "logIndex": 5191722,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "826fae0ff3d8b94834b390e04aa4f02cfe7396b7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257959720",
      "sha": "826fae0ff3d8b94834b390e04aa4f02cfe7396b7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

