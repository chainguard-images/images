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
| `latest` | `sha256:8ca1463752aaeda2688339d48f613d6272fa8b4e10f7a39b759d2a6fd9f96138`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8ca1463752aaeda2688339d48f613d6272fa8b4e10f7a39b759d2a6fd9f96138) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:8ca1463752aaeda2688339d48f613d6272fa8b4e10f7a39b759d2a6fd9f96138"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c6e184bd97e3fff341fe21449f86fc8b1075e908",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGPLmoOkpWzsEz+gHcY/lPSzFw4BN7fmNuNb3e7cvvlgAiEA5Stw6WZyZklPSa7Pj9sZOqsI7Ma/4rgHeYjKGoH3CQc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NTRkYzFlYzQyYjRhN2U4ODhiODJkODYwNDg3ZmM2NjJhY2Q1OWQzYzc5ZDE4ZWE1NWM4YWFjMzNkYTAwMjgxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUROWk9GV3NtVlRPZEF0MFVUYUFZT09YT2lGKzVPOEVDVGxKUFBpME55UUhBSWhBSzd4RnhJVTNhbFQrWko4ZTBiUkZFT3ZBWlI2cTVsRWh0Z0k0Rk10YXFUMSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlpsWXpZazlJZWpSNWNUUlJPWGhuUTA1dGRUbFFlbWhXVEdGcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVjRUMFJSZDFkb1kwNU5ha2w0VFVSSk5FMUVSWGxQUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3WW05R2EzVkJXbEZ1YW5oT2JHSTRhbEZRUkVkUVltSTNXR1ExZHprNVQwdGxNaThLT0N0UFUyRnRWVkZYT1RRNU9XaDVabUZwVjJsallVeGFkV3RrVVUwdlkyVXZaMFpMYWxkR0syVnpSSG95TURsMGVtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1YVhwRUNuRnVSbHB4VWxkeGJsRXhWakpaUmt0TGFVTmhLekpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFUbTFWZUU5RVVtbGFSR3N6V2xST2JWcHRXWHBPUkVadFdsUkplRTVFVVRWYWFtY3lDbHB0VFRSWmFrVjNUbnBXYkU5VVFUUk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFSjNjbU4wT0VGQlFWRkVRVVZqZDFKUlNXZ0tRVTVxU3pKeGRtUjJiR2RhTkRrMlUwOVNkeXQyU0M5SlJtTkROM1ZqYVRGR1YzWlZiVVV2TWt0cGRteEJhVUZoWkhaM01GUnRUSFkyTW5WNmFGWXZXQXBHWW1OR0wxUnBTVkZaUlVOYU9EQm1lRXRZUVVVM1pXWmlha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrSTRhMlk1TWxkV2JrWXhabkZ5Q25oUlRVUjZiVGRpWldacE9GRmhUREJ0YURneFRFUmhRemhMYVUxUlJWZE5VVVV3VjJOMUx6YzVjSHBpVGsxclZrSXdjME5OVVVRckwzZHFhVTlFUkhVS2JXMVVWME5WYTIwNGVWcE1Ta0pVTm1OQmJFcHNOa051Wlc1a0wwdFhNMU1yV1d0dU1IaFNObE5QYkVaaWNXSllaakJhUVZGWlJUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666919930,
          "logIndex": 6014458,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "c6e184bd97e3fff341fe21449f86fc8b1075e908",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342079004",
      "sha": "c6e184bd97e3fff341fe21449f86fc8b1075e908"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

