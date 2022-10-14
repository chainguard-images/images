# jdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:08e5735baed3559f0e0614b9f25f4ef7cd6b9655fe91664e123bd0b0f9dbc849`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:08e5735baed3559f0e0614b9f25f4ef7cd6b9655fe91664e123bd0b0f9dbc849) |  |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:08e5735baed3559f0e0614b9f25f4ef7cd6b9655fe91664e123bd0b0f9dbc849"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e8e7795b5f37516aeb61302687952e8dc248a8eb",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIA6nJXL2e3yq1wFnSqpLD1yTUjK3uvW1/8P93h+0SRoVAiB59Drfu3be1Q9Kw+THiAz1nw86JwW1O+rHeEFL7PdbxQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwNzdjMWVlYTdlZWZmZmIzMGVlMjFjMjdiNjcwODAzNmM0Y2VmMTI1N2Y4YzYyOGQyYzk5NGY1MWNjOTgwNDliIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQyNkdZUjJUY2Yrd0dzd3JjTnUvZDJaa0s5Q2NCRGswbEVmeEhTMEpqdFB3SWhBTVZpeDlNbXhrOGVGRER0b3M4bTBNSXVWSXBybjNkTncvYzJHTENaTVA0WCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVldTOWFlSEpyTWtkNFdEUlhjV1J4TDBKQmVqZHdRbGxzU1ZkamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFbDZUVlJGZWxkb1kwNU5ha2w0VFVSRk1FMUVTVEJOVkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZEY0ZBck1IbEtPRVowUlhJNE1tOUxSMFJ6ZFZGTFJ6YzVORXhLV0ZNcmRrUnBNR2NLV2twREszVnJXRGhrY0hGdVpYVkhTREZPSzFORGNrTXpVemdyVTFkNVdHODRWbUkzYTFkdVpXdERXbUZwVjNWQ05qWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoUmxsa0NqTmtjekZ6U0drdk5VUnRjV2x2VlZRM09XUkpXa2RuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUm9iRTU2WXpWT1Ywa3hXbXBOTTA1VVJUSlpWMVpwVG1wRmVrMUVTVEpQUkdNMVRsUktiRTlIVW1wTmFsRTBDbGxVYUd4WmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRGR1ZGZFpkMEZCUWtGTlFWSjZRa1pCYVVWQk5tNDVXV2szWlRGdVFrRmpZbmRoZVdoaU0wRUtTRFZRU2tOQ2ExTkdPVzlLZGtaSWRFeDVUVU5ET1VGRFNVUnRkMlpQWkVack9YRlVPVTFvUTJjd1ZqaHdlbE55ZVc1bFVWTjNjalZtYTFoVk9VTnRRd3BYZUVwNVRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVWdVFrWlNabGRTUzFZeWJVRXllUzlpUzNkeWFIcHFWVGREVERsWE4xTlljbkY2Q25OWFZrTjFTQzh2TlhaaWFubFpSazFHUldsQk5XWnhaRlJPTTFsdVFVbDNWVTVoZW05T0swNXpiMDFHWmtwV09HNDBWMnRUVGpSSGFqaERkMVF4T0ZVS1ZVNVVlbTFLZDNJdmNHOVJUelJ0U25wdlpGUTJOVEZ1YlVKb2JWaDNRbXdLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665714674,
          "logIndex": 5066026,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "e8e7795b5f37516aeb61302687952e8dc248a8eb",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3247033250",
      "sha": "e8e7795b5f37516aeb61302687952e8dc248a8eb"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

