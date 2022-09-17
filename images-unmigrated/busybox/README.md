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
| `1.35.0-r25` `latest` | `sha256:c3e62b14136aeb5b64cae89c09ff6481b275c01bc3362831cf18899850cc4878`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c3e62b14136aeb5b64cae89c09ff6481b275c01bc3362831cf18899850cc4878) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:c3e62b14136aeb5b64cae89c09ff6481b275c01bc3362831cf18899850cc4878"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "53ece228cf85c3b86d5376252c11cb33dc2039ce",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHA/HeLzy7J8+ZfRloaHyNQZ26ZHD9oIWP8staekpsdwAiEA9F7F/QpRfH/KhXOSQS/c5a08TrZeM0Aps61aXFQw+SI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YWQ2ZjBjNTUxZTYyOTQwOGJiNTFhNjg5ODhkYjE3Yzk2YjMzM2MwMTExODZiZDBiY2RkMWQ4M2MxNDRmYTUxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQk12Znp5VllEWGFUdFRWeFVjRXg4bklWWVJHNVhTbEIzVzRDQS8rQktYR0FpRUExMDNDVENpaTJMYTNWK2VRSEJ2VFlvWHM1bkM4clFlUCtQVmtqRXRtU2lnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVha05EUVhsWFowRjNTVUpCWjBsVlFuVmlaREk0YURBNGIyNUdVM1ZrUjI5TE4yVm9TbUZQUmxORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFRjZUMFJSTTFkb1kwNU5ha2wzVDFSRk0wMUVRVEJQUkZFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZyV1hwclJrNWtORlV4VFRSdk5qWkhjV3hEY2pSQ2FFNXZjSEJzUVZSbVNrTmhRelVLVlZKTUwxQXZURVp1ZVZwYVdVcDVWRkUyUTJ0dFYwUnBTMVpVY21aRllYTlRTMmRPVVRsbE1WYzJWbU51TjNsMGJrdFBRMEZyVVhkblowcEJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtVWxOR0NuVjFWbkJHS3psUmRXaDVWMnN6VkhVcmNtMU1PVXAzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPVkU1c1dUSlZlVTFxYUdwYWFtY3hXWHBPYVU5RVdtdE9WRTB6VG1wSk1VMXRUWGhOVjA1cFRYcE9hMWw2U1hkTmVteHFDbHBVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESktNV016YkdsaU0yZDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZExRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSVFQwbDVSR2RCUVVKQlRVRlNla0pHUVdsQ2JFMU9TRkJGTjJKdlREZ3ZjMjVTUVdwaU1HTjFNM2xrVjBKMmEwSUtVbU5wTmpBME1XbERjM1JYSzJkSmFFRktOVFZaVjJReU5rMW1hWEpqYmxSeGIxQm9UamxuYkhKNFozTldVVWN5VGs1WGVWY3haREJOVGxCYVRVRnZSd3BEUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxR00xZHRWR1p2VEhndmNsbHVOSEJXT0hGbGJpOXlWMXA0UlU0emRHbHhTRGR1UTNOSldrOXJUVEF4Q25GR2JXUkRTekJNVVZkdFZ6Rk1TRnBzU2tWT1owRkpkMWxUUm10c1MyTkdWVkYzZW1WaFZ5dHJaMGQ2VVVkR1VYaHljelU1WjJWb2JscDNlbmxDYkRJS1VsbEdVMjVGTkdsR05EUmphVkJUY0dwemQyZFFUMDl6Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663375164,
          "logIndex": 3523241,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071540702",
      "sha": "53ece228cf85c3b86d5376252c11cb33dc2039ce"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

