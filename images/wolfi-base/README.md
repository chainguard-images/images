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
| `latest` | `sha256:d2b2d864666387f8db6fff79307dbf50a25d2ff567f1878416f20cff49d7c98b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d2b2d864666387f8db6fff79307dbf50a25d2ff567f1878416f20cff49d7c98b) | `amd64` |



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
        "docker-manifest-digest": "sha256:d2b2d864666387f8db6fff79307dbf50a25d2ff567f1878416f20cff49d7c98b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "eac6c44a978b09f41894a51b3527f80b814757a1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDLDIeo0KfsvgKaBJutoYMRTIU5L45Kbll9Wx9VlI7EEAiEA328d7tnKJiJc8IXybBGXi/wIV3+YgI/PU8/kZyUCVWU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYjlmMzY1YmQ3MTY0MmU4MjllNzI2YTIyZGUyZGNhYzIyMjFkOTZjMjUxMTg1MDlmZTQxMTI4ZTFkNGE4ZDY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNDQW5qTnRLK3VSczAwRklTUXJJR25wUzJrNytDVUdxWWVMb0FXOFBtZnhRSWdCQXM1M3hseFlQSndrM2lPNTBSQ2JzcWE2MUZRYVRMcTJhQjlVQzZpYjhvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVllYSlNVVGR6ZG1nMWFtNXFXamhtVkZGaFFXMVlUV1pvTVZScmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGVjNUVlJGTlZkb1kwNU5ha2wzVDFSSmQwMVVWWGhOVkVVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCV25GcVJtRlFaMHhwUjJ0VFRFbEZTMVJNYUZVek1qbGxRWGhYY2tkV1kwNUVSR3NLUjFKTmNqUTNaWEZ2UTBGTVkxUnhibkZtVkZSS2R6QlllRWcyU1VKQ1NXNUdkVmc0U0d4ellqQjFSSGt6WnpCcFJYRlBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTUnpnd0NuZGpjV0Y0TmtkMU9VVnhNa293VkVGVU9TOXdRemd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR3haVjAweVdYcFJNRmxVYXpOUFIwbDNUMWRaTUUxVVp6Vk9SMFV4VFZkSmVrNVVTVE5hYW1kM1dXcG5lRTVFWXpGT01rVjRDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhVbkFLWXpOU2VXSXllR3hqTTAxMlpESTVjMXB0YTNSWmJVWjZXbFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWlZWFpZU2tGQlFVVkJkMEpKVFVWWlEwbFJSRTFoVFZsU09GZFBNRXByUTJGaU5YWjBSVXQzTVVZMlUzQUtkRVkxWm5aWWFURnZUMjB4TWs1WVNVWkJTV2hCUzJob1VIUnNOWGg0U1doM1R6ZExNamRpWW0xQllXVTBZeThyZDNWTVJsbEdNMFpzTUZjMmRqTkJaUXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5SMW9yZW14MksybHJabEUzU2xjeU1VMVdXbFF6VlRKWWRWUklkako0VlhsRVpHcDFhRXcyQ25wamFsUmxNMmx1VTJ0RlJUaDZSRVIwYTNkNFRFaHNjRlZuU1hoQlNqTnRkek5zU1hoek9Fb3JaM0Z2TWs5YVp6ZEdkVXRSUTFVeGFESnJjRkZqTVdNS1psSXJSbmxtVkZONVFVaFBRbUpLY0RFd1pYQkdiVzlqVUVGQ2RWRm5QVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663686087,
          "logIndex": 3612086,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091190432",
      "sha": "eac6c44a978b09f41894a51b3527f80b814757a1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

