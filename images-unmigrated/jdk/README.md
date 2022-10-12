# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:f722a86b1cbc04ec6de29792cb3d561fd32a83a92155d252178fb80bb3f2474b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f722a86b1cbc04ec6de29792cb3d561fd32a83a92155d252178fb80bb3f2474b) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:f722a86b1cbc04ec6de29792cb3d561fd32a83a92155d252178fb80bb3f2474b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "b9d5f3d8b43d3257bd5eaf380b177e9b7efdd0d7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCVeQYzVVYO6B04fbP5dwLWRlnMh48CvdEMCaS3pgtqJwIgWme+RNuKdOp6d+NnYxpcmOASCkGC6TvdY6XsUBnHfUk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMTc3OTYwNmVjMGYzOTk1MjI5N2JlN2Y3ZmIxNjBjNjIwMzBiZDM3YTZkMjg1MDU0YTZlYTFmYjk3Y2Y1ZjZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURmbFZXU1pTZER5V0VLQ0NIRFF3ZVhycXE1VFVCT3czTDVrblU3dFFneWxBSWhBSmFDNEp1aG91c2Fobi9zSG5aSk0vQkNvK0ZzTWtQYUFMeVp2eVRTV0VNRiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhsbFowRjNTVUpCWjBsVlJUWnNOV0l6Y25GelNXUjROVGhPZUhRMGJUZHpNVFE0VW1sQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHdDVUVlJOTVZkb1kwNU5ha2w0VFVSRmVVMVVhM3BOVkUweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0TDNsNFZraFpOMWxRTUV4QlJuQmlVSFZyTUZKeVVIZEVRMmRRU2xjdk5uaGFVRFFLYVhkbVpYSnJaMlY2Y0hOaFpsWnZOR1ZYYkZGRlJtNXFZMDR3ZDBWeloya3dSSGxNYUM5d1FuSnBSMmxzVkdsM1JqWlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzWkc0NUNrMUNNelF2WTJrMmIzSkdiSFpZWWxsRk1ITnFPU3M0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhR2xQVjFFeFdtcE9hMDlIU1RCTk1sRjZUV3BWTTFsdFVURmFWMFp0VFhwbmQxbHFSVE5PTWxVMVdXcGtiRnB0VW10TlIxRXpDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQk9jRk5PUzBGQlFVVkJkMEpJVFVWVlEwbEVOblZzVlRkaloyaE1NRTFvVGtONVdGcFVaM2hPWTFCTFFqRUtTWHBIWlhkTFNYVnRlV1l3YjJ4M1RVRnBSVUZ3ZFVweE1WUlZOamcwVEVaSUsxSjRNMnhUUzA1dUwyRTBla3NyTm5WMGJVeFlOazlMYWpWc2RIRXdkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVkZCZDFwblNYaEJTVXR2WTBWTk5qTTFTVVo1T0c5Rk5tNUhUM2xoZWxsb2FVTnRSRmhvVGpkWGFUWjRNSEoxQ2xsMVEyZFZZbVZUYlZSdmIwNXlWVU4zWTJkbVQxTndURFozU1hoQlQzY3dSSGhTYnpKU01sVXdPVWQwUTJFeVduZG5UWGs0WkVOQ2RUZDRVMFV5VEUwS1lWRmtVMUJMZURWQ1JHZGxVRWRuTDFsc1ZGZGhOak0yV1U5WE5sbFJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665602496,
          "logIndex": 4980913,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "b9d5f3d8b43d3257bd5eaf380b177e9b7efdd0d7",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3237285721",
      "sha": "b9d5f3d8b43d3257bd5eaf380b177e9b7efdd0d7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

