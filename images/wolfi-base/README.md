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
| `latest` | `sha256:52d2616139ebf951f3707643c0f0d5a02a62b5089538c71e06b4929973fd00fe`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:52d2616139ebf951f3707643c0f0d5a02a62b5089538c71e06b4929973fd00fe) | `amd64` |



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
        "docker-manifest-digest": "sha256:52d2616139ebf951f3707643c0f0d5a02a62b5089538c71e06b4929973fd00fe"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dd4f2b0f4364a703aca4423325c370e0143e2f51",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCAgqPpAOAPL+L1+REoMwZ4WV8L4POTVGvYVkRE02mAVgIgW78DTbRmZp6My1BO1Yycvz8nkh13I7C1I1pkPkXjetU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzMjJjMjA0MmU0NGJiNWEwZDhkOWE3NTVlN2ExMDZjNWE4NTM3Yjk0OWFiYjNkZGU2OGVmNTVhYzAwMmMzMDU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURSZlQxVlpQbmkzTlg1UkwvcXBBaU9uSkxPMkliaStJcW4wUUtxbzB3amJnSWdNZTNKaE5MOTVFZEJ4QWdPMittV0lnSFFpWGlHd1BqU3Jja3l6QmZHMHdJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlRrcGljMkZpYkV0SmMyaFZaMGxaYjI1TmFEUjFSRlEyTmpGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFbDNUbnBCZUZkb1kwNU5ha2w0VFVSRk1FMUVTWGhPZWtGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5U1drMVMybHljVGRsYTBrM1YxZFRWa3hOYld4U2JrVnFkMlJ4SzJocVJFaGhNVThLWVcwclVXWlJTR1p5Tlc5T05HOXBjMWx6YWpCSGRVWTJkMkpST1VKWmFuRTJWRmRsZVZSamMxSlVRWGc0YlhKSE1EWlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKUTJ3eENtVmtPVlp2VG5GWkwxbGpiRlZUYml0amVESnRSV0U0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxSnJUa2RaZVZscVFtMU9SRTB5VGtkRk0wMUVUbWhaTWtVd1RrUkplazE2U1RGWmVrMHpDazFIVlhkTlZGRjZXbFJLYlU1VVJYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCVlVIRXpNVUZCUVVWQmQwSklUVVZWUTBsUlJIWUtjVEZHTDI5RGJsaGtTMWxoTW10NmQzcEhUamMwTjBsdk1VZFVOVzF1V0dNMVdIRXdMek15YjBSQlNXZGlSbGRtTkZOQ1JWSlhZWEp4Y0V0blJYWlFUQXBRYTJsMVRsaElURXBUY1ZWNlNtZFdPV0ZyU0hOYVozZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlNrSm5WVGhVVUVkS2RrbGFPSFU1Q2tkNlNIVTVTMVJTZEVoaU5WTXZXVTVLYWxWdlJFTXhObWR0ZDJKVmNVdEljRmRZWlU5UFpEaHZaV2xRTVRrME1qTkJTWGRFTDJkUVQybFRVM1JEVG1rS1ZqZHdXR3hIWVVWeGJVUm1NVEZJYVVwVE4zUXlVQ3RDVDFsVVkxWXlWM1F6TkVSaFUxVkRURkJSWldRM2IyNUhWbFk0ZHdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665713225,
          "logIndex": 5064958,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "dd4f2b0f4364a703aca4423325c370e0143e2f51",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246950995",
      "sha": "dd4f2b0f4364a703aca4423325c370e0143e2f51"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

