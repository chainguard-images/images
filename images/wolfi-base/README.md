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
| `latest` | `sha256:9eed1155e4ab8334ac7f11c17b8059953c5df8213ef4e3b4c62a7e2cdd16682e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9eed1155e4ab8334ac7f11c17b8059953c5df8213ef4e3b4c62a7e2cdd16682e) | `amd64` |



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
        "docker-manifest-digest": "sha256:9eed1155e4ab8334ac7f11c17b8059953c5df8213ef4e3b4c62a7e2cdd16682e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "59c476374183ec3fc4bc285ff3a701f6bece62a5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDMPbrxU8H/ZbO6PnIyicxQhfOUp2vkM8W8x6MdfJt/swIhAKv12RuEg08qsJMntA985mOE2D4f3q2Dno04KGv7osMR",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZWI0NjJjN2UxNjEyMzk1MTk1NTQ2MDUzOGY1NWIyMTNmNjg5Nzk2Y2VhZDE0M2I5MDFlMmY1NTBhYjE0NjNiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3lLWDFmMVFTR0VPU0pqbnFnbXU5ZnVtU09zcjlJNGo3UVQ4TGRxSW90U0FpQWhjVUdDQitmdDhYRVlzY1liZ1hMMGVCZ1FtTUhYTDFib1ltK0tEQ28yZEE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVldtSmlaak56VEhWcVNGUk5hV1pTTlUwMFJFSlFWV3hrVFdkWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVjZUbnBOTTFkb1kwNU5ha2w0VFZSQk1VMUVSVEJPZWswelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV4ZDFWbldGQnFTRFl4ZFVGMVNGSlVlak0yUWl0TVRGUkZia294VVRRclIyVndkRWtLVjJod1IybEdUVWt5UW1OVmJsWmpSMEptU0RCR2FsWkNMMlpLV25SMFJXUnBXaXRGY1RkaWNtRnZWVEZsY0U5WmFIRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEZGtwVENrWndibUZCZWpWeFp6WTViVllyUVZCaE5VMVRhbTUzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJGVTFXWHBSTTA1cVRUTk9SRVUwVFRKV2FrMHlXbXBPUjBwcVRXcG5NVnB0V1hwWlZHTjNDazFYV1RKWmJWWnFXbFJaZVZsVVZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKR1lqWXlTRUZCUVVWQmQwSklUVVZWUTBsQk5VUUtVV1ZqYWtzMmRHSnJTU3R0WjBWT09UZEJNV3RMZFhKWUwwNXFZV3N3UmpWSFZIWTFUM1YyWkVGcFJVRjFjaXRSWjBkVGMzRkhVR3B6VlZndlRHZDFUUXByUVhWaVdESmhUR1JpY21oVVEzVkdRamhwYkhFNVFYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlNYRkdjWFkzYm1ocmQwbHhhRXRTQ25aUFNrTnliazFWUldKUmJHNHhSR2gwVURGVlJqUmFWSFJ1UnpkRlZtZFNhSGhXVWprNVowcEdPR1JQYzFnclFYbG5TWGRFVVZGUlZUTXdSMlp2TjBjS1NXTkZZVUYyVG5WNFluTkZXazlHTUcxeE0zaFRjVm94Vm04MldFVk9TSHB0UjNKRVRsQTVZWGhYSzNOQ2REaEdjVEJ1UWdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667612263,
          "logIndex": 6530901,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "59c476374183ec3fc4bc285ff3a701f6bece62a5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398183609",
      "sha": "59c476374183ec3fc4bc285ff3a701f6bece62a5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

