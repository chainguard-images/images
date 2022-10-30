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
| `latest` | `sha256:a33a3f2bf88e56cae9d4496540b1e6450592f1d27ab9d882f48ba08b911e9db2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a33a3f2bf88e56cae9d4496540b1e6450592f1d27ab9d882f48ba08b911e9db2) | `amd64` |


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
        "docker-manifest-digest": "sha256:a33a3f2bf88e56cae9d4496540b1e6450592f1d27ab9d882f48ba08b911e9db2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "625692f497cd1ecfcca9e3796c7f52ae56ef99aa",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCa+c9vtDSKPBKewRZjNcmAxY3kqGLjgl5JMXAJiW6cUAIgFZLcYf4xQTccprLqbYO3OKxYrrAEc0pvzEwjOf6eU20=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0YTNlYWFmNzk4NDMwZGVkN2VmMGRlOTdhMzE5ZWQ0NmQ0YzAwZDkwM2ZiODViYTQ1ZThmZGNhN2EwM2VhOTMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRjJ1WEhhdGJnM3BtSS9IbW9FcEZIdWpZcTRLdFNIWmpPRUpDWlpIbG5oaEFpQm96ZnRZY0RhaUZvOXlQY3RIc0QxYk9LTkV1YWN2c014RzJMdWtNVjBYcFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlEySlplbVJXWjNVd2RpOHlkVVl4VkV0c2RXdGtOMVJWTkZKSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVjRUV3BCTTFkb1kwNU5ha2w0VFVSTmQwMUVSWGxOYWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUY3pCMlkyWklOMVY1Ukd4TWFUVm5hSFZxVmxKVFIyZE5jSFZLWWl0WlRrbExZM2tLY21kMlJGTmhWa0ZMUVVGVVRqbEdTRWcwTlhoUlFWUkNha2hsVUhGYUsxWlJVWEJrYUhsalZXeGhjMWg2WkRGVlYzRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU0TkZWckNtZGhObTFJV0hCSmNsWjJRbmRDWjJWSWVUbFJjSFZyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlplVTVVV1RWTmJWa3dUMVJrYWxwRVJteFpNbHBxV1RKRk5WcFVUVE5QVkZwcVRqSlpNVTF0Um14T1ZGcHNDbHBxYXpWWlYwVjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVXMWphWHBuUVVGQlJVRjNRa2hOUlZWRFNWRkVha1JaWVdsWFJESlNjWHBWVEZCSVZVa0thVGxqWm1WM1IxVjJNbkJzVVcxcmMydFNUVEk0YUVzMlNGRkpaMUJSWTNkclIzZGlibXBGV0dzMWRqSlBXa2xNZGtwTmNHdE9iV3BCYTNKbVkwTXdTUXBHVW1rdmJFSnZkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmQwVXJSRlEwSzJ0U1JHRXhRMnB5YTFCNWRYWm1NV2xKYUZoR1pVcFdSMDh5Q21vM05uaG9iVnBGTURCeGRWSktRbTlvY1dkcE1GZzBXbXBaVlcxQlYwOWtRV3BGUVd4MmNXZHFaSGh3YlNzdlMwSkNkbmh2TVdSU015OVViMnhDZVZVS1ZEbHdlRXd6ZFhkaWFGcDJjbTB4Wm1nNVFsaExZamt6YTJOVmVsbEhUeXRVTjI5UkNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667092331,
          "logIndex": 6132448,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "625692f497cd1ecfcca9e3796c7f52ae56ef99aa",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353611472",
      "sha": "625692f497cd1ecfcca9e3796c7f52ae56ef99aa"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

