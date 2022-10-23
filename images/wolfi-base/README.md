# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:59bbe2014ac3a957738a0b76702787c0e50882cc6bce60992383d23d4a9024bb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:59bbe2014ac3a957738a0b76702787c0e50882cc6bce60992383d23d4a9024bb) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:59bbe2014ac3a957738a0b76702787c0e50882cc6bce60992383d23d4a9024bb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b8eda0d949e7f5ee0837570697f6fd5ca72c6e9c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDN9zhZGhh/W44z6ZSjH47+5ZFEKgV0aYFc6MKLbCzFogIhAIAE1gGsdmpdwSX/s2z6PSYH6wFlOpirKOKE8zAulOc4",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmOWNhMjY1NTMzMjQxY2ZlMDdiMGQzYTRhNTY1ZmY0YTdkOTAzYTg1M2M1NzU1Y2NlMzhjYzU5MWM3YWYwOTJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR1dyZzc1cy91eXVYZzkrMjVHM3RDSkFEK29xWWdZQUhnWWJNTTBXcHMvcEFpQnZLUjhrSXNxU2lpd1VsL1lNSlVZWEJodnc3Si9BQm5kSmphSkN3SnROdVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlN6TnNWRUpzZW5VMVIyOVFhVTA0YjNKMVZ5OUhXa2d4UVUxQmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFVXhUVlJCTUZkb1kwNU5ha2w0VFVSSmVrMUVTWGROVkVFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXSzJkVVZsQmxTbWMwVUU5RWMxZGtNR1ZqU0ZkSE5EUnZjVzF5VUhkR1dHTlBkMklLVGtkWlNFNHhRa28zZEVWTlpXOTZlakJOT0V0Wk5GZE5Ta0pFZUV4MU5EUjRVWFZtYWxkbFFVeENlVEp2VlVGR05IRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEYW5KR0NuRlhTMXBqTkdSUGNHcEZiMnB3VVU1UVFXSXZOaTlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwazBXbGRTYUUxSFVUVk9SR3hzVGpKWk1WcFhWWGRQUkUwelRsUmpkMDVxYXpOYWFscHRDbHBFVm1wWlZHTjVXWHBhYkU5WFRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGRGFWWkNURUZCUVVWQmQwSkhUVVZSUTBsRFNIUUtVVE5aTjFFemVuWTVXVlJXYzA5TlozWnFWMnhEVmpSTVVqWmlOMGRTTnpoak9XRmpkV3RrUkVGcFFWcE1ibmQ0WlRSTFdqbGtUVEYxZFZGV05FeGhNd3BDVmtWSlZWWkhlV3RVV1RsdFZEVXlXVkp4UVdkcVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUWxKVmRFaDNUR05WUTJSWlRuZ3lZV1JPQ2xKcVZYVk9SVTVEYWxWVGNrczRXVWhEVW5sRldFaGFiM0JCU1ZKcWNrdDNVVXRYZURCRVdFbFVMM2hUWkRsM1EwMUZURFV2V1ZNMFZrc3JZMUIwUjAwS2NqWjVWbk5HZVhOQlFXUjJVRXR5T0drd1l6RkJjV1JxUzI5NVUxVndSMWRqUjFGYVN6TkhWREowYjBGQ04yOVJTMUU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666489869,
          "logIndex": 5672239,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "b8eda0d949e7f5ee0837570697f6fd5ca72c6e9c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305434584",
      "sha": "b8eda0d949e7f5ee0837570697f6fd5ca72c6e9c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

