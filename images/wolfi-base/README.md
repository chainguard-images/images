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
| `latest` | `sha256:378b98adac748bc9b13d6719052a355aa630347410ca8027b2d33d5dd6534769`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:378b98adac748bc9b13d6719052a355aa630347410ca8027b2d33d5dd6534769) | `amd64` |



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
        "docker-manifest-digest": "sha256:378b98adac748bc9b13d6719052a355aa630347410ca8027b2d33d5dd6534769"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "d6c639218395ebe6268ca2367be34407885b7df2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICoiMK3yIYaEOGHBxNmX9nUMA79tokqtVhtseEr6KVquAiEA4tJXQobyM4FJI8T+E9SYdX2nYcgj0rtnyhvqbE/3oPE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5MGMwMWRjOTExMTZiMzc5ZDg4YTQzY2Q3MjBmNzk2NTA5MjNkODQyMmRiY2ExNzJkMjgyMjBjNWJiN2U4M2U4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURIWkRvOG5BS0ovQ0dYRDU2aGExTC9Hdm8rbUV6VTRWMkZOTER1QmMrZ29nSWdidC9CYkJsV2svOS83ckJaVGpORG12TnpmSGEwVkRIdkQ1eGdlc3BDMnRzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwdFowRjNTVUpCWjBsVlNYWnZkV0prVUdZclJIZDJTMk55VTB0c1ZVcElaUzlNUTBJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RWTlJFVjVUbnBKTWxkb1kwNU5ha2w0VFVSSk5VMUVSWHBPZWtreVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuY2pKR1ZYVkVNVXB6Vm1abFJpOURUamx5YlVJeE0wTjFWVXBGZDJzclVsRnZhVklLVjFJNFZXVnBSMDVEVVZwbmRIVTFhWFp0WldKNVdtRk5kMDA0YWpndlpua3hWemM1WVVSVWJXRlBNVmxSVVhjM09EWlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1TUdWQkNsY3pPQ3RDYWxCMGVWUlBVREZJVUhRNFNXbHlZVEJ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIxRXlXWHBaZWs5VVNYaFBSRTAxVGxkV2FWcFVXWGxPYW1ocVdWUkplazVxWkdsYVZFMHdDazVFUVROUFJHY3hXV3BrYTFwcVNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGb1YyUmplRUZCUVVWQmQwSklUVVZWUTBsUlF6QUtOR0p4Y2xsR2JreDZVWFp2UjJ4a2JGaHFXVFZvTDNOVk9EWmpaMkl3UzFsT1MxbFljVEY1UlZOUlNXZGhaVFZ0VlZWV1l6WXdSR0ZqVEdGclUxZDJTd3BTY1ZneEsyRmtia1JKYVdZMVIwRnRkeXRQU2tjck5IZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlWRkJkMXBuU1hoQlMzUjBWMDlhY21kaVUzRTFOazFyQ2sxeU55dE5OaTlFWlVaU2EySldRa3RLVmpaNWExZE1SbFJLVEZadFExWTRRVkJHV0dzdlIxVmFMMVl6WkVRNVRVUlJTWGhCUzNaSmEwUk9TbkJYUTFBS2VWcHllRmszV2podGVYa3pLeko0T1dNelRFaG9XVmxzU0hjd2RtUkZTVzVWTW1aemVIUmhkQ3RPWldNM1oybDVOR0ZxSzBwblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667006853,
          "logIndex": 6074693,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "d6c639218395ebe6268ca2367be34407885b7df2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3349559492",
      "sha": "d6c639218395ebe6268ca2367be34407885b7df2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

