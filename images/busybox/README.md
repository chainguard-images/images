# busybox

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/busybox/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/busybox/actions/workflows/release.yaml)

An image that contains busybox and musl, suitable for running any binaries that only have a dependency on musl.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/busybox:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.35.0-r25` `latest` | `sha256:94488d9a8a6b8b15eb5c67d4d8a538071e7e470a76c1b1e16f98a3a0cd74f6bc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:94488d9a8a6b8b15eb5c67d4d8a538071e7e470a76c1b1e16f98a3a0cd74f6bc) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/busybox:latest | jq
```

Output:
```
Verification for distroless.dev/busybox:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/busybox"
      },
      "image": {
        "docker-manifest-digest": "sha256:94488d9a8a6b8b15eb5c67d4d8a538071e7e470a76c1b1e16f98a3a0cd74f6bc"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "59c79f4616f49997f63683b7939b162382d9bfa7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQChq+iSqq5bCSau05k2O7VTplGtiGA0jQB+Cy9ss/7ZkgIhANTtwmPbvBq8LV+01oD6KU3T3sjHcEUAf+LPanoWh/gz",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MGJiMThhYjVmNjVlZWUzNTA0YzVlZGU2NzNhOTFjZTljNTFmZTAzYjkxMzg1NzE3MmM0MmI1ZTE1YTJlOTEyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRjlYdURYcHJzZmdEcEIzWHFNMXZpU2tkMHVycUpCUG5meE93YVgraHpwbkFpRUFpRGxRcnl2SzR6WmhFM0t6MWV0NnhhbWNjbkxCMjJUU2J3czdPSThWTmFBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsWFowRjNTVUpCWjBsVlVUZDVheTlZWTNScFlpOTJkM0pzU0dkM1J6TnBUVFZMTlZsRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlJFRXdUVlJOTUZkb1kwNU5ha2wzVDFSRk5VMUVRVEZOVkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIVlVkeWRUZzJhR3MzU3psMlFuSXdPRTVEVDFacmFFZzNkVlpIUkZWSVlUbFRVRmtLWVVNM2VXNTZXRzVGVUVzck1tOVRhalZ0VmtkUlZrSllSRE13YUZONFJFWkJOa2g0WkhCWU9XdFFVV2QyU21jNE9XRlBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNTlVackNqWndRMlZzWmxjdkwwcGtVMVZUVG5VNWNYSnVlR3hyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPVkd4cVRucHNiVTVFV1hoT2JWa3dUMVJyTlU0eVdUSk5lbGswVFRKSk0wOVVUVFZaYWtVeVRXcE5ORTF0VVRWWmJWcG9DazU2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESktNV016YkdsaU0yZDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVmVrWXlkVkZCUVVKQlRVRlNla0pHUVdsQmFWUktVVkpRTjFSdVRFUkZXWFF5U0VRd01rUk5hSGwzYWpFM2NEY0tjMHRKUkhNMVZFTkRMMnBXUlhkSmFFRk1OWGRPYlU5eVZrMVpVbFJzY25ObFpYUmhOMEpXYkM5dGRGWjBjRXhyYTBaVU0xZExjbTgwTDNKTlRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxRFIwWnJhaXRHSzJveFdXNXhWU3RtZGprM1NrdGhUMk0xVURVNWFGVlNTSFEyU2tnMFdtVlVOVkZKQ2k5c1JTczVSbVY1ZVV0a2EyUjRWelZIUVRaWmJuZEpkMEpLUVNzd2VVNHlRMEZ4ZVRCbk9WUlZOMHRET0hKME1HZDBZM2xIWjFCamRXbFJhM2xxVmlzS0swVk5NV05EZFcxWWR5dHRiM280UVdneFVHZ3JSV2x3Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663548112,
          "logIndex": 3530963,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3079239299",
      "sha": "59c79f4616f49997f63683b7939b162382d9bfa7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

