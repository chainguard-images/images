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
| `latest` | `sha256:a5f85cc544880725532c859b9df6548d1e3e37ad45079b14b8331f62698582e0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a5f85cc544880725532c859b9df6548d1e3e37ad45079b14b8331f62698582e0) | `amd64` |



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
        "docker-manifest-digest": "sha256:a5f85cc544880725532c859b9df6548d1e3e37ad45079b14b8331f62698582e0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "eb388b2d3cfdcb61947fef145b255cfa05799f8c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIByCFjisPS7jnn7SBq6/+C4ke7ja/JpNBuHKGyPjd6RMAiA8MlIPNrSU3WhQym5t0QP+zlNskknBvgBZVSzJj5eQDw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YWVhZmYzMzI1YzU2NzkyY2Y1NTc4OGE3YjM5MTkyZjljNGY0MzBmZmE1NjZlODY3MjJiNWE4NjY0MWZmZWU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNNdDNEbVVUMHJSOTFnSHZnY0pBbkxIUm5vbVFvbEp3TVR5K1FOTzRZaGpRSWdSZy9QTVJXZ3U3Y29GU25Hd2FjNzlsekxJSGtGZHlmcWFvelZLRTR1Nkx3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVldISlVMM1ZsTDBrd2VuUkhMMjlPUzBoeFEwNDJaRWg1VFhSamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVjVUWHBKZUZkb1kwNU5ha2w0VFZSRk1VMUVSWHBOZWtsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2WWt4Q1NVTmhSM014T1doaldqRkNWRWhTUkhsbU56aEphV0U1VkZaMEwzaEVjVTBLYTBSUVp6azNSazV3ZFZOU0szTXZTMDFrU1RKVE1rWlhTME5hWXpOVlFuQXJLMlZwSzNwQk5ub3JjV2c0VG00MGNXRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1T1U1TENtWnBjMXBpZERCRlMyMTJUWGRJTm5KNlQybGFURGRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxWnBUWHBuTkZscVNtdE5NazV0V2tkT2FVNXFSVFZPUkdSdFdsZFplRTVFVm1sTmFsVXhDbGt5V21oTlJGVXpUMVJzYlU5SFRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNSR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZJME5HcFRkRUZCUVVWQmQwSkpUVVZaUTBsUlJFa0tORkZrWVZJdmNEQmxhVTQxYmxremVIUldWVzB2V2swMWRGbFNaVTl5Ykd4dFkweHdjV1JQY0RGblNXaEJVQ3RYZHk5UGJrSkZSVmhxVlVkTlNWUm5Zd3BqSzNKbk1UWTBUWGxEVURoRFQzaE9lV3AxT0ZWMWRtaE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlEzbDNPVWc0VkhwdVowUjZlRTFSQ2k5VlMyVkRiV0lyVjBKcFFqTTVSbGgzWW5WbU5XWlBRMlJhYlhsR1JFSlpPR3BNYkd0V2VWQkRlRzEyU3psVFVFNTNTWGRGYTJ0cFNVNW1ORFpyTW1zS2NWVnpNazh6WW05ellTOWpRMFJhWkZSaEx6VmFVRFUyVENzeWVtYzNLM0JoWlZJek5tMXljR001VUV4WlFXbEdXVk5uU2dvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668475409,
          "logIndex": 7094411,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "eb388b2d3cfdcb61947fef145b255cfa05799f8c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466613344",
      "sha": "eb388b2d3cfdcb61947fef145b255cfa05799f8c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

