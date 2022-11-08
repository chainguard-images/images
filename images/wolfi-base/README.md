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
| `latest` | `sha256:ff4fba0eff8ea4e97efba5ca6e2880812a63d09198822eb476202dcc4e089b78`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff4fba0eff8ea4e97efba5ca6e2880812a63d09198822eb476202dcc4e089b78) | `amd64` |



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
        "docker-manifest-digest": "sha256:ff4fba0eff8ea4e97efba5ca6e2880812a63d09198822eb476202dcc4e089b78"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f55e76087f6bbae95ca1500493c68b73e4768aa5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBoIZlBIZHaQmYMN4e/JPyeafkJNpU/bE5AAmHhTEpzHAiEApDSDN5Hvx1znOURu1ODSbCoh3KuX+nd0DVQJ/oXLbnk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NzE4ZDRiYzAyZmQ1NDA3YmJkYTU5OGNjMzY0NTUzYmRkZjBmOWRhOWVlODFhNzAzYzEzYzcxOGNlMDY2N2FhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQWNaYTl5NGVvdkczTXJCTG1XdHFiTnlOY3puMGJCMHlkNm1WRS9qaTZnTEFpQTRKemQvR3BLb3kyd2NReG9qQ2t2T2ZiRktBY3dZaFVUQkRlYUJrRHlPQlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlZYQkhNMmd4U0ZkRGVGWmFOMnRvUVROMmNsUjJkR0p0UTFGTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVjVUbnBGZWxkb1kwNU5ha2w0VFZSQk5FMUVSWHBPZWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwTTNJMUwzbDVibWxhV0hSWmIzWmxXV3BuWm5rNU5XUTVhekpWUzB0TVJsbElSek1LYURKbmIxVjNja1ZUWkVwUGQyeHBWVlJvY214cVlVeFJXRU5SY2xZeE5WTllZMkpCUlVjMlNrSnhLMmRCT1cxVlRXRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQVHpVNENqQkJTMFZGVlRaUmJHbElhWEEwUWpKaFlVRklkblpqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxa3hUbGRWTTA1cVFUUk9NbGt5V1cxS2FGcFVhekZaTWtWNFRsUkJkMDVFYTNwWmVsazBDbGxxWTNwYVZGRXpUbXBvYUZsVVZYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKVk1sUnhiMEZCUVVWQmQwSklUVVZWUTBsUlJGSUtWRFF2Wm5kQmJFODBhelIzZUZsT2VVY3dSa1pIZHpZM1VIbHVXWE50UlcxeWRrZGhjbUl4ZDFsM1NXZGxUVmhxYTNSVFpWQm1kV1F5TVRONlFrNDVhZ3ByYVhaYVVFd3pkMDFGV25aNFVXUXlNRkpTWkhWQ1NYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkVGRtRkVXVzFRTWpndmJVdE9SbWQ1Q214S01HSkxjRzh6VGtVd2VsbFJiMUZhY25kd2NtNWpaa1ZMT1ROeFEwcDNiWHB0VTJ3ck1IaHpaMHhVV0RCRWRFRnFSVUVyWjBoMVprUnlTMWxpY0hnS2RVaDRXRFpJTTFsSFZtWjVjR05qVEhCWlkwOUhNRVJFVFRreGVFbzNlaTlZVTNKVVF6SnFkblJYY3l0WWNtc3plRVpaUndvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667870838,
          "logIndex": 6704292,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "f55e76087f6bbae95ca1500493c68b73e4768aa5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415570325",
      "sha": "f55e76087f6bbae95ca1500493c68b73e4768aa5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

