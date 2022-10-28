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
| `latest` | `sha256:079a998928809819aa68063834fc7db1ac4a6d182b41d5dfafe3565a55a0e8ff`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:079a998928809819aa68063834fc7db1ac4a6d182b41d5dfafe3565a55a0e8ff) | `amd64` |



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
        "docker-manifest-digest": "sha256:079a998928809819aa68063834fc7db1ac4a6d182b41d5dfafe3565a55a0e8ff"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "98ca5e6e7640d5fb39419b5c9f6ff1b95b606d1b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDOycdhEPZ8bZM9v62Rh2N+AL28KdhkqpNDuJwHDcP9WwIgYR8rwBQnAObcHo2CwDdEkp3LD6hx9+MNqGqnjAhlq/o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNGVkNjY4MDQ0NzYzMjZmOTYzOTUyOWM1OGUyNTUyNDllZTFmNDZkZjY1ZmQyODE4MDVmMDE1YmU1YjJiYjk3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQwYmZZR09CL3hJVkdYNUxDemZZQVppazJPVXN3eFJTYk9PTDJIRmNocmd3SWhBSmxEQ1RqYXFFWTVVT0tMdG96R1llOXhzczJSRlUwOVJVM09QMGZnWmFrMyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlExSTRiRGgyUzI1bGRGQlBSVVJWVW5OTlRGUlVWRTFQZFhGSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RSTlJFVXdUMVJWTkZkb1kwNU5ha2w0VFVSSk5FMUVSVEZQVkZVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYWTJ4b09TOUlTalJXZDJOTU5UWXlVVUkzYzNkdFYzSXljV2syZUZGM1pTOXFUa3NLVWsxMVRtUXdjMUF6YW5kUWEwMUVSMk5IVDFabWR6aEJZelpUWmxWRVFUTk5TalowVXpkTGNFOTVSa04yYTFkWVZ6WlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwYmtsa0NqSlVNRGgxU25NNGEwUnhTbGMyTm5nME1XZE1WM2x2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHczBXVEpGTVZwVVdteE9lbGt3VFVkUk1WcHRTWHBQVkZGNFQxZEpNVmw2YkcxT2JWcHRDazFYU1RWT1Ywa3lUVVJhYTAxWFNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGalUwSnpNRUZCUVVWQmQwSklUVVZWUTBsUlJHY0tXWFExUmxCUE9IUXhUR0ZXVEU0d0wzTmpaWGxwUTI5VlFXeFNlVk16ZGpKVE9YazJNMUJuV0hOUlNXZE9kVEpxZFVzM2VrOVFhamh1VTBoMk9FZzFPQXB3WmpobU5WcGFlblY1VDBkNmVXOW5XV2RQUzIxelFYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkTE5GQnNka1ZwYUVacVR6YzVVRUpvQ2pNelNtaG1XVmQxUWk4d2JHNWFWVWt2ZFU4emJGQmpjMk52UzB0a1Vra3hZakZQTWtzd01VeHJRV3BDWjNReWRrRnFRa3hDVVhWWlJDdDJOMkp0Y2pJS1NHUmFRblJxVVd0SlRFZG1NelpSTWxsellXeFdURU40VWpabGVXTkZOMk5TS3pWVldYTkxLM2x3VTFWUGNHdzFNRE5aUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666921802,
          "logIndex": 6015830,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "98ca5e6e7640d5fb39419b5c9f6ff1b95b606d1b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3342200190",
      "sha": "98ca5e6e7640d5fb39419b5c9f6ff1b95b606d1b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

