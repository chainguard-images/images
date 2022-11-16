# glibc-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/glibc-dynamic/actions/workflows/release.yaml)

Base image with just enough to run arbitrary glibc binaries.<br/><br/>This image is meant to be used as just a base image only. It does not contain any programs that can be run, other than `/sbin/ldconfig`.<br/><br/>You must bring your own artifacts to use this image, e.g. with a Docker multi-stage build. If you want locale support other than `C.UTF-8`, you must bring your own locale data as well. This may change in the future based on user feedback.<br/><br/>See also [musl-dynamic](https://github.com/chainguard-images/musl-dynamic) which is an equivalent image for running dynamically-linked musl binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/glibc-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:bc043c7825c4eeaba344431a5e2d2aba39a446ceddabc99bf1f6f9e048d2777a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bc043c7825c4eeaba344431a5e2d2aba39a446ceddabc99bf1f6f9e048d2777a) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/glibc-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/glibc-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/glibc-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:bc043c7825c4eeaba344431a5e2d2aba39a446ceddabc99bf1f6f9e048d2777a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "557e05c8d088b7e51f4c73e72e04aa2ee047beb7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD4bOVAVRackFcFUfRlO1k1WCFY3P0j3dy7kNZJKIF2pgIhANaKW9ww+fkRApeWTGfC995PvR2ldxrZZanEHmunsYS1",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYThiYzQ1NTJhZWQ1MjRmYmQ5ZTEzZDYxYzczMmUzMWI1NmEwODBhM2I2OGE4YmY0MDVjYjhiZjhiYjQyOWZmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNwb3VDUTl4MmlCSzVmL05ZQ3FaeUlZU3kwTlEzdmNuV2U3MWVSQW0wVG1BSWhBSUQrVE9NNWhGeGFNajVaQWx1VXRJODFDQU1kNE94WUZXNTBqSzdxaklTaCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVRCRFowRjNTVUpCWjBsVlkzRnFRWEpoZUhneWQwMTVTakZEUWtGQ2IweHJSWFl3U0dsWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFbDNUbFJCTTFkb1kwNU5ha2w0VFZSRk1rMUVTWGhPVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhTHpaRlJqYzNlVmxVVTFwVVJFOHZSeXN5U1VoSGVHdENWazlPVm5wMmNrRXZNbmNLZFV0WVVuSTRSR1ZuWlhoUWRqTktVRXRYWVdoc1QxSnNZelpCTDJGMWNXSklPRXRxYVVFMlJIVmtSRTFFYlUxV01UWlBRMEZzT0hkblowcGlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSVkhkVUNtdFhUM0JaYlU5eFVFUnFkVEpPTW5OMkwwMW9RakpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDV1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUTBoT2FncGhSMVpyWkZkNGJFMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJWTVU0eVZYZE9WMDAwV2tSQk5FOUhTVE5hVkZWNFdtcFNhazU2VG14T2VrcHNDazFFVW1oWlZFcHNXbFJCTUU0eVNteFphbU4zU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQweFJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJabGt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRsb3llSEJaYlUxMFdraHNkVmxYTVhCWmVrRmtRbWR2Y2dwQ1owVkZRVmxQTDAxQlJVZENRVGw1V2xkYWVrd3lhR3haVjFKNlRESXhhR0ZYTkhkbldYTkhRMmx6UjBGUlVVSXhibXREUWtGSlJXWlJVamRCU0d0QkNtUjNSR1JRVkVKeGVITmpVazF0VFZwSWFIbGFXbnBqUTI5cmNHVjFUalE0Y21ZclNHbHVTMEZNZVc1MWFtZEJRVUZaVWl0TWN6QjVRVUZCUlVGM1Fra0tUVVZaUTBsUlJFWjRObmw0SzJsVGJrSmllVTVaUkVWWFkzTktjemRUZFRZMGVUZG1Xa050SzNwek4yMHphSHBTTDJkSmFFRkxWWFJ3U1RGcGJYWkNPQXBMZW5RNWNqUndNa0l4WW1KRlQyMURhekpDZFcxbVdsRmlka0pFYmtZck1rMUJiMGREUTNGSFUwMDBPVUpCVFVSQk1tTkJUVWRSUTAxRFRsbGlVMjFrQ2s5WlRVaEhhbmc0TXpnelFWYzNORkozTUZoT1lub3lZeTl1ZWpSb2JURjBRMUZVVVhkcE4zRjZXbFIwUlhwRFFqaE1Va3RMZFVGdlNXZEpkMVo0ZDBNS2NtdHdNRzFrVURkSlVYSjRaVkZOV0RaelozSTJUVTQzWjBoR1dXRkdXRmczVTB0bGRqUnNVR1ZqVFhwcVprMUVhek5GV1M5R05qWldhMHQyQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668564310,
          "logIndex": 7171560,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "557e05c8d088b7e51f4c73e72e04aa2ee047beb7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475758807",
      "sha": "557e05c8d088b7e51f4c73e72e04aa2ee047beb7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

