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
| `latest` | `sha256:cc9aadc8c81d52c24444b669823f853e54ee5f020c28020eead641ada2344704`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cc9aadc8c81d52c24444b669823f853e54ee5f020c28020eead641ada2344704) |  |



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
        "docker-manifest-digest": "sha256:cc9aadc8c81d52c24444b669823f853e54ee5f020c28020eead641ada2344704"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "e1ffa79d8e8189a8cae68a19909a785272f0f1e8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDwZyd6EncvsiWhIRuIDv7ttipGiR5z15Z85/9DW3WRTAIgWr5+JPJVRCkF+NOAtp/n2h1L/49yXVfP0vxnx5aQCQE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ODkxMWE4MTdmM2UwZWRmYjhhYzkxYjI2N2E4ZDExZDVhNmM3ODQ3YjU0MDkzZGJmNTU0ZDdhOTc0ZWU3MDE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRFhXS1UyZC8raFZadWR3cFJmNTQ3YnZOSTFtcmdscDgrWWdLMTNGWGkxSkFpRUF3eDh6eXhHT0V6WDRKUU1ZN0FneE5UQSs0ZWJpVTVLUVV2bFEwWTFYbzlVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlltRk9hM2RqZURCb01WWjFjamRoT0ZWdFdrSlNOREZNYmtoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFbDRUbXBCTTFkb1kwNU5ha2w0VFVSRk5VMUVTWGxPYWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRVFcxcGVGaHhTMGhhTjFGTmVFMUZRbXR3WkZoRGNuaHdUMFUxV2t0VGNESTBjRWtLYkdwTFdEbDBSbEpZVmpBMmMyOVplbVI0SzJZeldHczJkV1p1TVVWVFZtNWhMMHR1UTA1UlpUUk5UbG9yUjFSNVN6WlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0ZERWckNrcHRWSEZXWlZaaVNtcElWV0pqU1hGR1YwSk9UME5KZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldsUkdiVnB0UlROUFYxRTBXbFJuZUU5RWJHaFBSMDVvV2xSWk5GbFVSVFZQVkVFMVdWUmpORTVVU1ROTmJWbDNDbHBxUm14UFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRkbllsTlZVVUZCUWtGTlFWTkVRa2RCYVVWQmRIVnZTWGxRT1c1SlMwbEJSbGMxVDB4Skwzb0tTRzV5V1dWeFoweHpaWGhSYzFsUFJrYzJiMjlMVW10RFNWRkRRbWRWTUZGemQxTllTVmhWZGtkcEwzTjFlbVJXVkhSb0szWXZVemsxWjFKNE5EUXhaZ3BFVTNGUVNVUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQmFXMDJlVmNyVkROUlkwdFZaelJ1Y25WdGVGVktaakl6VTNCa2VIUTBObUlyQ2tWc1NHRnpNVUUwYldaMkwyeFJTbEFyY0ZOVVFpOW1UMlJvVDA4NE1rbERUVkZFWjFGaGEzTTNlV3hTV2twYVZqVllObkUyUkV0Qk1ESllZUzluSzJVS2VtRXpWbEZHVDJwSk1HaEdUVlpKY1hBdk0zSnRXQ3R4VkhWeU1FWlJUa1pyYlc4OUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666145768,
          "logIndex": 5401759,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "e1ffa79d8e8189a8cae68a19909a785272f0f1e8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278310417",
      "sha": "e1ffa79d8e8189a8cae68a19909a785272f0f1e8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

