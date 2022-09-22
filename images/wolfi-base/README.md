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
| `latest` | `sha256:89a48a7f6818907ca4a76d09fa07d0fabb2370096d7a2e579702aaad5e449d9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89a48a7f6818907ca4a76d09fa07d0fabb2370096d7a2e579702aaad5e449d9e) | `amd64` |



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
        "docker-manifest-digest": "sha256:89a48a7f6818907ca4a76d09fa07d0fabb2370096d7a2e579702aaad5e449d9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "04d0492e43fb88085796c38646d3958f59773bfc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEgD8Be02Fdavc+paFROJEOYt14mJrRtlkd5XjttY9MzAiBIgDSByevHt3JHXFXrmvtfPoFXDnzZkg8od5wA84Qwvg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZTQwNGFmMDBmOWI0YWQzOGY3OWI2NjBmN2FmYmIwMjBkZDhmNzZmMjM5ZjgzMTZjY2VmOTM3NDE4Yjk2Mjk0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNMYVIwcnRxY2t2bTQ1MzlSSC9BZ0swV3Q4cUtIMjQ2dTF6aG1MNlU2RGZnSWdVdlIrcU9xMXBCeEtrYlo3a1kwR1VEL2pDbnlRUmg4bW5kTlpoZUo4MmVVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlF6RkRhM3BOZW01NWFWZFVNalJEVkVkVlRWQmpWSE5pTTNvd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVXhUWHBKTUZkb1kwNU5ha2wzVDFSSmVVMUVTWGROZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4VDBsa1IwczNNR295Y1UxbFpVWmFWSEZTTmtNeVdscGhTa3hYVkVKelUxYzRSbllLVUhvdmNEa3JWRkZvYVV3elJuQXZlbFJJWTJSaldqaE5PVlZSWkZwa1VHbGliRXd4UzIxVVpuWjVXbEJrVEdwdk1tRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRVVVWc0NteFNkR1pIZW1GQ2RuWlVSMmxpY0ZVclQyeEpka0pqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFRXdXa1JCTUU5VVNteE9SRTV0V1dwbk5FMUVaekZPZW1zeVdYcE5ORTVxVVRKYVJFMDFDazVVYUcxT1ZHc3pUbnBPYVZwdFRYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1U1cE5XczFLMEZCUVVWQmQwSklUVVZWUTBsRlkzTUtZbkpwZFZBM1IxRmtjMlJ6VDJka1NuTnpSbTlDU0RKbE5YZFNTRmN6TDBSelltUlRjVFJRWWtGcFJVRnlSVEpzTkcxQ1MwSjJkWFZYYW5sM09HbDZid3BWVEVNeVVtWnpTbFJQVnpsQ1RtTnRTbXAyU1c0NFZYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlRXWm1SMWhEWlROVWJVeGxPVFUxQ2s5RmNHSXZla3BKVlc5c1QzSk9NMVpvVGpsS2VqaGtXV2haWTFOR2NqRkxhR053UzFJd2RtUnlRaXRTTHk5Rk1ERkJTWGRRUmtaTGJUQmxOM0JFWkdnS2QyZ3pTa3h3U0dwS2QybzVkbmgzVFZodE1Vb3hRbUozZFVwWVJIVmtUWGROUlZOQ1Z6WlpTR0ZMT0RCaVUyaEpNMDlrV2dvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663811608,
          "logIndex": 3714419,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102325462",
      "sha": "04d0492e43fb88085796c38646d3958f59773bfc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

