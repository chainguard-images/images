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
| `latest` | `sha256:5a40dde9861d23c30e692f0eae3dc9f01b18f7c693b66548e2f62707ee92cadd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5a40dde9861d23c30e692f0eae3dc9f01b18f7c693b66548e2f62707ee92cadd) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:5a40dde9861d23c30e692f0eae3dc9f01b18f7c693b66548e2f62707ee92cadd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d5d85b79d38648ce91f906f343d37a81b6795524",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIH9Rgt49GcaPLVT208yUqP4tQ/V36ioZfMGLva8k/HORAiEA2FGGRmdAlG9EC8tuPqfsAB0lnx7krQzoqmdmDwrd3Ow=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzOGQ5YzM0NmI5MDA1NGFhOGFmYzFhM2ViZWExZGI1ZWFhZTk1M2FlZWM0Mzc2ZWE4ZGNhZjc4ZjcwYWMwZjU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR0hsWHd5d3A4YlM5SmgvMmFBNi96YTl6cHhkTllBOGVRZThlZkQ4a3IxbEFpRUE0Sk5YZ0E4a1VXaHhEbnBqVDVKUzFQR0U4L2l6cEthQ0h5dUJhMFdUaDhVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlEzVXZTeko0WkdsTFFVaENNMUp5WkdaSkswSXZMMDk2T1ZGemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVjRUVlJWTkZkb1kwNU5ha2w0VFZSQmVrMUVSWGxOVkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoV2paNlVqQmphRXB0ZG5sTVIzRlpWbXQ2T0VSeU4yOVJOblIzTWxoak1tTnRiV29LVDAxNloyNTZRMFZPU0ZGQ05ISkJTU3RPVm5kMWVrWjZVV3BKWldKQ2R5dExNMnB5UTJzeFJHcDVTVEJPU1dsYVZEWlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXVUVwWUNtTlliV3h4ZUZreFMxRnFSSEJaSzBaWU0zUm1SVmRSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJUbGRSTkU1WFNUTlBWMUY2VDBSWk1FOUhUbXhQVkVadFQxUkJNbHBxVFRCTk1sRjZDazR5UlRSTlYwa3lUbnByTVU1VVNUQk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFUnpUR1EyZDBGQlFWRkVRVVZqZDFKUlNXZ0tRVXBrZGpFMFRVMU5WWHAwZWtWblZITkhjMnBtVFdKQ1JsRnFTVmhGVXpnNU9XVlpSVUo2ZGk5WFdXdEJhVUpCTXpoUFJsWkJaRmROVUVaVk1uSjVhQXB1ZGpWUVJGWTJhbU5YU1VkUlZDOHdLemgzTW5GelJFazFSRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrSXZaR1J1WkhCalZHOVdibUpwQ2twVVVHUTVRbkZsUmxkdk4weFJhbEpJTmpoMmVDOHdObXBqTm00ek4wZE5NVFlyUjBGNVpqSmljV0pwYm5odVNDc3JjME5OUlVacGNXdFJkMDlrYXlzS1dFVmhZV1V2Unk5dlpITjNPV040VEUxQ2JHVTJTMDlKTTBoVWJVUk9RMmhrV1VkWGNWZEJkMmRGWVhRNGRtZ3ZTMWxGYUVSQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667437931,
          "logIndex": 6393103,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "d5d85b79d38648ce91f906f343d37a81b6795524",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382287219",
      "sha": "d5d85b79d38648ce91f906f343d37a81b6795524"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

