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
| `latest` | `sha256:951ca95229261a7f2c763748903bdfa066b8ab2ab5049fe36a4cb23dd6e86222`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:951ca95229261a7f2c763748903bdfa066b8ab2ab5049fe36a4cb23dd6e86222) | `amd64` |



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
        "docker-manifest-digest": "sha256:951ca95229261a7f2c763748903bdfa066b8ab2ab5049fe36a4cb23dd6e86222"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d94bca97eca3a1a0937458928d0a41af1a104803",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFQV906Zo5FL/n75selVGCGNnlUC1+kqW06DtAAUKPSiAiAbWZoXHkkic8UD/kFI0aKpVvr5UT3NBD6+PTcc1bUITg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNDJjNTVmYmFhN2Q2MzJjMzg3NGMxMWI1Njc0MGQ2YTliODE4MThjY2Q3ZmMwMmU0OTk3ZjgzZDYzNGY5MDBkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNZYVRvYjRRVCt3UnpiYnMyblpSVG9VZEsrdHMvVWo0UWRUTHloUHhDYlZBSWdFdjNHRnJUUG40bmFWS1NMeW5oK3dBdHcyUW1MMUUxRVNuWDJGZWt1Qk5jPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlFtaGlka2hzU0V3MFpIZFpkMUpQUlRab1JXcFRTVkppTW0xUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVjZUMFJCTTFkb1kwNU5ha2w0VFZSQk1rMUVSVEJQUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOVG1abFZYQkZVVWh3TDNJd1QwVjBPU3RpVURsNk1FMURLekJpTVc1NGRsaDFNMW9LYTBabU5tNHlZVTFIYlcxR1pGbE1VVkpyVlZOdFUycGxla3MwTUVsVFIyOVFhalYzU1VsRmFYQjNZekpGZVZvMWFEWlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvY1d0Q0NtMU5RVkE1YVdneVF6WndTSEZwVVVablMxbE1WVWRGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxRTFUa2RLYWxsVWF6TmFWMDVvVFRKRmVGbFVRVFZOZW1Nd1RsUm5OVTFxYUd0TlIwVXdDazFYUm0xTlYwVjRUVVJSTkUxRVRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJSR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKTGJHNHpTRUZCUVVWQmQwSkhUVVZSUTBsSVVWZ0tkMDB2WjA1bWNFZFJRa1ZJVjIxbVNtUkxTbUpZUkd3NVUzTkNaME5rYmsweVpGSTFXRzVVT1VGcFFURlZZV2MwU1ZCUU56VjNibVpSU2pkTGN6RkpVd3B5WVV4QlUySkxibEZvZWpsVFJrVldaRzlZWjFkcVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUVZacE9XMXpUVGxQVTJObVVuRlRhRWhrQ2tobE9IWllhbFZ1Y0dGbFlXeEhNblJvVW1aeFltb3pVR1Z5ZW1aVVlVbFhURmxJUkd3MVdHOVJObk5RVUhSelEwMURlVzVwTlVKbWNXOVpUazFRYUUwS1pGSnRkbEIxU1VaMFVrTmxWelk1ZGprMWRXdDBUa1EwUm0xYWNITnhVV0ZSVUdSMFFqaG9XRXhtTW1WU2RXdDFlbWM5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667698691,
          "logIndex": 6591493,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "d94bca97eca3a1a0937458928d0a41af1a104803",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402453905",
      "sha": "d94bca97eca3a1a0937458928d0a41af1a104803"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

