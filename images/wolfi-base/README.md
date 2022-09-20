# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
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
| `latest` | `sha256:1a3c34b79b343775a7feb49cf57747c392d205910218c90274e60a46843e2592`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1a3c34b79b343775a7feb49cf57747c392d205910218c90274e60a46843e2592) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-manifest-digest": "sha256:1a3c34b79b343775a7feb49cf57747c392d205910218c90274e60a46843e2592"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "3afad013912c78f93581a937395e7829411d56ee",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQC8hj600Bvq4G/e4LJRy/Fq2qx1jAW64rLPt9p18rTYpwIgRogU68BBEg4M7r+owwToNGOUuwmSpcaQieeefal43xQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhZjFiYzk5NDMyMjBjNjhkYmJhYjdmY2NlOTA5NDFjOTdkMDIxODc1OWM2NTcyMTg2NjhmODQ1YTNhYTUyZmJiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQVBLZlR6MWtDN3dFak5WZVVJblQ4UUpJY2UrS2VUQUJrQ3BZdWJjUTE3MUFpRUE3L1lwdDBYZVNZOW5HUnJOdGRWcXpiWENob2FxRmhLa204T3NoY2RoeFNjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjJSRU5EUVRCUFowRjNTVUpCWjBsVlEwVTNaekZtZVdsR05rbE1ZWHBaY1RsaGFHWndNVXBrTDJGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZGbDNUbnBGZVZkb1kwNU5ha2wzVDFSSmQwMVVXWGhPZWtWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaZGs5WGQxTkpaRXR4TjJnMloyVnFUa1ptWW01bU5uUlhkVWxwTVd0YVQyaDZkMGdLUVZWbVRHVXJiM2d4VFhKM1JUQk5ibVJ4WXlzdlkzcFBOMVJUTTJrM1QybFZhamRtUlhkd1VFaHRRMkZEZEZGSlZXRlBRMEZ0U1hkblowcGxUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsZEZjNUNuTkNXbGxDVlhsSmNHbG1lRGhNUjBkeU5tVlhjVXRGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSTRSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkZXR1IyWTIxMGJRcGlSemt6V0RKU2NHTXpRbWhrUjA1dlRVUlpSME5wYzBkQlVWRkNaemM0ZDBGUlRVVkxSRTVvV20xR2EwMUVSWHBQVkVWNVdYcGpORnBxYTNwT1ZHZDRDbGxVYTNwT2VrMDFUbGRWTTA5RVNUVk9SRVY0V2tSVk1scFhWWGRJUVZsTFMzZFpRa0pCUjBSMmVrRkNRa0ZSVDFFelNteFpXRkpzU1VaS2JHSkhWbWdLWXpKVmQwdG5XVXRMZDFsQ1FrRkhSSFo2UVVKQ1VWRmpXVEpvYUdGWE5XNWtWMFo1V2tNeGNHSlhSbTVhV0UxMlpESTVjMXB0YTNSWmJVWjZXbFJCWkFwQ1oyOXlRbWRGUlVGWlR5OU5RVVZIUWtFNWVWcFhXbnBNTW1oc1dWZFNla3d5TVdoaFZ6UjNaMWx6UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtVVZJM0NrRklhMEZrZDBGSldVcE1kMHRHVEM5aFJWaFNNRmR6Ym1oS2VFWmFlR2x6Um1velJFOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWljREJXT0VGQlFVVUtRWGRDU1UxRldVTkpVVU40WTNSWlNVVkhMM041VDFOallVTTNNMjFVTkVWNE16RklOa1ZrWjFaQmNqZERZbGx3UjNOb1ZtbFJTV2hCU1daRmJVSkZOQXBRWmxoSmFXMXhUVEI2V0M5VlUxSmxabkJqTkdOR1dtWnVhMkZIUTI0MlZsSkpjbXBOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpqUVUxSFVVTk5TSFJWQ21wSmVtaERjMjVRU25WSFIyTkJVakZNZFZoRmMwUk9iM05oTjFoNE1HdHJWM016YkVKSFNXRjNjR3gwWjJaU2VYSlpOMlZUYkRKUFVrc3hUbWxSU1hjS1lqbGlTRzFGVTJsSmNuUTNUVlZMYjFsQ1l6WlZTbTlvVWs5Q1MyWlFiMjQwVm00eFpHbHpWblYxV1ZsU1dFSkhUak5PTXpSNlQxZHZibkZsT0RGU1pRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663690037,
          "logIndex": 3615160,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3091660105",
      "sha": "3afad013912c78f93581a937395e7829411d56ee"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

