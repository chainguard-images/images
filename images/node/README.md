# node

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/node/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/node/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:d6c3d5a5fa871884605a2c78f48881b19d6945f15877dc6d5a3822ecaef8c2d0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d6c3d5a5fa871884605a2c78f48881b19d6945f15877dc6d5a3822ecaef8c2d0) | `amd64` |


## Usage

Minimal container image for running NodeJS apps


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/node:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/node:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/node"
      },
      "image": {
        "docker-manifest-digest": "sha256:d6c3d5a5fa871884605a2c78f48881b19d6945f15877dc6d5a3822ecaef8c2d0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "83891fa96ca7d610d6ae49e5ec0a817f76fb2f4c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIASrM+WgGrAQEQGh+rXo6sajM8jU7MF6kz1ljUoqA3JUAiALJcD243GjPmTqDsthlDmtC5T9wkBlvU+ggMQIL7q02A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNzA0NTNiM2FmMDViMWZhNzc1YWI2Yzk4ODQ2M2ExZDE1Zjc3Yjc4NmEwYWM5NWZhZGU4ODllNDUyZDFjODlkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRGQremlscUtCYVZlTTNOckRyc0p6K0JOMDRoNUxEVytXTUNDbFVPRkZLcUFpRUF0Y09tNmFDK3FiSHJjTTFFcW1KYnM3UXFmbDV4cFRscHZrUDBsc0NHVWJRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlYyZFNUVFYxWmtSS2JqWnJabFZsTkc5RFdWUklUMnRTTm1aTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFRXhUMFJSTVZkb1kwNU5ha2w0VFVSSk5VMUVSWGRQUkZFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWYzNCamJqYzFRbGhKVEhnME5FbEVhRko2YTBoWmVtMTRObmhNVjJkTmFrVktaMGdLZFZOQmQzb3JTR0ZNWTI5d05XNVVOMmhWU1d0eWMzbElWa0ZaYUdWcmRsTndkRE16WkdkcmFrazVSRmgxWWxKaGIyRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3T0d0dUNpOXBPRlpoWlVWMVdVdHdNRUpwUWpsYWVIZHdabGswZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUm5lazlFYTNoYWJVVTFUbTFPYUU0eVVUSk5WRUpyVG0xR2JFNUViR3hPVjFacVRVZEZORTFVWkcxT2VscHRDbGxxU20xT1IwMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVXaFFOVTQ1UVVGQlJVRjNRa2hOUlZWRFNVSllRa0pYU1dSTWVtMDBWMUEzUkVveVNuY0thRTVUWVU0dlMxTnhjMUJCVERJdmIwZExlSGRsYWxwbFFXbEZRVEJrV1cxeVNIZDZhVzVWU1hZMWNsUnFhMjV0VVM5dVYybFpUSE5xUVV3M1dYSkdTd280WmxaNGIzcDNkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmVFRkpjMnRaVW1rMmEzaEZjWGgxTUhOVlFWVkVVMlkwTkhkaEwweHRjbGxrQ2s1SFQzSnJUVFJYTmpKM2RDdDBVRXRRZERSVVpVSkhkREZpY2xoaE1reFZia0ZKZDFsQlFWTTFVM3BLWVcxc2MwSm1iWGc1VG5KcmVHUk9XV2Q2Um5vS2NIWkJla3gyTW1sRlNqVkZLekp5Ynk5dVpITXpiVEZhUjJsdWVVVkllVzFUZDJObENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667005128,
          "logIndex": 6073499,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "83891fa96ca7d610d6ae49e5ec0a817f76fb2f4c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349476980",
      "sha": "83891fa96ca7d610d6ae49e5ec0a817f76fb2f4c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

