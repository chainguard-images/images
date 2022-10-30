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
| `latest` | `sha256:c68d3766207dc3011e757cbc6f813ff9dd9a6d91e02a7c085bc1ee8dde005d10`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c68d3766207dc3011e757cbc6f813ff9dd9a6d91e02a7c085bc1ee8dde005d10) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:c68d3766207dc3011e757cbc6f813ff9dd9a6d91e02a7c085bc1ee8dde005d10"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "135a099e99aefb4ca9670efa27659765ddd7b74a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDpiRP9R/IcqhmYQHBifw8/KyzaINzG6mrYq+gsVhmI/gIgJPaUfTknDFnN/o6BiZaPc7f+YVruphWoC0HMpP0VdHk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZmQ0YTE0NDJjZGYwNWYyY2NkNzFkMjUyM2Q2M2M0ODczZDE2ZjhjMTBhMjQ0MDIzYjk4NTZmNjAwMjRiNWRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURQY0hqRlFtejlZMjFKRE80dVMwNG1KOUFSbEVOVGFjcHJ6bm02MjVpdm5BSWhBTXlISlMySDlHdEdGaU81bHd4S1dzWWR5ZFVFb1dWVjc1MGhNeDBYYkdwVSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlJIWkxNV2xGTTA1Wk4zSkNTMllyYVRodlowaHhhMU01WWxKdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVjRUMVJSTWxkb1kwNU5ha2w0VFVSTmQwMUVSWGxQVkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3ZVhGWldXaFJSVGN6Y2xodFNreHNSMUZ0VGtkWlFVWjFiRkJzYkRscFNsbGlaRE1LVjNwRk9VVnFjMlZSU0RkWk4wSlhPRkZVZW1WVFJVaHNVVTVYY0VoNGQxVnRjMnQwTDJoV09GUk5iblk0TUdRMGVFdFBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJU2k5QkNreHdUWGRCZUdKVFlsZGhkRTE0YVVFeE1FSk9WbGd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDRUWHBXYUUxRWF6VmFWR3MxV1ZkV2JWbHFVbXBaVkdzeVRucENiRnB0UlhsT2Vsa3hDazlVWXpKT1YxSnJXa1JrYVU1NlVtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFTmFOVXhGWjBGQlFWRkVRVVZqZDFKUlNXZ0tRVkJZZWxveU1HNVBZVUV3UVd3eWNFMW5hekpRUWpCWlVWQm5VbFJKVEhRdmJreHVTa0pzVmxGSmQxZEJhVUpaY1dKNE9GaElUakJXTkhGeVdVZHhTQXBwTWpkSk9WbFpPRTg1THpaVWJETXdSRlJ2U0ZGWE5rSjBWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJkV05yTWtVMlYwdEVNbkZtQ2xGbVFUbE5WVTVyV1VwMFFYZDBkMGwyU25CTGJHMU9kMHB2VVRSNlMwTk9ha3BVTVVKMGJGWnJhRzFxY2xSSGMycEpNVTlCYWtWQk1tdG9SbXBhUzA0S2NYQTNaVmxsTldkbllXcEVOamx0TUVWUU5XcEVVMlZzTmxCWlRYTm9kbXRaYUhaMldHWTVXRFJHTTNjd2FIZGxNRk5zVDBkeVVFTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667092795,
          "logIndex": 6132786,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "135a099e99aefb4ca9670efa27659765ddd7b74a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353626805",
      "sha": "135a099e99aefb4ca9670efa27659765ddd7b74a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

