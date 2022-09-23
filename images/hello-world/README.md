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
| `latest` | `sha256:fdab0005fee70ca80464cedf3ca3f983c6fe5f6be24250d95513f60e2c3c571c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdab0005fee70ca80464cedf3ca3f983c6fe5f6be24250d95513f60e2c3c571c) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:fdab0005fee70ca80464cedf3ca3f983c6fe5f6be24250d95513f60e2c3c571c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2132bcef06002356bb01311f06818c1bf94b05a0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDK/bpJQWP5KFHFAcIMA/xvrZcq2NhijRlxX/ub6mugOAIgIanKi9w7CmYnM//N+iB7kTdZ6+MEzGOz/be4BohkFKI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MTg4MmE5NTZjNGQ3YmY4NjFlZWJmNGZmNTVjZmZkZmU4NjlmMTA3M2QyN2VhNGUxNTZhNjg0YzUwMTQ4NmY1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRjJpeGpCQW96V0xuTyttenZHeWFqdkcwa2JGNktmb2dHcWxHbHQzb2lZV0FpRUF1b1JyWXRRL2dkaitkVndEL01TQkp4Vnd4dGh6SHVvUWQxUkRGSjlPaFN3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlEybHlORmhaT1haMVMxaHRZMEpXVFZKTmJHNW9aR0ZIWTNaUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFVjVUVlJKTTFkb1kwNU5ha2wzVDFSSmVrMUVSWHBOVkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2YkVZMWVrSXdSR1IyT1hGNFREQTNUV1ZUWlZOaVVGQldlRzg1Y2pSeGNGSkVhbG9LY3pGWVpXSk5abEZWYkZGVWRsVlVUa1F5VjFOb2NIbE5NRW9ySzNoWVF6WjZZMmhGTjFjclZsQlZVazFyZFVOdlIwdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZWkdOUkNtUTRXWEZNYlZsU1ZIazRla2RzY0hNeVdWRkxPV1J6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUVlJOZVZsdFRteGFha0V5VFVSQmVVMTZWVEpaYlVsM1RWUk5lRTFYV1hkT2FtZDRDazlIVFhoWmJWazFUa2RKZDA1WFJYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6Sm1kbUV5V1VGQlFWRkVRVVZqZDFKUlNXZ0tRVWx3ZVVzcmIyaFNjek5wYVhnemRta3lSa1IwWm5SWVZWTTFVbmhRWkhWV1RpOU9UV1JCYUdSS2QybEJhVUozYm0xTGIxVlBXVFF3Y0ZoeU5IWjRhQXBxUTJWQlYwZHhXamxDYkdreVZuRlVOVWhMYUdOcldtSjZha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrRllPR1puU0dKVk5XZDBjVFJvQ2xSMk5XNVlTazh4ZW1GdGVqWkdSVFJCWjJ4a1drNW5OakF6YzFvd1ZYa3hha3RMV1RGNE9GTlROV2xWWmt0Uk5ITmxORU5OVVVNcmJsWTJjM1ptY1c0S1VEZFVRa1UxVUcxWFJtUkpkV2xIYVRKQmJVNTVhbGxFZEVOdGRqTk1VSGgzWldvdmFDOVZUVnBtZGpoSEwzTm1TamR6U1RscldUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663896097,
          "logIndex": 3780263,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109817004",
      "sha": "2132bcef06002356bb01311f06818c1bf94b05a0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

