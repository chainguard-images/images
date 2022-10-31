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
| `latest` | `sha256:f638b7ad61b0b75088d9563250e4fab7c6a688bd7e82a0ab64e69b0e87f0174a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f638b7ad61b0b75088d9563250e4fab7c6a688bd7e82a0ab64e69b0e87f0174a) | `amd64` |


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
        "docker-manifest-digest": "sha256:f638b7ad61b0b75088d9563250e4fab7c6a688bd7e82a0ab64e69b0e87f0174a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "33edac95a45883c179b7a10ad3980ad05808aecc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICOq2vDzyLEctkgLYMWpg2xzMJ6B2h4lJlyXvwG7LtoxAiBcvkANsDtbRSctrG4L5QtJEmK2MJMCXOZf8LLqFz7Vpw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNmVjN2M3YWUzMGY2MGExYWI3OTA5M2YwZTJiNTI4ZTQ2YjQ4NWJlZDk2YTNkNTZlYWJmYTVmMGI2MThhODRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQyttQnpHdnFJdHovTk81Qzd3Qnp0ZXRsWWREWXo2b3ZLeFJnaXh3REZsUkFpQjE0SHRaeE1QTko4M0dwRVk2ekJ3ZWRYL3lWWDZxWTBjcGRBWnBiUWsxa2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVlFsRnBSeTlDTmxkU1J5c3dSa1F4Wm5kbFIyeEdMMFZrWTFJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFVjRUWHBCTUZkb1kwNU5ha2w0VFVSTmVFMUVSWGxOZWtFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2VlRoYVZra3hZV2xvU2xRMWVUQXhWV0pLWkhaWVRIRktWWEF4YjJaMVVqWXhjVmNLV2tGa1ZGbFlVemxMY201Q09YZHZhekZ0WlVSV09GSnFVMjVpUjBoclUweGlXVnBVTkZKcVNIRlpSemd2TmpObWMyRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxVUVSYUNsQmhiRFkyVDBWeGRGbG1VVGxSWTFORFJHRkpNVWhqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUk5lbHBYVW1oWmVtc3hXVlJSTVU5RVozcFpla1V6VDFkSk0xbFVSWGRaVjFGNlQxUm5kMWxYVVhkT1ZHZDNDazlIUm14Wk1rMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVYSnRWMWt5UVVGQlJVRjNRa2ROUlZGRFNVSklNMEV5Tm5nM1JsUm1VVEJLT1ROWlREZ0tNREZTZHpBNWFIVlVTelpTSzNGMlpYZERhVVZOTXpBclFXbEJWakU1ZVd0bk5XY3dSR2t6YVZORVFqVXhNV0V6T0ZscGNpOTNLMWxoVmxsVk5HaEhjUXBKV0ZOMFFYcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQ1RHTkdNMVpFTUROMlIxb3hhR280TDFrNGJGQjJSRTFuVWt0NVRFUnlaMUpaQ2tneVkyZHhZVTlyWm5kT09FVllSVWQwV2sxWFNscFhUVkZIYVdWclRHTkRUVUo0TUUxaVkzQjBibFJyY0ZCNFJHZDFlR3hDZGpreVRGQTBaM2d5T1RVS04yTTJMMUIyVldSb2IyWlJLM1pKUkZvNFRGWkphemhzTkVOaWJIVktlVWxEZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667178787,
          "logIndex": 6190771,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "33edac95a45883c179b7a10ad3980ad05808aecc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3357847271",
      "sha": "33edac95a45883c179b7a10ad3980ad05808aecc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

