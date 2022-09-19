# hello-world

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/hello-world/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/hello-world/actions/workflows/release.yaml)

Hello, world!

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/hello-world:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:8da3118aa47d226f84aff0c9a487e5ff6aa73d35b4857a2194aa370db6ddbe29`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8da3118aa47d226f84aff0c9a487e5ff6aa73d35b4857a2194aa370db6ddbe29) | `amd64` `arm64` `armv7` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/distroless/hello-world"
      },
      "image": {
        "docker-manifest-digest": "sha256:8da3118aa47d226f84aff0c9a487e5ff6aa73d35b4857a2194aa370db6ddbe29"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "8036fb24058f5799a72da3985935c4ff97dc5185",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/hello-world",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC4E96JMfMtZDK+8nCj68Salps78VlkjmAQfb1U6CmgLQIgZTAtSXnWqNx1/728gd2/qVSC5FYzHJrkTqeyYTXMQW0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMDhkYmM4ZGQ2ZTBjZWM0NGUyZWI5N2JlNGUyOTQxNDRhZTNkNjg0MTRiMjhhMTY0Yzc0OWQxNWExYWFkNzE5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ1dRcmhXNkZnSm1zV05abE8wckoxTXY2cEw5S1pQT1M4azNRQlljVmc2bkFpQXI0dGU5K2dmU3BocnJKRE1yZW9LeXR2MEd5NUo1R2V6dThyWFIrM2IrbGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlJGUm1XRTVHV0V4UGJrcGtNVXB4WmxobWMyTjBURkZ2Ums5TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTlZHY3dUa1JCZVZkb1kwNU5ha2wzVDFSRk5VMVVaekZPUkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZVG5OdU9IUTJhVEpwTDNST1RXVTRVVFp3T0cxU1YzWmlkMlV6VmpKQ1MzRjBRbGNLTW14SE1rbHlZV2hrVERVelozTldTM1UwTHpGQk1qZFZSa1J3TjBkMWJtMUpUazV6VEU5SFVUUnNTemhJVjBsTFowdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxZHpWeUNtY3lVakIyUVRCbWQwZFNUM0pKVVM4MmVFMDNRMEZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoUjFaellrYzRkR1F5T1hsaVIxRjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlQUkVGNlRtMWFhVTFxVVhkT1ZHaHRUbFJqTlU5WFJUTk5iVkpvVFhwck5FNVVhM3BPVjAwd1dtMVpOVTR5VW1wT1ZFVTBDazVVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESm9iR0pIZUhaTVdHUjJZMjE0YTAxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaekZqVVdab1VVRkJRVkZFUVVWWmQxSkJTV2RWV25jdlZFcE5TV1ZOWkZwMU5tOWpXbTFXVmpkUFYzZ0tORUV5VlZSTGMzTkZSVkU1Wm5GRGIzRjNaME5KUWxFeVlqTktjRTlyVFhCMlYzcGlSRlF2VUcxS1ZtSlBNWFZaYjBzMlJrTndNMmRPVms1U1prOXlUQXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVVJvZEU0MVptdFZiRzVtTkVaQ2JsTjNRV1I0WXpjMU1tMWFUV0VyVTI1amFVRldWVlpDQ2xVMlJuVk5TbVZXS3pWSVFtMWhXVEJTYTA5dWNVaHJSRzlvVFVOTlJuZERRMmszUVZWdFVETmhhM1ZFVFhSQ05XeHRORlpaV1hKamIwWk5kRFZ0UmtnS05sTTVVa3RtY2k5amVFbFlaVGxYVVRWMk5USklOR3R6WlUxQ1RtWlJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663613050,
          "logIndex": 3553864,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/hello-world/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3084809061",
      "sha": "8036fb24058f5799a72da3985935c4ff97dc5185"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

