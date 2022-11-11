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
| `latest` | `sha256:4575ff7304e220020f9025e4c767c56db4b91e691e9a1750f5bd4ef04b3a55c0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4575ff7304e220020f9025e4c767c56db4b91e691e9a1750f5bd4ef04b3a55c0) | `amd64` |



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
        "docker-manifest-digest": "sha256:4575ff7304e220020f9025e4c767c56db4b91e691e9a1750f5bd4ef04b3a55c0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c14231788850af334a1a116ae934bef039eeed67",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDJhhZzfQke0vMe2gfIMEOhqTEiIHNk+ypfLyBXI4gnjwIhAP38nBEBnizC5XMa9ZsWGVbw+4GmZk0WcGJgZfSTHdNo",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNjA0MTUyZDczOWI1YmYxMzQwMjVhNjgxNGM2NDhkMGM5ZmMzYWY1MTA1Zjg2YzJhNzViMzU3YTMwNjc4NjA5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSGdaUlYzMWdGTFdJYVFTZnZoeGYyTFpUTjdna3ZRNFp6eWFpRVl4YXR0OEFpQnBKM3NSVFZvL3ozSkdqeG4rU04yZEJlWW1PeHY3MHRha216NENESEJMU2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVllWSjNTMGxzWkdaaloxQnhRbVpUU1UxSGRXSmlibVpKVDBwbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFVjZUbnBWTlZkb1kwNU5ha2w0VFZSRmVFMUVSVEJPZWxVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwWlVsMlpUTmFUbTVFYTJ0RFV6WjBhWGR5V0VsYVVUZ3hiQzl1TldFM1YzRkpiVFFLWW1wNE5GazFVMVlyWkdndlJUTjBObkk1YjJwVFdFc3ZRV0ZwWm5CdE9XSm9OMEp2VjFndk5GVTBVbFJXTVZremNIRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzUXpOb0NrMDVkbGR4VURSU1VuZEtkbTEwYjBWTmFIaEVjV0ozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwMTRUa1JKZWsxVVl6UlBSR2N4VFVkR2JVMTZUVEJaVkVab1RWUkZNbGxYVlRWTmVsSnBDbHBYV1hkTmVteHNXbGRXYTA1cVkzZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKclZtbHNlRUZCUVVWQmQwSklUVVZWUTBsUlEyd0tUR0YxTDJkdk1YaDZSV3MxVTFCU05HYzJNak5YV205c2NWUnBjblpWTUhRNVpqZEpPRlZVZG5KQlNXZFJhRWxGVlV0bE1VUlVjRGRpUkRoaFpVRXJZZ3B3ZDFnMGNsaHlha1lyUWpWT00wWnlSR2R1TDBaalozZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkU2RVMXhTbkJ2TTBWd2NXdFBiQ3RzQ21KaVFYRkZUWFJzSzJwb1MwSmlOekp0WjBSYVVYUkphV0p4VGtKYU9IQnBPSEpqU1dkbWVYUXhLMk5oT0V0WWRFRnFRakoxTUdWcmNWVlpkWEpvU0dvS1pURTRVRTVLZGpSb1NqZEpVR05hVmxWR0wyOUpLMUpUVUVsclFUbHBaWFJJTjBVemMyUTFlalZVTVcxMGN6aGFWWE5SUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668130685,
          "logIndex": 6849500,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "c14231788850af334a1a116ae934bef039eeed67",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441813678",
      "sha": "c14231788850af334a1a116ae934bef039eeed67"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

