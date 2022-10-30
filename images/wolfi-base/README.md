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
| `latest` | `sha256:c903063243e9c8332cba8d4ade02c59376a071ecdbc7b3d128448d12b8ccf2ba`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c903063243e9c8332cba8d4ade02c59376a071ecdbc7b3d128448d12b8ccf2ba) | `amd64` |



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
        "docker-manifest-digest": "sha256:c903063243e9c8332cba8d4ade02c59376a071ecdbc7b3d128448d12b8ccf2ba"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "362510643d3ef1a2e122e2ff12896e7228a9ee2f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID1zPu2430+9HSQEFp8zOpUcC1uQNUbiK5V2534nuUGmAiEAiOGIi5+pnQFPYSo944S2LWpcTfVs5Rt1gMTSf0HJL6M=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YTVkMWNjOTY0MzRkMjA0NDlmOTA1ZGMyMjFlZmJkZjQ4NzY5OTE0OTczOGE1YjFlODZmMDIwZWZhZWU0Mzg3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQXB6YVYwUGN6YTkvdEFJR1JKaVFiZ0dvSEVZUVN2Y1lXMjN1NVNwL2ZkT0FpRUE4MkU1OTRIMzRQZmVLRCt6RldRWmdVL2Q5U29qdjM3MGp4N21DSDJFa1VVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlpIWnBiazVhZDBSS1MyVnVSVFV4ZURCU1pVOXJRbEpvYTBrNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVXhUV3BWTkZkb1kwNU5ha2w0VFVSTmQwMUVTWGROYWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwWWtwcVVEWmhkUzg1ZUhwbVIwOVNjMEZEU0hKd1NUbHlUa1Y2YW1sdVUwNXRXRVVLTUhWMFpWQk9LMEZoYWpGM1QxZExSMEpOVVZGVlZ6UmlLMDh6T1c5aFR6VnVRMFpzVlhSNVJVOXlUMGN2TUU5T0x6WlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtYlM5SUNrRlhRUzlPY0ZaaU9GUk1jUzkzY2s1bFJ6TkRVMDlWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFMHlUV3BWZUUxRVdUQk5NbEY2V2xkWmVGbFVTbXhOVkVsNVdsUktiVnBxUlhsUFJHc3lDbHBVWTNsTmFtaG9UMWRXYkUxdFdYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGdGJEVktWMEZCUVVWQmQwSkhUVVZSUTBsR1ZGQUtTVTF3V1ZwTU9HbHpWbWswUzNvd1YxcDBkV2MxWlZkRGQzQnNlVzl1VXpkdVJsVkhVa1ZWY0VGcFFqVnlWRVZTYTJWNlNVUTRWRXh1YlcxRFVFa3hjUXBvUzNST05uSklUVGhET0ZCWlRUWjBNRTlMWVhsVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUVZGbVpVZ3dkRlJzVmxaVWRWaEpjM1phQ21kUGEzVnJNM1IzZFRkeWNtdEdSR0puUzBWU1draFVNa0V4YjNWMVNGcGtkWE55WmsweFJXeFZXVlZMU2lzNFEwMUVlRlE1TVRoNU5rNXlVM2xZYmtjS2RqUkpOMEpNUTJ0WGVWcFRjRE00Tmt4VE16YzFOSEpNV0VVeGQySlBZUzlWVkVobVVqaEplRXRuWkVoVFRuaG5jVkU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667094782,
          "logIndex": 6134298,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "362510643d3ef1a2e122e2ff12896e7228a9ee2f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353706180",
      "sha": "362510643d3ef1a2e122e2ff12896e7228a9ee2f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

