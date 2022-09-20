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
| `latest` | `sha256:fc95a85d72626851c07712911b0b40cca6b8ebd3d2d59d26196fec7d1c355b94`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fc95a85d72626851c07712911b0b40cca6b8ebd3d2d59d26196fec7d1c355b94) | `amd64` |



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
        "docker-manifest-digest": "sha256:fc95a85d72626851c07712911b0b40cca6b8ebd3d2d59d26196fec7d1c355b94"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "f68cd30f36551db5daa4233b8814240b3ad08a51",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDODRQRZTB3iS80i+UTWxXpuvue480LVnPFgNVtMEHiCgIhANlVz0Rdhvz4lxWUfnDTs3wju0c1oBKL415R2uG+zyjX",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5OWMxM2YzOGE0Mzg1YjAyNTUzZTkwZjE4OGQ4MWE0OGNmNGZjMzI5MGVlZmYwNGMwYmEzZGQ0OWZkOGI3Y2Y2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRnJ0b3pkMDQ2cm1kZ0pKcUxZSzZwTFJ4SFZiaDREOG40eWF2czhCamhJT0FpRUFqSkcxTlIxeTg2L0I0WTJSRWdTRmxUZ3VzTmZtUXZBRmNtNHFTQXh0aU1rPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlRrMTJiVVZZY1RGMU0wSmxUbkUxZGpkclVVcDBaVmRYUkV4UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJWZWxkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkZWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqVG1WT1ZERndhMGRtSzJnNVpuQk5NamhqVlNzM2NUVjJlbGxIWjNrMVpqWmxja01LTUhWdlJWSlJLMDlsVjNSUFpFaDRSRVJaWXpCU05qUlVka1V2WnpoeFFtYzRNMUJpWm5WRGQxZG9WVFoyU0ROdGNIRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoVTJWdENtaGljRFoxVUhSelRVSjZRMHQwVm1WdVREVnpSMGs0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBxV1RSWk1sRjZUVWRaZWs1cVZURk5WMUpwVGxkU2FGbFVVWGxOZWs1cFQwUm5lRTVFU1RCTlIwbDZDbGxYVVhkUFIwVXhUVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3hkMDVuTmtGQlFVRlJSRUZGWTNkU1VVbG9RVXRtTUhJclVWVUtWMWMyUXpWT2RUVmlla1JGVldkd2JIbDFZemx2TlRNeVppczBNbVJpVDFKNFRXcGhRV2xCYTAxME56bDZibXB4VlVGU1FVdzBOR2hCZWpZNGEzSlJid3BvVEhOc01rRnRhVlV4UW5sUGFrRm9jbFJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcENRMU5SYzBvMFFuZEpTR2haUzJOWFpVaDBSekkwQ2xoUFZYcENaRzQyTVZJMksyTXhWbTFyYlhwWmRsaEpaWG93U3psb04yMVVibWhuZDBwRFRsVjRhVWxEVFVRd2NVTlBXbUpUUTNZelJ6RXdlbkJ2WkRFS2EyUlBjMEozV1VrNFkwSm5iblpuV2pNNFdrbFdiM0l3WlRCMVZFTXdlbFpVVVRWTFpEQXlTMlE0TDJsVlVUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663696740,
          "logIndex": 3620660,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092336703",
      "sha": "f68cd30f36551db5daa4233b8814240b3ad08a51"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

