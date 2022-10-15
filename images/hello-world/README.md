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
| `latest` | `sha256:14c9eb7d1b215b1d48a2032ee55e28caad9024e252f735960ccf97afb4a425e0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14c9eb7d1b215b1d48a2032ee55e28caad9024e252f735960ccf97afb4a425e0) | `amd64` `arm64` `armv7` |



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
        "docker-manifest-digest": "sha256:14c9eb7d1b215b1d48a2032ee55e28caad9024e252f735960ccf97afb4a425e0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b2a8d289c8db21b865cb36ffb5c626aa295e2e03",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHSbDYzbN99WHFAB8UbTMgaQADoOD+8lK6AAbx13V/jPAiBln735G0ehp0qluI6E45ozm/6uYN75QqNutcda1YP9OQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZWFhMzA0MDFmZDI5NzUzNjJkMTg4M2MxZjVmMWQyOGQ4NmRjMGQ1NzYwNDllMmY5OWEzMGJkOTQyYTk5NjgyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSHJMT3oxamovNmlLdTZuQWR5dmlxd1FiejBMMjg1ZnRWbFZnejRGUmdMNkFpRUEzaGFlU1ZCd1J5K0t5SHZYWUNGanF4cU1SK3A5Yno3TC8xRWpocjgwbnpNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwNVowRjNTVUpCWjBsVldIWlRjMWxpYzNGekwzaHJVV0pTWlRZM1lVNUxNbWw1TUVwamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFVjVUWHBCTUZkb1kwNU5ha2w0VFVSRk1VMUVSWHBOZWtFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZrZDNsR2VGTkxObU5VZEVNeVZteDFaVUZZZVRWS0wzaHJkSFJMUlhFMlpubFVhR01LVWk5Qk5XMWtLMFJTU0U5cFQyNXVOV0pGYWtkbmVtcG1kRGhsWjNrd09GWlpkbUpPYlZwQlUzaDJTMUUwVjNGcGJrdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0Y1c1NENsSkhiVTgxVlRGRVRFVktTakJoTlhvdlIzTjJNVmh6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5YUd4aVIzaDJURmhrZG1OdGVHdE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHBUVzFGTkZwRVNUUlBWMDAwV2tkSmVVMVhTVFJPYWxacVdXcE5NbHB0V21sT1YwMHlDazFxV21oWlZFazFUbGRWZVZwVVFYcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKb2JHSkhlSFpNV0dSMlkyMTRhMDFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bHJPSG81YjBGQlFWRkVRVVZuZDFKblNXZ0tRVTl4VmpkTFZUZEtWMjV2Y1U1MVNIZFhhRlpIYVhrM2NHZExVR0Y0VkRSSlUyRlJSbnAzVEVwd00xaEJhVVZCY2poNk9VSTVWR2hVYW5RMVZVaFNXQXBuZVhOVk1FdDVXblZtU201bFJsUnFSM0EzV2tOWVJXNUlVelIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SRnAzUVhkYVFVbDNWemxyT1VKc2QxUkJjalo0Q210ek5YbHZXV2xOU0ZwNWFrVmxhVzFGTjNSa01sRm5iRUp6TDJkVlFYcG5hVFpXTDBKalVGbFJTWEZpWm5GRllXMW9PRTFCYWtFdlEyNVdhV0ZXWWtjS2VuSTFaR2R5Y2s1aVl5dExWVzVGZW5OQ1RIRXJNa3BsV1RoNGExQTFSMlIyVkN0V1lrRk1OMDFVZVVWeWIyNXJibHB1WlRoSVNUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665796992,
          "logIndex": 5127831,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/hello-world",
      "githubWorkflowSha": "b2a8d289c8db21b865cb36ffb5c626aa295e2e03",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253929443",
      "sha": "b2a8d289c8db21b865cb36ffb5c626aa295e2e03"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

