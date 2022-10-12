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
| `latest` | `sha256:d1ee0be837ee76f96299bb03ccf495694ff013b72b625a6a474c1467647e93ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d1ee0be837ee76f96299bb03ccf495694ff013b72b625a6a474c1467647e93ea) | `amd64` |



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
        "docker-manifest-digest": "sha256:d1ee0be837ee76f96299bb03ccf495694ff013b72b625a6a474c1467647e93ea"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "abd9b4cf995f7d24845edbaba51dbbf49b06497e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFEWvm/D0ksasxULNhJeqOPlbtu4tGelG+QVi4EULWcLAiEAo0C4/RfmbDXnX7TyGs3Kx42IxGIkevQVwSTQJROSjZI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZDY4ZTg3NGU5ZDk0YzM2YTJhNjUzYzQyMWNmNTk1OGQ5ZDM3OGNjYTFmZDdhYjlkY2QwMzcyYmQ4ZDJmYTQwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNzZ2NqSE51Y0FtaC90dWdDYTEyQVhHVVcrSTEyMGt5ZmpNY3FjVENJRGZRSWhBSm9mMGFxbThuSmQyQzVoTUttbjBlc2s4UDlmTENoN092SjBHaE5aSTRsTyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwcFowRjNTVUpCWjBsVlZXeHZSRk51V1M5NVkwTkRjR0ZDZEZncmJXSldLekpPVEhGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFbDNUa1JSZUZkb1kwNU5ha2w0VFVSRmVVMUVTWGhPUkZGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJYlhKSFp6WnRSamRzTVd0U2RWQldhMjkxZUVzeWRDdFpLMUkzYVZGaFUwOVNXbWNLUW5GdmEzRktaWEF4WTBVMGNFVTVjRlJYVmpKVVdHTnZlV3BzZUZaR2EyRTRaaTh5Ym1rdlJ6TklNVGx3YmtsU0x6WlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIVldoYUNuTjNNbU5pTTFKU1VHVjNSRGxKZUdrMVFqTkJaa2t3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwWnBXa1JzYVU1SFRtMVBWR3N4V21wa2EwMXFVVFJPUkZac1drZEthRmx0UlRGTlYxSnBDbGx0V1RCUFYwbDNUbXBSTlU0eVZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCS056bFJjRUZCUVVWQmQwSkhUVVZSUTBsRksxRUtNbGRzZVc1MVZVTjFNR1FyUWxoWGJFWnpTMFJ2VkdWV1pHTkxRbmRDTjNBd2RtVk5TVWxRYTBGcFFsY3JTekp3TVhGM1JGWmhabWhHWmtSYVpUQnhkd3B0UlZKaWVuRTVSMGRaY0d4akt6TnNObTl6U1hKVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1d1FVUkNiVUZxUlVFelJXVXhRbHB0WW5oV01YTmpjM0ZTQ2swMFVWQnpZVkZTZDB4VVozVnRja2R0VkVsck5rTnFkMHR4Tm1KT1VXbFVOVTV0SzI5TFNXRndaR1JXUzJGNlVVRnFSVUU1ZGtKRVR6SlplVVp2SzI0S1RubE5SbFZhTldWMk5tSnlOQ3R0Wkc1NFJUZFpaRzAwUXpSRmQzcE9WR2xtTWtWWWIxUjNZV2hvVG5SNVlUaHhhVFV2YlFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665540284,
          "logIndex": 4932849,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "abd9b4cf995f7d24845edbaba51dbbf49b06497e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231508339",
      "sha": "abd9b4cf995f7d24845edbaba51dbbf49b06497e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

