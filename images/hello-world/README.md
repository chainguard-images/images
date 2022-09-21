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
| `latest` | `sha256:f4705794d1835e787c427d20a53adb4c7c9506ec0e0fe7991255c71e7bdbc35e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f4705794d1835e787c427d20a53adb4c7c9506ec0e0fe7991255c71e7bdbc35e) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:f4705794d1835e787c427d20a53adb4c7c9506ec0e0fe7991255c71e7bdbc35e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "391129baad7249590370f7cc1f9f9efbc4f0d441",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDwatGxHfe/I6nGVFPoWmEg1BDWcpra8CErqkAOceZ3MAIhAJ9O+PVpsfmitd7c+DkKV6VtGVw0IuOUgXDRwFQ+GXRl",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlODNlYzk2YWJjNjVhOTJkNTJiZDRiN2JmMzdkMDRlMzgwZjQwOWE4ZjNjZTBlMWM2OGU4ODg3MjE0MDQxYjVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRyt6ZlpZcmFGeFMzbjRmeUY3Z3hVSGJONVBobUZFeGxlTldMaDBnSURBL0FpQi9SUXBhcjU1U2JJQzRGaEd0cG9aYzRWQU9ielRCNFhJNUZFMXNoUWFqdGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlJFbEVMMDlhU1RneU5WaDFUVkJPWjFsNWNXczJSSGxoVUVsWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFVjVUVVJSTkZkb1kwNU5ha2wzVDFSSmVFMUVSWHBOUkZFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZYW1WNldtbzNTSEpxYjJWa2RVOXRSMWxEVWtwMVozVndZV0pXTXpKSU56TjJTMjhLUTBoMFNHdFVTa2x2U0hBemRqbDNVMVZuWjFCTk5FbE5RblphYjBWbWVUVnJZVmRzTURGdU0zQnZRV0ZVVDNCVVQwdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNYW1GTENuVllTbWx5Uml0V00yZFdMMFpSYzBjMU5FOW1UbEpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDZUMVJGZUUxcWJHbFpWMFpyVG5wSk1FOVVWVFZOUkUwelRVZFpNMWt5VFhoYWFteHRDazlYVm0xWmJVMHdXbXBDYTA1RVVYaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6RXlhVWR3VlVGQlFWRkVRVVZaZDFKQlNXY0tRMWt4U1d3d056ZFJRamRGZG1NNGNtY3JWekpTUVhWSmVVWTJPV1ZLUlM5ak9FazFiekZXVm1aUk1FTkpSa2R1T0Vnd1dITktibmhITTB4Wk9XTnBjd3BRYkdKR09VMVhhMjgwTVVNNFYzZDVhVE50YzJ0NlZqUk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlF6UXJNWG80YWpCU09FOUtXbmRhQ2xwTGFXRnFURTVFVkc1bU1uSnFlbmd3TUhack1WRkxSWFZ4Y1VaWWEySlJPVUptUnl0WVR5OVFZVUZ5U1V3dk5XRjNTWGRGTXl0TVdWSktVbFpUU1ZjS1RWRnRUSE5DVlhkM1VHRkxUR1JVYjNObWIxcE1ia3MyVUd0NFZuTlJRMnBpTWxSWVpGaE1NVEZYTldNeVkwUXhZMmwwUkFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663723258,
          "logIndex": 3642672,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094555135",
      "sha": "391129baad7249590370f7cc1f9f9efbc4f0d441"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

