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
| `latest` | `sha256:e968c0e2b42fbabae1f09bac099c262da04952a3f60f9e7beba9ac4285687a66`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e968c0e2b42fbabae1f09bac099c262da04952a3f60f9e7beba9ac4285687a66) |  |



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
        "docker-manifest-digest": "sha256:e968c0e2b42fbabae1f09bac099c262da04952a3f60f9e7beba9ac4285687a66"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "7b16fb12a8ddeca0d05c6b13d54a33ab0340c7b2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEoLkV5LyYzGuMJOFZ5elemBxSP2b+PDHbMa4uo8/KgWAiEAoitwjjh4zOVAEI5Lz0Nq3VkPzKbaopdpoaNmK7h9OYQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMDRhODEwODc3YzBkOGEwM2M4MDg0Y2ViYmQ0YmY3NDhiN2IyOTNkMGZhY2Q3ZGY3Njc0MzRlNjI5ODQ3YTMxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ0J5cHFiL0VLeFB4RW93ZFpQWlIzYWMxQ09OVzVVQ0Z3R2Via2lNcGlndUFpRUE4OVVYdEo1aU5nOEhxempNNlkybkRQSDExMSt3aDRjUEFZcUVOeWhiUDJVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVlZrdE9WbWt3UzBsa1FUUjNVa3N6Um01dFpuTjFjMlJGTlhkVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUMVJCTVZkb1kwNU5ha2w0VFVSRmVrMXFRWHBQVkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxV21GRFdUSlhOMnBVUm1OeGJWUndWRUpUUlZoVVlscEpjVGtyTkRRckt5dFdaV01LWVdWa2NIQjRaR0pOZWpWV1lucGhhamc0WkVjMlVXbFhaakJTWVVaSlZIcDJiRkZZYTB4MU9XZFpZMU5rYTFOM01FdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUVjNRdkNsWkVkRnB4UjB0TFpHOURRemRtZEhaT04wTTBNR3MwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaek5aYWtVeVdtMUplRTF0UlRSYVIxSnNXVEpGZDFwRVFURlplbHBwVFZST2EwNVVVbWhOZWs1b1dXcEJlazVFUW1wT01rbDVDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU1uQnJZWHBCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM1FVaHJRV1IzUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQlVRMVUwU1VGQlFVVkJkMEpKVFVWWlEwbFJSR3B1UkZoSldDdEpUVUptUmpKVVEyWm1WMEo0VUZaNFMxSUtMMEp6VTB4cVNXbG1WRXBoYlVoR1FrNW5TV2hCVEVoTVduSnhjVlIwV2pKdE9GVjNNbmhTVjNsWFJrcHBhbEJSYlVkVkswTXlTbkJpT0daUlowOW9Rd3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVU5tUWpoa1dWUXdkMHN4VW05VFprRm5NVTh2UmtzME9WVXJRVTA0VEZoQlVHNWhSalJsQ21oV2RHOW1ORmh6Y25wNGFVeGFRV2hCYjBsNk5WWnZORUZzWTBOTlJuVXhjVzB5V2toeU1rRktaR2R0UlROSE0wZHlkRWRwVFdGV1kzaEhWRTUwZHpFS0syUklkVGxtSzJ4NE5HYzNSM0EyVWpSb2RVdGpVMlYzTkhkYVdYUkJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665692946,
          "logIndex": 5049732,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "7b16fb12a8ddeca0d05c6b13d54a33ab0340c7b2",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245457014",
      "sha": "7b16fb12a8ddeca0d05c6b13d54a33ab0340c7b2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

