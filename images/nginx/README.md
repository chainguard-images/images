# nginx

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml)

A minimal nginx base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.22.1` `1.22.1-r0` `latest` | `sha256:0619c5f567552be75916f38c45ffcd64791d22215811435c7dee1e63865f2e87`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0619c5f567552be75916f38c45ffcd64791d22215811435c7dee1e63865f2e87) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.2` `1.23.2-r0` `mainline` | `sha256:449323c871f149bbf7295bf3fbe6c16fd1162aa7c59746b6ad8b4788f887b36f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:449323c871f149bbf7295bf3fbe6c16fd1162aa7c59746b6ad8b4788f887b36f) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |


## Usage

To try out the image, run:

```
docker run -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/var/lib/nginx/html -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx!`.



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/nginx:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:0619c5f567552be75916f38c45ffcd64791d22215811435c7dee1e63865f2e87"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "778e4acca0824819a5674f632f4d5e357f97e66b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFRPyt2QbVU4fIkmWcH4cA0O+x5lKRk1YUymuyBj6i7sAiBHzT+k15nSZrhjlqJ+W1yKe8eW/pAkvzKcJ0rTXI/kGQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZWNiNjdhOTgxNjkyNTM2N2M1ZmY4YTQ1ZGM1OWY0YjM2OTEyOTU5NDQ1MjFmYThmNDI0MzY3NTc0OTE3ZmJlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQU9tZzdRSGx2Wk5WSkxwZDJVMWRVM0oyd3drOTdmb1NCREk5R0VMSWNGZEFpRUFpZitkd3FUbEFYeFZNSXFlWjhvR2pIN1dCZ2EwT1V4UFZlU0JyeU1RS2Q4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVldVOXlOMXB6YnprMFluZHJaVFF3YVM4eWRqRm9kMmc1VlZVNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlZGVjVUMVJCZUZkb1kwNU5ha2w0VFVSTmVFMVVWWHBQVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZsWldoNFIwaDFTRkJWYlVndlNEWXliMWxGVFRsc2FXdHZjMGxGUVRJdllTczRWMVlLT1hrM1ZYRklNR0p3YkM5cFIzTmlhMEpUYVRock1XeDJORlZoVlZsbVIzbHFaRlZ5TUVnMVV6SXpZazkzWjNkQmFUWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRUlVaQkNsbElkR0V6TDB0bmNtRm1TVll5Y1VObGMyRkVXa0l3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkdNelQwZFZNRmxYVG1wWlZFRTBUV3BSTkUxVWJHaE9WRmt6VGtkWk1rMTZTbTFPUjFFeFdsUk5NVTR5V1RWT01sVXlDazV0U1hkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUlV4eGEweFJVVUZCUWtGTlFWSjZRa1pCYVVGVlpUSnRPRXBLTDJwd0wwNVpjMUpqVDBJeFJHOEtLMlI0YVU5Mk5qVnVTbU13U21oaGVWUklWamsyZDBsb1FWQXdNbGwyT1VkdFlVdE9UWFZrUldsbldsWjJaVzVyTkc5Mk0wMUdZMjh6UW1abFFVSkVTQXBYWlZFNVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVKQldTOVFVVnBPY1ZKeVdFODBTVVZXU1hSYVNITnNVME55UmxkRGNHMVlUMkYxQ2pCdmRtdE9TMjVMYlhkblExTlpWVWRJZEdGNk1FcDFMM2NyVFV0VFowbDRRVkJQTnpSeWMwaFllVXBPZVdkcVRsSnpOMGdyZDFvd1owTjROM3BOWmxjS2VIWkxkWGhXVGtkTFF6aERLMjFuWmt4S2IxRnhObUUyTW5waWVtUnNXRVZxVVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667230159,
          "logIndex": 6233750,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "778e4acca0824819a5674f632f4d5e357f97e66b",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3362363252",
      "sha": "778e4acca0824819a5674f632f4d5e357f97e66b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

