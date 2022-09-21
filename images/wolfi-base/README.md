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
| `latest` | `sha256:02e04a94d1410de1b2960846b29106ba18a00c4d6f040e9d0e3049093788e353`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:02e04a94d1410de1b2960846b29106ba18a00c4d6f040e9d0e3049093788e353) | `amd64` |



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
        "docker-manifest-digest": "sha256:02e04a94d1410de1b2960846b29106ba18a00c4d6f040e9d0e3049093788e353"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f5f704f35ce14657fb44f86ee1d6758be208fdbb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCl2JJpCD317ZFCQ4Ms6H/qI2+jvqTH1bRqFBINEpK5tQIgD2dTWrVTF5E+8OB6B6RNlTmvwWDfgKVDk9T/N5oBki4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYmFhZGU3MTMxODkyMThiMTQ2OGE0NzEzNmZjMzEyOTk0NDE5MTg0N2EzYWNkZjBlMWUxN2ViNzllZWU4YzRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM5RnZNOWlYQjliMktRdnI4WFVMQUwzdXlCYXp1UFBpd1hMbVQ1UzJMYit3SWdmRENtOERqRXJaTDdqeFpzVTRXNHZvRzR3ZDkrcFJ0YXRaSy94d2RrL3BjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwcFowRjNTVUpCWjBsVlR6RTViQzh4VjBkWFNrTXpOWFEwYjJoeFdrUjJURkJTV1d3MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFbDNUbFJKTWxkb1kwNU5ha2wzVDFSSmVFMUVTWGhPVkVreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSZERsdlZHMUdXV1pKVlZOVmRGUkRiamR2YUdseU9XZFVhVFJVYlU1cGVVc3hVbWdLZDNOSFIzaDRlRFptUm14cllra3ZObXMwWVhwMVVHWTBNMEZEZUZKbWVFNWtabFZVZDNFNUwyaHJTakZVVlZrNGFYRlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyWjJ4YUNrTndOa1ZxUzNKclNYUjVOVmRVWm1GcVNDOWtiVVZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxa3hXbXBqZDA1SFdYcE9WMDVzVFZSUk1rNVVaRzFaYWxFd1dtcG5NbHBYVlhoYVJGa3pDazVVYUdsYVZFbDNUMGRhYTFsdFNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U1a2VYWnVja0ZCUVVWQmQwSkhUVVZSUTBsQ1NrZ0tVbEZ3YUdoalMwcFVVRUV4WVV0Qk9HeFhSR3hITkRkSksyMWFVbmx4UWxSMWJIQXpTVEpDVGtGcFFVbGpXR05EYUdKbE1rVmtORFlyYWpWVWRraGlid295UlZCU1IxWkhSMWhqVlhWSGQyNHdWbEZoTldkVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dlFVUkNiRUZxUlVGNFRHNVlMMWhwYjB0dVRtdFRiekJKQ2xOelpqTkVNRGMwTldzd1oyRTNWRXBvU0V4cFVXOTZUekZEVlRGTWRFdHlaa3hpYkROVGFGaFdWbFJtWWxWeEswRnFRV2RGWWtaUGJFMVVORWxOVURZS1VuQnJibkF2VDNkUFZXTmtjazhyTmpoMVZIUnFWM0kwVjNkR1kwUk1aRXd6YTJkT1NHdzVWWEEyWjNNelVUZEdWVzl6UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663725934,
          "logIndex": 3644779,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094704765",
      "sha": "f5f704f35ce14657fb44f86ee1d6758be208fdbb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

