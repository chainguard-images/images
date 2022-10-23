# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:c238ca73cf1c6d41739ffca48c001b59cf904154a3acb32996d6cc799451669e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c238ca73cf1c6d41739ffca48c001b59cf904154a3acb32996d6cc799451669e) | `amd64` `arm64` `armv7` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/hello-world:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/hello-world:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:c238ca73cf1c6d41739ffca48c001b59cf904154a3acb32996d6cc799451669e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7962c394e8247e0834b433f009fe2c2f491cb10f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAb0ivHTKzJXEOQUidKu+bDli7y0pzmQEQTOJ21zg5vCAiEAieB+FlzyXFz2lyhKTJp52R06m33kF2xvWzAeC0sZrF4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZTI1ZWNkNzlhMzdlOWNkZjY1ZDk0NTBmODZkNjQ1MWFmZjJhYzNkYzhiNDZkM2RjNTlmMzJhN2QxOGZkNjA1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHVnalg5b1BoUkNlaXJrc1BwdGhZODlWVkZoSU82OC9WSjh1R2ZUV3lHeEFpRUFscjFGeUZnS2JYaHkvSnRwSGN3d2V2QjN4U2pEWE1hUmNORW43S3RZc21jPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlFteDZlV2x5WTBwVlMzZzRiazVLVEhjeE1rVXhkVWx0VlhrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFVjVUVlJGZWxkb1kwNU5ha2w0VFVSSmVrMUVSWHBOVkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZvY1dKU1NsQlViRVZGV25FdlNqZERORTFRUmxGRGEyVlhlaXNyTm5kb1pFUTFkMWdLWjNOcFptTjFZbkZyVmtaU1pHdG5MM05NTVhGYWVuZzVVMmxWU2xKeGRuVjRWa3RpYW1ONFRVNXZaVkJ3ZFhWUFpXRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUxYWtSQkNuSnFXRkI2TUdZeGVFaHdWVTVuT1VncmREUmtMelJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pUMVJaZVZsNlRUVk9SMVUwVFdwUk0xcFVRVFJOZWxKcFRrUk5lbHBxUVhkUFYxcHNDazF0VFhsYWFsRTFUVmRPYVUxVVFtMU5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFRktkQzlSYzBGQlFWRkVRVVZqZDFKUlNXZ0tRVkIxVFU5SlluTnZSMlYwY3pKbGVFeEZMMjUyTUdKVlZVMDVaVkpMUjA1UlpqVnRWVVJDTkVkNVEwRkJhVUZuZEZwMFpIVlRZMGRXVmtWbFIzVXhid3BaUzNGbVMyMUVkM2xaT1hwUmJHTnFaV2wxZFRWVVpUZHFWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJibTlQZDNVM2FVSnFXWEpJQ2swMWIzcEJlblJIWTJ4clJEWmFiMEZYYURBMWNGQlliRXQyVkhkUVEzbDJVVlF4VEVoclVFcENXVVJ0VFdGRWFHa3JSMEZCYWtGVkt5OHZObEkxTWtnS05GSkJUeTltUzNFM1V6ZEVlVWhOYVVSV1EydFhTa2d6Wm1ScGEwRjBWR3h6VEhBNVpqRjJZV05FVDNWVVVWSlFWbHBXUjNkcWN6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666488081,
          "logIndex": 5670949,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "7962c394e8247e0834b433f009fe2c2f491cb10f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305358123",
      "sha": "7962c394e8247e0834b433f009fe2c2f491cb10f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

