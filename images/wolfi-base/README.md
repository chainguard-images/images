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
| `latest` | `sha256:8559859eb021a6d076077799a1bbb6713b9f5b38728e1e5862dc7533b351dd93`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8559859eb021a6d076077799a1bbb6713b9f5b38728e1e5862dc7533b351dd93) | `amd64` |



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
        "docker-manifest-digest": "sha256:8559859eb021a6d076077799a1bbb6713b9f5b38728e1e5862dc7533b351dd93"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "738bb15c06ca4a69d9ecc1f0931105cb5f090a38",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIA+op/iaSWxiu86K3QHZkS3g1XGULtCz8mb6Twnyg8leAiEAmgp3qBLx5zWQCJBu3XZCqXOUNgFXdikwGHq13gtf0To=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYmFlNDUxNzMxZWRjOGRmNmUyY2FmZjMyYTliYTE0YmEyOWFiMWUxNmQyNTNiZDgxMzVmMWEzMzhjZWM3MzQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQyOUFsZzBQNmNEcEVaZ0szaXh3ZTlCeTYzMFRVZ0g2MENob0daQU8xTGdBSWdFZEhWUlBOOHN3Y2ZjWTlNWDdDTlUvZVZ6cjhjSElyNU4yYmkyMXd5L3N3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlZWbGxWME5rV2tSRlRWUlRVWEZ2UTFkUFNrRnBUazFvWjNsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVXhUMVJOTkZkb1kwNU5ha2w0VFZSQmVFMUVTWGRQVkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJU2t0YWJVZDNlVlpMZW1ZeU0yeDBkbmcyTHk5RmRsTlhMelZ6WTJOeFYwTTFZM1VLT1dsUWVYb3JWbGMyVEhKak5UZFBiblZxUW5nMlpETk9jVVZ6T1RkMlZ6QnNUSFo1VlM5eFFVeEZXVUpYTW1wbWFVdFBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsVDFscENteG5kSEEzUTNZNFVYTlZZMUZ4ZVhGVU16SlFSVXBqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHTjZUMGRLYVUxVVZtcE5SRnBxV1ZSU2FFNXFiR3RQVjFacVdYcEdiVTFFYTNwTlZFVjNDazVYVG1sT1YxbDNUMVJDYUUxNlozZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZGM05tMWlNVUZCUVVWQmQwSklUVVZWUTBsUlJIUUtURVJqTUROV1MxaENMM2RaTHpsSlNtMTVTVXhQVFdNMmQxVlJOMUZpVTJoU05tWlFjVzVXV1doQlNXZEVNa2RCYkNzM016ZEZZbGc1T0ZCb1YyZDVjUXB6WnpWa1QzWlJNREI0V1ZOdGNuTktkRlpxUm1SaVRYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlRuUlhiSG8yVjBSUVNuQmlNazV3Q2tsSGFWSmhXa3hVZVdGNmRqRjFZMWhJYkRNeFMzZzFVWFoyVVVoc1JGZ3Jka1pKWVN0V1Myb3lOVTh3YTI5dE5rRm5TWGhCVFhkU2JsTm1OeXRFUjJRS2VUSXpWVlZOUWpOeVFWWlNaMFp4ZGtjdmVTczNiamxJVVhsVlkzaFJPVE5DVFdoT2JVNTJPR05EYlVWb2FrY3lZME5SZDNKblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667267986,
          "logIndex": 6263089,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "738bb15c06ca4a69d9ecc1f0931105cb5f090a38",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366188625",
      "sha": "738bb15c06ca4a69d9ecc1f0931105cb5f090a38"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

