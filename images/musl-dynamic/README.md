# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:bcfc498a677107b758a499eaea89a3afe8eaf712aeeae2cdb63e8b392e0b125c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bcfc498a677107b758a499eaea89a3afe8eaf712aeeae2cdb63e8b392e0b125c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:bcfc498a677107b758a499eaea89a3afe8eaf712aeeae2cdb63e8b392e0b125c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "9934b4457b736b6e9e0d0bcd720bc23ad88b11c5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICt26K0NaUzJ7u8bJ9cmBei/9QP9vI/qihLU/zU1uu5uAiAxDUhcl7PQvqRvSh7s77RYxaPdK5KDvHbzctrhh0k/0w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4ZjA0MTRhODViNTY5YzcwY2M5MDA5ZWQ3OTNkYmVhNzA5ZGQyMTA3MTJkNDcwZDljZTNiODMxMzc2MDZmOWE4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmNjTVJIZ1hTUEVseVJKcHF6OGlwQ0ljbFo3b0dzS0t3bnhGUm16UFdxRkFpRUF5amQ0UHo3TGJ3Mzk4WUNIb1UxSHp6Y0RlbUxaM3J0SlFleDhtZkFlN3BzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjNSRU5EUVRCaFowRjNTVUpCWjBsVlkxTnNlRTlpVVU1cFlXUXhPVnBvUkdkRFMwZGpRV2R6VldwRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGbDNUbXBWTUZkb1kwNU5ha2wzVDFSSmQwMVVXWGhPYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxWnpOMGFrNWtlWGR0TTJ4TWFUaENZbUZhZUhNcmMycFNNM05QVUVwbGExY3hjek1LVDFCeldESjNVV1JtZURaS2FtRjRiVkZvTjFOTk5scHVjVGh3U21GQ1F6ZFlVa2RQTlZrellscE9TbWsyWjFkNk9EWlBRMEZ0VlhkblowcG9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXTVVWVENtaG5kakkwTVdsdFYwbFdUVzhyWTFWSE0zSnRXa0ZKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMGgzV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZTWkRJNWVRcGhNbHB6WWpOa1pscEhiSHBqUjBZd1dUSm5kMDVuV1V0TGQxbENRa0ZIUkhaNlFVSkJkMUZ2VDFScmVrNUhTVEJPUkZVeldXcGplazV0U1RKYVZHeHNDazFIVVhkWmJVNXJUbnBKZDFsdFRYbE5Na1pyVDBSb2FVMVVSbXBPVkVGalFtZHZja0puUlVWQldVOHZUVUZGUlVKQk5VUmpiVlpvWkVkVloxVnRWbk1LV2xkR2VscFVRWE5DWjI5eVFtZEZSVUZaVHk5TlFVVkdRa0kxYW1GSFJuQmliV1F4V1ZoS2EweFhiSFJaVjJSc1kzazVkR1JZVG5OTVYxSTFZbTFHZEFwaFYwMTNTRkZaUzB0M1dVSkNRVWRFZG5wQlFrSm5VVkJqYlZadFkzazViMXBYUm10amVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRENrSklkMFZsWjBJMFFVaFpRVU5IUTFNNFEyaFRMekpvUmpCa1JuSktORk5qVWxkaldYSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZjMllqa0tibEZCUVVKQlRVRlNla0pHUVdsQ1Ewd3Zabmx4U1RaRk5UQk9RMmRzUkRWM1FXRTBSalpFY0ZWSlpVd3libXd3SzBwRmVWaEdibmQzWjBsb1FWQktVUXB6UW5GcFZVZ3lkbWRwUkZaaFQybzBWQzlHTW1acEwwOWxaV294TlU1UVoxUnZTVTQwYWpoUlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEQ2sxR1lsTnlLek5LTVZwMlpESmFibFUyTUhOUVN6RkxNbXBMVlZadFMxVnNUM2xDZDNwalNXaHJjR2RtSzBNNVNrNVRhREJ3V0Vjdk9IWldhbFpEU0RFS1dVRkplRUZOVjBNMFYxTTVkSGhDVDFwa2FGQTFjRXRFYXpBdlVqbDNTSFozZFRkQ2NGWTVRMjV2U0VoSk1WSXpiVkoxWTJFMlNqWm5UVVZpZDJwbFpncG9VSGs1YjJjOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663690068,
          "logIndex": 3615193,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091649919",
      "sha": "9934b4457b736b6e9e0d0bcd720bc23ad88b11c5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

