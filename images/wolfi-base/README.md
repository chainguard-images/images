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
| `latest` | `sha256:5131223649d06a26c656aa24cc6e84ef363fe372833e20a74ca0c96b49406891`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5131223649d06a26c656aa24cc6e84ef363fe372833e20a74ca0c96b49406891) | `amd64` |



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
        "docker-manifest-digest": "sha256:5131223649d06a26c656aa24cc6e84ef363fe372833e20a74ca0c96b49406891"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c155f9c7632c22dd7c317de39935d63a0ea1bcba",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCmxotkoIemSbu13jE20KszxUnk5mk4FT84BtgXz1biogIhAKotqCWky9kZ/IdCoiGPfduBRqYDgPUH2Bl0yfzx8r1v",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNWEwZDE1NGY1MmI1NWI0YTk2ZjZmZWEwYjIyNGM0M2Q5M2Q0ZTg0MTNlZDY2NzczNGFmNTVlOTAxYTE5ODg0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR5OXQxK2cwOTJYbzVQRVJNU0pNWmw5b1ZPQVd3dCtXYTVYR1cxYVd6SkpnSWhBTnhkVGdZai8xOG1xeFVGTC9EVFVlc2V2VkZpRytMTWJNTzJkaDNyRERQMCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlkyaGpkbFpOVWt4M01Va3JNekZJWkdGTFZVdFhaMWh5ZFhCVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVjZUMFJOTkZkb1kwNU5ha2w0VFVSQk5FMUVSVEJQUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuY0hOQ2JUbFRSRzFMSzFWUVkyTjZTbWhuY25WclNWazVlV2haTnpsaFQwaDJkbW9LTm5ndlMwOUthSEV3VkdKWloyOVJTbVJST0ZkMFoybFFlV2hhWkVVM1ZVVmhUVGwyTkVJNFNuSmhNVzVPVFdsbVluRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5U0hOVENub3lVSEpWVUc5SVExRlRiMXBWT0dGSlRXcHViRm93ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFIwMTRUbFJXYlU5WFRUTk9hazE1V1hwSmVWcEhVVE5aZWsxNFRqSlNiRTE2YXpWTmVsWnJDazVxVG1oTlIxWm9UVmRLYWxsdFJYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U4eFVHOTRjRUZCUVVWQmQwSklUVVZWUTBsUlJIVUtNMUpVUWxrM1J6bEpWM0ozZWpOb1kzTlpZekUyZGpKRFZXc3ZkV3hzUzJWWWEwZDFOUzlVZWxOUlNXZFdTVmRsWjBWUGVXaGlaR016VlRWemJVWlZad3BQYkdSU2RtTlhOV2xXTjNCdlQwZENialZhV1N0T1NYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkQ1RVOHdXRkpMVmpOaE1GRkJlVmRrQ2swM1J6SjRWVXBRYUVka1UxTXZZV1pwVVdKTk9ETllPVEI2WTB4SmFqTmlZVXQ1VTJwT1JqbGpSMVpIYUVKelZVRnFSVUYzU1VsaWJVOVJRMWhKZURNS2IzWm5SVnBzVFc1VWQyWmtUbU01TDJWR1N6Rm1Oa2hpUlU1VlpVdEZUbE40YkhCeGRqTlZURmRZUkNzd1RGWldSRVpYYUFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665193122,
          "logIndex": 4666174,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "c155f9c7632c22dd7c317de39935d63a0ea1bcba",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208670069",
      "sha": "c155f9c7632c22dd7c317de39935d63a0ea1bcba"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

