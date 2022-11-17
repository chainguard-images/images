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
| `latest` | `sha256:aa2cd1a94eb506c4d4c07c6b31d856bd8b49311d16d186c3c7c77b0e0a6db205`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:aa2cd1a94eb506c4d4c07c6b31d856bd8b49311d16d186c3c7c77b0e0a6db205) | `amd64` |



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
        "docker-manifest-digest": "sha256:aa2cd1a94eb506c4d4c07c6b31d856bd8b49311d16d186c3c7c77b0e0a6db205"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "665185d214860d10e2ca39edf1ea08cdee9e8464",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDkepDjhHXmFKyd9EenD+nBm3Mn8FIGvJPAgURBIv4XIwIgKJgWtZOAnXECppcGthLZBAR2NCJRUnnOgobMPmK9GrU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MGYzYjQ5MzZmMGYyODgwMzY3MjE4MzY0YWY2MzZlZWFkMzEzZWIzNmExZDg0MWRmZWViMmJmNzAzMTc4NGQzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2wxZlVwRGlNbW54T3R6MnZOWXVUNXE5cStYSkZ6ZXpWZmxuUXc3S3lLRkFpQUdISy84WGNqVXBLOFFiRGxxVjZzWUkyMEVuc1pLNUtMWFJtMThGVUs2bnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpha05EUVhwdFowRjNTVUpCWjBsVlVucFlNSGx1VEV0emVITmlVSFJXWXpKblNHZGpXakZETVVsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVjVUV3BOZVZkb1kwNU5ha2w0VFZSRk0wMUVSWHBOYWsxNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXYld0UWRXTnhSRWhpUW5GSFdVSXplRGN5YzJOQ1drdzJhMUJwY25wblp6ZFRSa3NLYkM5S2VUbGpjVTFuYWpKME4zWnVhRTUxZHprME1WUXlNbGN5TkZnMlFUaFpURk13YmtKWE4zVlRZMk5SVldodGRqWlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSUlVwekNuRjRiWGxGZFVkemFFaGpOa280U3pKNlRXa3pPREkwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJGa3lUbFJGTkU1WFVYbE5WRkUwVG1wQ2EwMVVRbXhOYlU1b1RYcHNiRnBIV1hoYVYwVjNDazlIVG10YVYxVTFXbFJuTUU1cVVYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZORVRHbDVla0ZCUVVWQmQwSklUVVZWUTBsUlEyWUtTbWhKVkV4SFNtaHVXVzQwZGtKTmJIUldWRGsxU2xKc1RYSmhTVkZ4UWpJeEszRkRWREpPY0ZKblNXZENaWFZuTVdRMGRqVjNTVzFoTkdGYVoyNVNWd3BNY0hCRmRWSmlWbEZwUjNWM1MwVXdLMnBUTVc1Tk9IZERaMWxKUzI5YVNYcHFNRVZCZDAxRVduZEJkMXBCU1hkbVZGZGxkbGRYYkVnMWRFRTRaa0pYQ2xOc2REY3JUR0Z0VnpWMmEyaEpLM3BQYVRkcVVqSTJWbEo1YlcweGFsaExjWEJtYVZseWRXSm5OSEp0VjI1WU9FRnFRalZQYjJKMmFFUlVWaXR6YkdRS1ZFOHZNWE5CVFVVMk9GUlpNblpJVVVOc1RXUTROSE50Umtsd1VHWmplalE1VVdOemF5dHhaV2gyZEZvMmVpdExRblUwUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668648155,
          "logIndex": 7241636,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "665185d214860d10e2ca39edf1ea08cdee9e8464",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484534905",
      "sha": "665185d214860d10e2ca39edf1ea08cdee9e8464"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

