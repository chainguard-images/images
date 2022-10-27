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
| `latest` | `sha256:f898c1a242eb0ec6fffff751ce31c9155dc36a89e041084e9fca90855953c87e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f898c1a242eb0ec6fffff751ce31c9155dc36a89e041084e9fca90855953c87e) | `amd64` |



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
        "docker-manifest-digest": "sha256:f898c1a242eb0ec6fffff751ce31c9155dc36a89e041084e9fca90855953c87e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1a829a29130434fa1929f511c423e647c67625c2",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEhl/8jxPbC3eBtqcUwsiIyj/aoKTZxwsBTu9N/nWxKUAiEA4+NJjMeaytIlPtjzN2Sjf0NDxVJcsO04IzXUpBJeYwk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlOThmZThmN2Q4OWRlN2ZkNDUzNjg1Zjg1NWQ5MmMwNGRhNzNkYWUwZjZiOTFkYzgxMTUwMThiNTNhMDFmOGQyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNvVnpKWnVFc0NnanM1a0cyS1JyU1Q5RFFsd01VaVNiQ0hWREk3OHpmNXdnSWdXVWpKbGl4QXBZRG83L1B6b01xNFU5MndLdGk1bGNFUzlLTHA3bVN2TlowPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlRqZDFOM0JYUjNka1JYZGlNa2cxT1hKSVVqVTFSRlJ0Y1ZRNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFVXdUV3BGTVZkb1kwNU5ha2w0VFVSSk0wMUVSVEZOYWtVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGVDBWa1dtcFZaM1JGU2xabFdrTnZkazVYV0d4VFoyUTJkamh0YVRaaEt5OVVOQzhLUlhOV2EwcE1WVEY0VURSUlVsQkpTbU5YYlRJelZrazNjMXBNYVhkRGRGVkROMVJ4TWxaUlFVRm9SbVJ3YURCemVHRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZIYTFkdENrNU5ZMGh5TkRkck5IbExkbmhwV0hCQ1QxSkdURmxCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSlpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkRTRTVxWVVkV2F3cGtWM2hzVFVSWlIwTnBjMGRCVVZGQ1p6YzRkMEZSVFVWTFJFWm9UMFJKTlZsVVNUVk5WRTEzVGtSTk1GcHRSWGhQVkVrMVdtcFZlRTFYVFRCTmFrNXNDazVxVVROWmVsa3pUbXBKTVZsNlNYZElRVmxMUzNkWlFrSkJSMFIyZWtGQ1FrRlJUMUV6U214WldGSnNTVVpLYkdKSFZtaGpNbFYzUzJkWlMwdDNXVUlLUWtGSFJIWjZRVUpDVVZGaldUSm9hR0ZYTlc1a1YwWjVXa014Y0dKWFJtNWFXRTEyWkRJNWMxcHRhM1JaYlVaNldsUkJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5RVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZGWVIzRXdNVUZCUVVWQmQwSklUVVZWUTBsUlEwMEtVWEprWVdKNkwxRnBWWEJLYm5wak1GRXZiWGd2V0dORGNqbFZUbmhHU1UxVlJXVmpVU3RuY2pGUlNXZGFWMmhIUzJORFMycDRkMjV3WlZKWlUzWjFXZ3BaUm5SMmMwbERSRkJHYlVoclZrWkxkaXRtTW5SV1VYZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hoQlRqVTFkMW93VVRGVFRteHhPVkE1Q25GdmVtVlFZa1pvVnk4MFprOVdRMHRvUmtWbFpVWlJUa3htVlVkRU9UQnFSRkpwWjBOclpreEZablEwVFdkTFRFMTNTWGRrZVUxd1ptbzNVRUV5V1VrS1ZWUlVSVGwxYmpGSU5IRk5ZVzV1TlhsUldVbE1aVFJQTDJoV1ZXVlJVSGQ2WkVScGVHTnZVa2xwUkVSYU9ESk5SbEp6TkFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666834939,
          "logIndex": 5947434,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "1a829a29130434fa1929f511c423e647c67625c2",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333862735",
      "sha": "1a829a29130434fa1929f511c423e647c67625c2"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

