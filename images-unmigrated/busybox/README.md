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
| `1.35.0-r25` `latest` | `sha256:fd3bbb0d34a197549a9d8cc44d94d8a6562f2efe78fe3d45e08cbda7f84dcf0c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fd3bbb0d34a197549a9d8cc44d94d8a6562f2efe78fe3d45e08cbda7f84dcf0c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |



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
        "docker-manifest-digest": "sha256:fd3bbb0d34a197549a9d8cc44d94d8a6562f2efe78fe3d45e08cbda7f84dcf0c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bdc753375147f0f1460555ccea79f35c3c3c48ef",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/busybox",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCVC1O4jW3BKgw3saq6BT5yN8xOAHaljJLfIZJSN1x7KwIgJjAmqX/apvtCjJk9gNvAzeE2bMBzzqJ5BzAExou6ii8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ZWE3ZTkwY2M5MTdlZTI3MTVjYzczZDY3ZjM3YzZjNDA5YzliNjY2ZmYyODExMDZlYTNlYzBhMTUxNDJmYmIzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQkplajAzcGZoTXI0K0JmVVdOaFZ4clpMajN3RmJFOHR6c0hUMFNCd0VocEFpQXYraHZESnA0dSt4YTZ1Ty9xVHNGNEc2Q1l0ZFhsdHlaUGp3bGEyS2ZEc3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVWRU5EUVhsVFowRjNTVUpCWjBsVldFWlBka0p3V1RRdk4wZHJabFJYZUUwMVRrOHhaazR5UVVjd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFRXdUWHBKZWxkb1kwNU5ha2wzVDFSRk1rMUVRVEZOZWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxUVc5QlRGZ3haRUZrWTBSWVFXWjZRbFJhUlZaaVpXNVJjbE00YTFaT1JVTmlZbVVLUVdSSWNrNWpaQzlNUkdJclZsa3ZaSEZqVTI5RFZDdHRTV0puTjJOUldHRnhaSEZaZVVOb00zcHJlRFoyYVZWcWNVdFBRMEZyVFhkblowa3ZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6U1hSM0NqQkdjRVJrWjFkcVF6UjFSM1J5VUZOd1dYbHRWMms0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsbldVUldVakJTUVZGSUwwSkdaM2RXYjFwVllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaYmxaNlpWZEtkbVZET0hWYU1td3dZVWhXYVV3elpIWmpiWFJ0WWtjNU0yTjVPWGxhVjNoc1dWaE9iRXh1YkdoaVYzaEJZMjFXYldONU9XOWFWMFpyQ21ONU9YUlpWMngxVFVSclIwTnBjMGRCVVZGQ1p6YzRkMEZSUlVWTE1tZ3daRWhDZWs5cE9IWmtSemx5V2xjMGRWbFhUakJoVnpsMVkzazFibUZZVW04S1pGZEtNV015Vm5sWk1qbDFaRWRXZFdSRE5XcGlNakIzUm1kWlMwdDNXVUpDUVVkRWRucEJRa0ZuVVVsak1rNXZXbGRTTVdKSFZYZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlaYlZKcVRucFZlazE2WXpGTlZGRXpXbXBDYlUxVVVUSk5SRlV4VGxkT2FscFhSVE5QVjFsNlRsZE5lbGw2VG1wT1JHaHNDbHBxUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRm5RbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNTbXNLWVZoT01HTnRPWE5hV0U1NlRESktNV016YkdsaU0yZDNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFFwTlNVZEtRbWR2Y2tKblJVVkJaRm8xUVdkUlEwSkljMFZsVVVJelFVaFZRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVENtSmxZVGhKWjFreVlqTkpRVUZCUjBSUk9FRk9hbmRCUVVKQlRVRlNha0pGUVdsQlJXcGxWM2RTU0M5cFdrVnFjR0ZLVXl0dlZGRlZTVmRwVldWaFMySUtZak5RV0RkQ05HbHZaamxQVFZGSlowOWpVMEpwVDNaT0wxbzVaWEk1UkVOb1QzazFXSE5tUzNwYVRISTNSbnBFZFV0VFZrbHpRVGQxYkdOM1EyZFpTUXBMYjFwSmVtb3dSVUYzVFVSYWQwRjNXa0ZKZDFWQ09EQkVRVXBCUzNsVFFrZDVjMVJtYWxwb2NFbGhRMjk1UjBaNmVpdHBaRWhSVVc5UE1qZFpTV1pEQ25SamRWRlJWRkZWYlZoeVJXNHhTalJvVGtrelFXcENLMGRRVFhOamFYQk9lWE5HV0VwV01HRkRhbEpIUkZWVVRTOUZiRWxGVUdZM1ZIZzRPVXhPVUVFS2NEZHJWa3RNZG5CemRFbHdSRTlZY2xwWEx5dFliMFU5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1663289025,
          "logIndex": 3512013,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/busybox/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064671505",
      "sha": "bdc753375147f0f1460555ccea79f35c3c3c48ef"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

