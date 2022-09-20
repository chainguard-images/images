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
| `latest` | `sha256:c22fec3cb84a004e7abddf759bee1e67dd04edc32d6f1bc749de2925451a76eb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c22fec3cb84a004e7abddf759bee1e67dd04edc32d6f1bc749de2925451a76eb) | `amd64` |



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
        "docker-manifest-digest": "sha256:c22fec3cb84a004e7abddf759bee1e67dd04edc32d6f1bc749de2925451a76eb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "332be3137071293ee6d7d6abe09eec43154ae500",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAfhuVC3zoJ/gHPTHlnWefGsNPkjpekxyw6UE/m8ip6lAiEA+n2WBR7IyxZxHbuuO0gvLQgtlYC4QPUIDa4p8RpK4lE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4OTg3M2QzMjk1MTY3ZjlhMTdhNzIwNDViMmJiMTUxMTU0MjBlNTFmODljZTg1ZWIxNGZkNmM2ZjA4ZDJjNjU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNONDhHY2dBY2hNZEQxVTFZQWFWTzZBaThTcFRQMHZZSDhZTXJGZlJkS2V3SWdKd1hFa1pqR3lubno0cmx4NU8xOXB3ZHo0VVBOYW1yVXE3azN0Z3R1TlFnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsbFowRjNTVUpCWjBsVlRUVnJLek5ITDFOMFJFOTVURlp2T1V3MFVFbzBiM1EyYWtwdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZFVXhUa1JKZWxkb1kwNU5ha2wzVDFSSmQwMVVTWGRPUkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4VEhvNEwzVnZPRWhOV1doamRUaEtTa0kyUTFCUlJ6SkpZMjgwYW1ObGNuRTFiWG9LTDNGd1dHaFlVMHN4VFhWVmNsUXZhMGhoTmpKYUx6UkRiRWhwY1RKdGRVcEdUM2xsZFdKbFdsZGFTU3M1ZDNab1owdFBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZFTDJVeENqQkZVRXQwVFVGUVNWQklkMEpUY2xveU5IbFFlbFpyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM3BOZWtwcFdsUk5lRTE2WTNkT2VrVjVUMVJPYkZwVVdtdE9NbEV5V1ZkS2JFMUViR3hhVjAwd1RYcEZNVTVIUm14T1ZFRjNDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhVbkFLWXpOU2VXSXllR3hqTTAxMlpESTVjMXB0YTNSWmJVWjZXbFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWhkamcwTlVGQlFVVkJkMEpJVFVWVlEwbEJiak41YUZwRlMxbG1lV3RETm5VMGJTdDViMWNyTjFOMWMzZ0tUalpIWlRNemRGSmtWVmhwWVZsR01FRnBSVUZ0YzNWcmMwSnhlVXBGTkhoWVR6aFNkQ3ROZDBaeGNVMXlWVUpLWlhob2FVZ3ZXVkJwY0RSWVNFOUZkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVXbmRCZDFwQlNYZFJVbGRCVVdaREwwSktVMFJPYmxKdWQwUmhiRE53WkZoTlpGazNURmQ2ZG5SV1JUWk5TVkpPQ2podFIyZDFVR2wxZEVSUk5HcHNXQ3RMVFhWVFNsaGxia0ZxUW13eFZYUnVUWEFyTWxBNU9EWkthVmRTYnpoUVIxWXdiME5hVEU1Wk1IVlpWbHAzTTNnS1pUZGtOa1JFWjNSdlFXTlZXRUZKWVU5RFYxTjVaM1JhUldjd1BRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663674867,
          "logIndex": 3603168,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3089889285",
      "sha": "332be3137071293ee6d7d6abe09eec43154ae500"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

