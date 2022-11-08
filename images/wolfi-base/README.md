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
| `latest` | `sha256:07f31df3c6068dc71204a3c386c3e1e94fcaf7e4c777fc9a9d2ae00b4338cdfa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07f31df3c6068dc71204a3c386c3e1e94fcaf7e4c777fc9a9d2ae00b4338cdfa) | `amd64` |



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
        "docker-manifest-digest": "sha256:07f31df3c6068dc71204a3c386c3e1e94fcaf7e4c777fc9a9d2ae00b4338cdfa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "361344bcc43602b5384f6fe031c78eb594be02d4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCURbgV/4zQHS0+KDA7+VZgoh6kx1jnmzTHi7JwI9kJPAIhAPDPxPObOO/olP5kqix+L6kGmejS/AzGfqZN2ag/UgRV",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZjU4YWEzYWM1MGVhMDJhYzM3NjA4YjJlYmFlOTJiNjdiNjdjNjc3NTYyMjljNDg1MTk3MDRjMGUwMjk3NzUwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURSdlRNdE4wVlJpREZXc0FKUmlZL2FaTmpqVTRVUnZFTHJIaDUyazR1dzRnSWdQTWxZLytSZHNTUDdzUnRFV0d0OE1jR2toUE90cXdkYWxCc0hWT3RGYlZFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlNFUTFUbVpVUTFsRWRHWkdjQ3RrTDBwaFlXOVhMMjFwV1d0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXhUVVJGZDFkb1kwNU5ha2w0VFZSQk5FMVVSWGROUkVWM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwYVc4MWRuRkROQ3QzYTB4NVRsZ3ljV2huWlZseVJ6VldlRVF6VFZsVVRtWXlVbFVLWm1wbFZGRkVUakYxTm01WmRGUkZhMGhPYWpWMVpXUk9WM0pzUTNOTE5UVXlLMDVDZFZwcmNVNXNXVXBtV0hKRVdtRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV2TDBzMUNtMWxhMHRvU1RkT1oybGtlVVpZWW5GT2MxTlNha3h6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDE2V1hoTmVsRXdXVzFPYWs1RVRUSk5SRXBwVGxSTk5FNUhXVEphYlZWM1RYcEdhazU2YUd4WmFsVTFDazVIU214TlJFcHJUa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEdZbU52VGxsQlFVRlJSRUZGWTNkU1VVbG5XRWt4ZFROcGQwa0tTMWRMVjJKb2IyVm9NbUZzU0M5WE9TczJXakF6UkV4c2JHVndZVmwxYTFOMmFsRkRTVkZFUVhoclJqRXZWVWt6UkVJeGRuWXZXVlpQUVRsWGJGaG5jUXBMUkZjMWRGaHZZVmhRV25wQlNHdHlVbXBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcENWRkIxZFVSd2RrVTNTMWd5VkZwV2FuUTVlV3BXQ25OclduTTNlVTF5ZERsWFprZHhNemxsVVdGT2RHVjVZbHB1VERKNlFqRTFORTlXTVZwbVdVRTRRVVZEVFVkYWVqUm5UMUp6UWxoNk0zVnlWVWxzZGxVS01VSmthMVJtWjFKcFZqbHhiVFZQZG5nNFprTjZURlZEYW5CSVZ6QXhiMkV4YmtWa1pVVmtUUzlTUmt4U1FUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667904614,
          "logIndex": 6721156,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "361344bcc43602b5384f6fe031c78eb594be02d4",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418686991",
      "sha": "361344bcc43602b5384f6fe031c78eb594be02d4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

