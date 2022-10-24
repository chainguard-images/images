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
| `latest` | `sha256:f3d71429fb56e79e729a9ca23e7018497af883a9ed3c55403247ee4bedd5a0f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f3d71429fb56e79e729a9ca23e7018497af883a9ed3c55403247ee4bedd5a0f6) | `amd64` |



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
        "docker-manifest-digest": "sha256:f3d71429fb56e79e729a9ca23e7018497af883a9ed3c55403247ee4bedd5a0f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e8d4458441c8e08191a815cdd5c644f4e0c5b613",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD/5Onzpfq3h7SOVBXoXRurq+59lvHTrCBrdokSWQz22QIgDYL7uxmskWan0jAqJulyK1qkC5B4leTPkvva0qk6/L8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzZTUzNGQ2NTZjNjU4MmQ5OWNmMDE5YTNmZGVlM2VlM2QwNzhjYmEyYjVkZjQ3YmZhYmY4MDRjYTQ1NzI2NTk5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQkEzQVNEbWpoUnhQSFF5QldqRHdaZ2xrcERuRkNUbVFwTHJSR3NDd2NtSkFpQk43SzBaR0lSVVg1bHNRUjQyR3FmT0FhWkhPM3ZWaWxYNzlxeGllRE11ZUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVldVNWlkMU4wU2xjNE5VbzRia3RUVVdWSFZUYzRNMGhoZGpadmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFbDNUMFJGTVZkb1kwNU5ha2w0VFVSSk1FMUVTWGhQUkVVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1WWxWS1MyWkdUM1ZwZDBvNFkwZzJPRmMyY3pCUldXdEdaMkZTTTFwM1pHaFpLMVlLTVdsNU5ESnViM1F2UkZGeVZXSXlUMmRHVVM5U1dVdDRSVXd6UTNBclFWVjFORWt5TVhOeE0zSlhjVWxxTkV0QmQyRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVYzA1VUNsVlZiMlZaZDJaUFVIVTBLMlJVVFUxU00zaHJZblp2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxVTBXa1JSTUU1VVp6Qk9SRVpxVDBkVmQwOUVSVFZOVjBVMFRWUldhbHBIVVRGWmVsa3dDazVIV1RCYVZFSnFUbGRKTWsxVVRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGSWRqSnJhMEZCUVVWQmQwSklUVVZWUTBsUlF6UUtiemxPTDJ4amJHTTVMM2hEVXpSS2VHNU5RMVUzTldWRGRscDNaV2hTWWxsclVEUnRjR05VTTNGblNXZEdURTlEVlhRemFHWlNRVWR0UlhkcVdHc3hXQXBoVEdwaWRWRmFWSFl2U21SWGJVMXRaMFpTZDNOWlVYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkSVozUmFZMnh5VlRGSFJUWnFVU3N3Q2s1TVdVeHJiMVJQVDI1RlZrMVRUMHRUV2trNGMxUm1TSFpSVUhCUk1tc3libk5XVUdoWVVIUmpjMmN5Y2paYWNVRnFRV1JPV0RkMGQwWTBOR1Z0V0RBS1puaFRhMmR6Vm05VU4zSTRVMFVyTVV0S1RVRmxRak5HYkRJeE1HY3lSM0JqVkdkNmNVTTJaWGN4TkZCRVVtOHZiSEZaUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666577301,
          "logIndex": 5733014,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "e8d4458441c8e08191a815cdd5c644f4e0c5b613",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309494951",
      "sha": "e8d4458441c8e08191a815cdd5c644f4e0c5b613"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

