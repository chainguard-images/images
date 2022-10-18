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
| `latest` | `sha256:c07ceddbf4aff43303f29250246692b8b89cf16b673f9bd974110627e2d0b2bf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c07ceddbf4aff43303f29250246692b8b89cf16b673f9bd974110627e2d0b2bf) |  |



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
        "docker-manifest-digest": "sha256:c07ceddbf4aff43303f29250246692b8b89cf16b673f9bd974110627e2d0b2bf"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e2c656bfc798ba05d0f4a32bd14330ad7c89cc42",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDnvFjqO2VOJs0ji3Mry3jhj3lUoaAg+3zJPwn8HDrtiQIhAIWwDf4E/o4a4EoNbvAsxyaOZheqS5+GplrjZlfVDMJu",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjN2E4NmYzOTViMmE3ZWViZjdmYjBkMWEyM2Q5MDBhNzdiMWJmZmRjMDVjMWI3MTQxMzE2NmQwOGM0Zjg1YzVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURwdWNNaUVSc1RFdjdMYWVkamxmZWVjU0tNSENvVGtPcjVkV2tuQ0RJMEpnSWdaaDZNeVRyRlZQL0tFU1FFQ3dtNFdmQjhXMXZHRGlBZ0JZVHBjNXNZbTRZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlFtdzFURkJvYUhWV1RUZ3ZUVXBEWTNGdFozTnhNV0YyTDJkbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFbDVUWHBKTkZkb1kwNU5ha2w0VFVSRk5FMUVTWHBOZWtrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6Y0RoSFdrMUdiRXQ0Tm1neGRrNHdjWGRXZUhFdlkyZzJiMmRVYUVzME5sWlFWRThLVG5KMGVUbFVSR3RLVW10NlozSm1UVEJOTkN0VFNVWnpObXRWUVVONGQxZzJRVkZRUTNSM00xTmpSVUZIVEZwaloyRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ2VVZoa0NqRk9lVTU1T0RnNWFWRkNiRkJoTkhWVWFsQTVXUzl2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUkthazVxVlRKWmJWcHFUbnByTkZsdFJYZE9WMUYzV21wU2FFMTZTbWxhUkVVd1RYcE5kMWxYVVROWmVtYzFDbGt5VFRCTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRaUFkzWXZRVUZCUWtGTlFWTkVRa2RCYVVWQmIzVXJja0pYZEZaWFdXZE9aMmd4Y0ZCc2VFTUtPR3d2WkVFNVFVdDJXWGhXWVc5UFUyRkVLMms1YUVsRFNWRkVjVGRTUmtGMmQzQkNPRlJNVlZKSldqWjNWRlp3WWxVMGJHVmtjbXBMY2tNeGFGZDFiQXBvTW1OR2FucEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFXY3lUVUZ2ZERoSldEUXphbG93Vld0V1IzTkpVa1ZTTUZoRGFtTkpkazQwQ2pSVVJEQlRURlpWZUVWcFltVldhMmR4UmpZeFVrRjRkRkJPTWpKM1Z6ZGFRV3BCSzNwRUwzaGhlSHA0ZUZWaU5UVXpSV2hEYURWTVMzRnJWazRyUWxBS1JIVnBNbko2U3pWNmRTdE1OVGROWWxSYVVYUlpaWGxrY1hNek9XVjJlVVZaWlRnOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666059809,
          "logIndex": 5320197,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "e2c656bfc798ba05d0f4a32bd14330ad7c89cc42",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270125480",
      "sha": "e2c656bfc798ba05d0f4a32bd14330ad7c89cc42"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

