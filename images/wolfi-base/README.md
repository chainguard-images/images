# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:2f409349a5e062396e13a86bb6d5d765e39b711f1021c81508ab4a203794929f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2f409349a5e062396e13a86bb6d5d765e39b711f1021c81508ab4a203794929f) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:2f409349a5e062396e13a86bb6d5d765e39b711f1021c81508ab4a203794929f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "29f06d2841e1455793ec0cde2786807331b112ad",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDmvCvuP9dU/PfKpjWxGoGMW40RU144aVSPynG9LhCHDQIgaQf3Yoho0150lJksE+d2xPboeu2y2100xQWNePPqsmo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYWNkNzMwM2UyYzQ0MDllZGI4MjZhNjE4M2UwZjkzYjRiYWNmNmM4NjJkNjBhMGNlOGFkNzQ0ODExZjAwNjM1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRE00WU4xaGdpL0lrc2tFd1lMcUpGQVBnRkVDNDBTRW9tMTI0TW0xVW93bUFpQW9nbnhJTG1LQnNheE1ZenU0YlREb0trM2swWXNuYUpMcmRMZ2tUcmFIWWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnVla05EUVhsaFowRjNTVUpCWjBsVldHbEdXamM0Um1rek4zVjBjSFZxUkhkcVdrcDJVMHd4YlhGcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlZGbDNUbFJSZDFkb1kwNU5ha2wzVDFSRk1rMVVXWGhPVkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2VkZaSlVtNXBPRUYyWjNCRWEyaE5ZbXQxTVRGT2JWUmljMlJrYW1GUlZYUk5Ubm9LU0VsQkwwVjNibFpDU25kWlMwbGlhVkZEVWs1TllYRlRibTExT0dOMWFWQm9lbVl3T0VKb2NXVXpkRmxyTTFwelJUWlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIWW1sWENsZExTRVZNZUZoRlJsRndPRFJCUldwUU9GbGlUa2M0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM2xQVjFsM1RtMVJlVTlFVVhoYVZFVXdUbFJWTTA5VVRteFpla0pxV2tkVmVVNTZaekpQUkVFelRYcE5lRmxxUlhoTmJVWnJDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhVbkFLWXpOU2VXSXllR3hqTTAxMlpESTVjMXB0YTNSWmJVWjZXbFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWxyUjBOcGMwZEJVVkZDTVc1clEwSkJTVVZsZDFJMVFVaGpRV1JSUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNUlSRWN6VlVGQlFVVkJkMEpIVFVWUlEwbEdWSGQ1ZDBObWJTdFBhbmxuYTJ4eFIxWkNhVzVxZFZac1VIb0tSMk0yTm04NWVteExkRUpGVWtsS1FrRnBRWHByYTA1TU9GUmFXWE0xZERWUE1rOXVWRkl4UmpKWlNXWXdObmx6WW1OS1dWQk5kbTlEYWxWdFUycEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXVRVVJDYTBGcVFYTkVWRVptVTNCV01rSTNhMlppY2pKdVNUVnZabXhhTlZwSWEzSTVRVWQyTWpoa2FucFhOakJoQ2pCVE5ISTJPVk5rUWtaTVpEUkVTWGhVU2sxbVVuSnJRMDFJU3pGNFVYZ3lNQzloVkRBMmJUWnFXVWxuVkdNMlVHeFBPVzVOY0dsTU1YSXJkVE5uYzNnS2RITTRNVFYyUzJWa2QyWlVjMlJrVmpOemRuRnljbEpNYWxFOVBRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663344348,
          "logIndex": 3516900,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3069174597",
      "sha": "29f06d2841e1455793ec0cde2786807331b112ad"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

