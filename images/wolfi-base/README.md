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
| `latest` | `sha256:bf62e7dc0fab4c02ebaf4265648301e8c2bac1a66463289e38bbdbb4c5ad5318`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bf62e7dc0fab4c02ebaf4265648301e8c2bac1a66463289e38bbdbb4c5ad5318) | `amd64` |



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
        "docker-manifest-digest": "sha256:bf62e7dc0fab4c02ebaf4265648301e8c2bac1a66463289e38bbdbb4c5ad5318"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "de5cb1fcaafe9b2e4c4018434f825f52e80a63af",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICqSLegkNlTB7wTj3Ey6mqjouu/qv1ZrN4GlHcvdkjBsAiEAiCmS+KB7EVZX2PKo0I2TUcbozMLuzjjoYh1igxFdPFU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwOWZhOTFjYmM2YzE1ZmNiMDliNzJkNDkyOTUwMjU4ODAzOTJlYjIyOTEyN2Q0NjlkMzE4MmRhNDUxZTQ5ZjM4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQUhBZFByLytPd2FTTDBVVlRvdXQvZHEvK1h6Wm85eGRxSndmYzVRMEdGaEFpQmlNSWo1YUVNT3kzNlN2MlZBekR1N0RaRXpYZk1EV2hLTVNyVUZrQXY0M1E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlJHWTVNRmRQTUVKb2RHMVFVMlJCVFhsdGN6WnNNVk5GYzJacmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFVXhUVVJGZUZkb1kwNU5ha2w0VFZSQmVVMUVTWGROUkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VlZkU09IUnpSVmhwVFdSeVZIVlhjbTFMVFhKVVpWcExaVElyUlN0YVRVUlNNRUVLU0ZOVFoycGpMMlZEYW1zMlJVcFlMMUpTVFhOdFQydDRaa0pTZEVzMVNsbEZZMU5LUTFNMWFXUXpMMFl5TDNwWlNIRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyS3pnMENuSjJRa05vVmtFeFZubEpSMHBETTI1eWFraENNQ3N3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxSnNUbGRPYVUxWFdtcFpWMFp0V2xSc2FVMXRWVEJaZWxGM1RWUm5NRTE2VW0xUFJFa3hDbHBxVlhsYVZHZDNXVlJaZWxsWFdYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZFeVEwSnFVa0ZCUVVWQmQwSklUVVZWUTBsUlExTUtiMG8xYTFoeGNIQnhZVGc1V210eFlYWnpNRk4zTUZrMWFraFVabkJtWjNGU2RVTmtWWEpaT1dGblNXZFBhVE4xVFVkTmNsRkVTMmN2VkVOalJXSklhQXBNVWpSSFpFUkVjMlU1Y2xkeVoxZFVWRGRxVVdGbk9IZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkS1lsUk1WM05CVWxSaE1EVTNiM1ZxQ2tFNFZWVkdiMGxwVm1wMVkyUk5iakZ4TnpGdVNuTkNibGh0Vml0alVWTklMMjE1TmpGUlRrNXBZVTVuU1RFMFowRnFRbnBRY0VGUlpHRndNazE2UzJvS1VGWlpiMVZEVkZkcWJFVnNkSGROZGpZclYxUm1WVmRIVkdWWFRHUmtNVmsxUkhwc1VWazJaVlIzYzJaTFExRlhaMnBGUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667353815,
          "logIndex": 6326170,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "de5cb1fcaafe9b2e4c4018434f825f52e80a63af",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374246306",
      "sha": "de5cb1fcaafe9b2e4c4018434f825f52e80a63af"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

