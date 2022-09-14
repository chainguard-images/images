# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:26f1913ca1dc9e59e09ef1eb2bf95d93d7d0da1a11cb5bc9a8318067378f106f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:26f1913ca1dc9e59e09ef1eb2bf95d93d7d0da1a11cb5bc9a8318067378f106f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run distroless.dev/alpine-base echo "hello distroless"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/alpine-base:latest | jq
```

Output:
```
Verification for distroless.dev/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:26f1913ca1dc9e59e09ef1eb2bf95d93d7d0da1a11cb5bc9a8318067378f106f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "95fac26275a7937377f89005db7a537ae5e9fe93",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICcj1ihxnEeYDiN/Dej3C6wplhZTi1q4R6VJ0Qtrfjp2AiBBPJ5mJBBVjmLmEOnOiUfeJ8xGXCTxXYjvZREMPK2X3g==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNjdlNjUyMjRjMmY4YjAyZWFhZTZjMDAxYjEzN2JjMzc4MTEwMzllM2Y0MWQ5Njc5YjVmMGQ5MjVkYzNiZGE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNFNUd1Wko1ZWpINGxBalNkWXhrZG5jOFJzYzhjV0dBa1JZOHlXcmlMRk9nSWhBS2g2V2RmblduVWlLcmtZK0Z5WWt2OXJ2TDFSTEhneldRZVZnMVFvZzNiSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlRWVjBaVlpITXk5aWEyVjViMEZTVDJ4UmJFWm5hVEFyYTFORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZHTjRUa1JGTWxkb1kwNU5ha2wzVDFSRk1FMVVZM2xPUkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZQZG1scWExTjBibkZ1V1ZOck1FcFplR2xNVEc1ak9Xa3JkMkptVlRnM1NFVnFWRWNLVWtsb2QwMUlTbFprVjJad2FXWTFPRzA0UnpWVWRuZEthMFV2Ykd4R1ptRlVPREpLT0M5S1YwUjZiMlYzUW1nMVZEWlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGVkRoV0NucHZTVWs1YkhJMWFFVnZRMGx6YTJ4dVlWTmxaVmRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlQVkZadFdWZE5lVTVxU1ROT1YwVXpUMVJOTTAxNll6TmFhbWMxVFVSQk1WcEhTVE5aVkZWNlRqSkdiRTVYVlRWYWJWVTFDazE2UVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESkdjMk5IYkhWYVV6RnBXVmhPYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaM3A2SzJoTk5FRkJRVkZFUVVWbmQxSm5TV2hCVFdsVFZtMVRlbmhtY0RST1NVWkhOUzkzUzNCcFVsRUtVa3BqVUd4SGVtTXZhbUZoV2xoNFpVUkxTMGRCYVVWQmVXVm9jbGhIYVZCeFVXZDJaV2xZT1d0S2JVdHpiVTlrTmxWcWJFVTNhelpTYUVsaU1GcDFZd28xTXpCM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzUzFGdGMyMXNkMHdyY0d0QlJXMUNkVXAxYVhaNlNsRmlSSFZ4U25JMU1reFBXVE5LQ25GWVJVNHJUV05aYzFSdFRsRm9Za0Y0WjBkd1RsTnlOV3RQVjBOQmFrSnNiVkZsVm10UGJuaGFiazUzWkZCQlRIbFBkekpsYm1wTFRURTRSR1J5YkhZS1JYUnJNVUZvWmtkTmQyTlFVbmx6Y1hWbGJVSkpSSHAzZFZrd2EwVk1UVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663175680,
          "logIndex": 3498914,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054714144",
      "sha": "95fac26275a7937377f89005db7a537ae5e9fe93"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

