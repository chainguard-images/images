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
| `latest` | `sha256:bb0a19dc98673698bcd0eac975112d5c9b68347ebcde4f09134be4f2a81b97cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bb0a19dc98673698bcd0eac975112d5c9b68347ebcde4f09134be4f2a81b97cd) | `amd64` |



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
        "docker-manifest-digest": "sha256:bb0a19dc98673698bcd0eac975112d5c9b68347ebcde4f09134be4f2a81b97cd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "72c5900da4903db7fa932c76acc3e6834dadfd4d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDk8qGgBTpuR04KpUeOGkHPz12EikhY0SkepQaG4wHpAAIgeOFfKAxqx6i7ytJuUfu5w3jzu9B2yPPlv6K4yEKJcKU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZjkxZWMwMjljYTc5Mzg3YmYxZGViMjg5YjZiNzMyZDJmNDRiMmYyY2Y4YTRlMjc3M2MyMjk4M2QxNzM1Y2IzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDU1byt1bk9kQlpsSFJveXVScW1kZ1JUM0I5TFNrUTlCK2RmakFuL3JqQUFpQjUybmNMcHJsM2tpaW1JN3d1OEhQZDhKbkhmdVBRZjc2eU9NSlFQQTVaWkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlZrbE9jM1EyU3pkdGRFTnJWMlJaTlhoQmNqQkZOMFZGTDJJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFVjVUa1JKTTFkb1kwNU5ha2w0VFZSRk1FMUVSWHBPUkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyTWxkSFpXWktVak5XYlhCTWNqWkxXWG95ZGt0SFZVZFJRakJpYW5SWFVEYzBORThLWlV0U09WVXdkR1YxYTBWUFVqSjRORzlJUkZoRGRFdzFNREZMYmxZMllsSnpZbHBpTVRoNllYQnpVRFpGV2pCUFFuRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGU3paeUNqVk9kVXB3YkZSVFFUZHhNQ3MwUkZGMFFsQlJaemc0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJHTjVXWHBWTlUxRVFtdFpWRkUxVFVST2ExbHFaRzFaVkd0NlRXMU5NMDV0Um1wWmVrNXNDazVxWjNwT1IxSm9Xa2RhYTA1SFVYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKNmRrNTVZVUZCUVVWQmQwSklUVVZWUTBsR2JVOEtUbEV6YVV0VFNXaGFTMWhRVTJ4bEsyb3daSFZEUmxWUVVXRlBlRzV5TUdWVVZqZDJXRFJCVkVGcFJVRnpjRTA0U0dGVWVrdFZTWFpaYlVWUFZWSTVhUXBSTlRFelYwMDJSRWhhY0dkbFNrc3JRbGh0VDJGUVZYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkVlZETTFlbFZKVW5oMU1YQktla0paQ25ab1dIaG9hM0I2VnpKbFNreFhjM2h2UjFaSFpta3JjVWcwVlU5cmJWQXhhVlUzU1RCVmMzZDRiRXRCTlRORGVFRnFSVUZuVkRObllWRmlkWGg2ZFdzS1ZXVTNPVTkwYURsSFYzTlVPSGd3VDFGbFYwRm9kMHB0V25kTlFUSmhaVmQyYTFvMWFFazVTWEYyVDBoUlZEZFFNRlY2YXdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1668389073,
          "logIndex": 7023067,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "72c5900da4903db7fa932c76acc3e6834dadfd4d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457811888",
      "sha": "72c5900da4903db7fa932c76acc3e6834dadfd4d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

