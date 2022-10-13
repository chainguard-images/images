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
| `latest` | `sha256:cdf001bfdc116f504fc4637236e42289d5dbd2c9232834f19a8f70328c0a449b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cdf001bfdc116f504fc4637236e42289d5dbd2c9232834f19a8f70328c0a449b) | `amd64` |



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
        "docker-manifest-digest": "sha256:cdf001bfdc116f504fc4637236e42289d5dbd2c9232834f19a8f70328c0a449b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "81ae121942152dbed3fd4f26e7f93d3271ef96c9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/glibc-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD9skugre3iCcW3tiWAc6iZWkSzjaBL7aejYHndNklItgIhAMJPgLnlDoC0yEnE7g4xzYwsJX33PK1jGfWBGsJr6eza",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYTY5ZTMzNGM5ODQ4ZmQ2MTAyNmQzNWRlZWM4NjM1ZGE3ZDE1MGNmNDZhYmQyMDZjNmFhNThkOTM1M2ZlODZkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQmtKNGVlSkNzcFMzMzRHZmRvUm05RGtFU3Rib3NtOEFLZDYwa0dlSk4rekFpRUEvcnFtY0ZLRTRDbjBza2JSNDY5ei9GcmRLNmtIZEdoRWgvYTZ0UTVObmdRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVldYVlBSWHBGV1dsbWJ6TkxkR3hRTTB0ek9IaGtObEpYVmpKRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUbXBCTlZkb1kwNU5ha2w0VFVSRmVrMXFRWHBPYWtFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCVHk4MlMybHdZakk1V210Nk1GRlBiRVF3UzNBNFVGcDJORUl5Ulc1U1ptaEJiVmtLVjBFNGRVdE9aREZhWlVRdlFTOTRNVTFTTjJ4UGFISnNjblk1TUZscFpFdEVjM0Z5SzNCTGNtbDZVbTQwVDJGbVIwdFBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSYTBodkNrTkVjM2g2TVdoR1FVUm9hbGw1S3pkM2RWQlJjMVV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKM1dVUldVakJTUVZGSUwwSkhWWGRaTkZwb1lVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5WkhOaFYwcHFURmRTTldKdFJuUmhWMDEyVEcxa2NHUkhhREZaYVRrellqTktjbHB0ZUhaa00wMTJZMjFXYzFwWFJucGFVelUxQ2xsWE1YTlJTRXBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUVRWQ1oyOXlRbWRGUlVGWlR5OU5RVVZDUWtOMGIyUklVbmRqZW05MlRETlNkbUV5Vm5VS1RHMUdhbVJIYkhaaWJrMTFXakpzTUdGSVZtbGtXRTVzWTIxT2RtSnVVbXhpYmxGMVdUSTVkRTFDU1VkRGFYTkhRVkZSUW1jM09IZEJVVWxGUWtoQ01RcGpNbWQzVG1kWlMwdDNXVUpDUVVkRWRucEJRa0YzVVc5UFJFWm9XbFJGZVUxVWF6Qk5ha1V4VFcxU2FWcFhVWHBhYlZFd1dtcEpNbHBVWkcxUFZFNXJDazE2U1ROTlYxWnRUMVJhYWs5VVFXTkNaMjl5UW1kRlJVRlpUeTlOUVVWRlFrRTFSR050Vm1oa1IxVm5WVzFXYzFwWFJucGFWRUYwUW1kdmNrSm5SVVVLUVZsUEwwMUJSVVpDUWpscVlVZEdjR0p0WkRGWldFcHJURmRzZEZsWFpHeGplVGx1WWtkc2FWbDVNV3RsVnpWb1lsZHNhazFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bE5SMjVWUVVGQlFWRkVRVVZaZDFKQlNXY0tTakV4UTBwaFVtbFVaM2hQU0ZncmRWQnBZaXM1Um5acmNUazJlVFZ6VnpCbVEyaEJVR2d4Y2sxdFowTkpSMEZ4TmpOd1YxQkRaWFUzVjJZeU1EZENjd3BKWWtKT1RWaFVSRVkxV0hKM1JGTkxOV05EYUZsMlVXRk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlIzaDZhekEyUm00NWJXTXdNMlpNQ2sxbVJsSkViblZUYUVwbWFVSTFhMkpsUkZZM2JVSTVMMU56UkUwMWVVcEpiMUZLTTNOQ1MwZGhiREJ4ZDA1aE9HRlJTWGhCU1V0WGRqaFZWREZtYURRS2NYYzVRek5CVjNWdmRqTk5RWFJRVWxoSGMya3llWGhIZVd4blpERlVTVlZuZVVKS1lrSkRUSFJOZW5ScmJqTjFTVXhwZEVOUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665692773,
          "logIndex": 5049470,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/glibc-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/glibc-dynamic",
      "githubWorkflowSha": "81ae121942152dbed3fd4f26e7f93d3271ef96c9",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245452875",
      "sha": "81ae121942152dbed3fd4f26e7f93d3271ef96c9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

