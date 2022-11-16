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
| `latest` | `sha256:12d02bfe5cc50705b88d1579b0c1cf392cb1b5eb389eb0ed67ce05333d271f76`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:12d02bfe5cc50705b88d1579b0c1cf392cb1b5eb389eb0ed67ce05333d271f76) | `amd64` |



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
        "docker-manifest-digest": "sha256:12d02bfe5cc50705b88d1579b0c1cf392cb1b5eb389eb0ed67ce05333d271f76"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7d33373089d205dfff8e0d897226417331dbc051",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDKs+OAu9Ef/Ln2EJaNYLOs1CH3agA4s3hlyCN3peMgTwIgbuIrER55tJbKaHnMIZHYjlOj1/NcmfepnqVwQdSHMPs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1MTIwNTNmMjRhYjRmNTM3ZGNlYmIyNTcwMDlhOTQ1NDdlZmY4NmU3YTIwY2ZmMjdlOGY5MmRkNGQzYTUzZTk5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURUeTVoSUUwNXZCVmhQUTYzVzR6WnFVME9SZmpycU1KYXQ2UWp3L3pOc0xBSWdMa1FOVGxuK2VHTDkzOElFK25EZmxKdVdIc3hUaGFUa0dEQWFpRjB2aFhzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlNtVlJRV3hCY0RoclRGWldVemRETWtrdlZscFhNR3hCYkM4d2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVjVUV3BSTlZkb1kwNU5ha2w0VFZSRk1rMUVSWHBOYWxFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3U25CQ1MyZHdielpxVjBkelYydEpTbU5RWlcxUU1WSlFaMkpDVjBKdlRYbE9NMU1LYWxFeVIyb3dPRlZ0ZEc5MFdVY3pkRVk1TVdobFdUYzNjbkZWTjFoaVUzbEtXbGwyZGpBd1VVbzFXbFZvWVhGcmRUWlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4WTNCekNpc3hkVmxuVTBweVMwdDRiVFEzVGpocmEzRlRRbEk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHUnJUWHBOZWs1NlRYZFBSR3hyVFdwQk1WcEhXbTFhYW1oc1RVZFJORTlVWTNsTmFsa3dDazFVWTNwTmVrWnJXVzFOZDA1VVJYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZJclEwSlpZVUZCUVVWQmQwSklUVVZWUTBsQlpWUUtkMmRSVmtkM1NHY3dOa1pPTWxSUlpVVlhTVW94VmxKblNrbGxLMU56ZEVwRlRYcEVielYzZWtGcFJVRnJiWGN6VEVSc2VFZHdXbTluUVdsR1ZGVnVTZ295U0RSTGNrY3hVVVJYSzFOYVZsTTFiRXcwTjNRdlkzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlRWVk5XVTVoZVVNeFNVWmxZbXhsQ21GaVUzZEdWbXh2WWtKSGFGSjJSMUpOZVZCcU5GcERhSFJ5VmpoMFRrY3ZOMUpCYTJwWFoweHNNbmQ1WWxkNlIzVkJTWGhCVURkSWVXNXNUbmhuUVU0S1JVNHdWRU5tUTJ0eUszZHROMjl5TlZWT1Z6RXZhbmhZUzJKdlRWUkJhSGhITUdJdlVFRkhibFZKZWtaU1NqRlNVRGxFUjA5M1BUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668561774,
          "logIndex": 7169401,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "7d33373089d205dfff8e0d897226417331dbc051",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475567989",
      "sha": "7d33373089d205dfff8e0d897226417331dbc051"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

