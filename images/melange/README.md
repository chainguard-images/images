# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:1a56af21a655a666ba1b54406cdc22f57753a3cbc6615c7056686614256e9842`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1a56af21a655a666ba1b54406cdc22f57753a3cbc6615c7056686614256e9842) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:1a56af21a655a666ba1b54406cdc22f57753a3cbc6615c7056686614256e9842"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "024d72049ee816f59557d4f122ecce1803c7a484",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCsTlq54CaQorc9IT2/OfadLRI/Bc3hjtC3QxyyZL9KUwIhAKa5BBGypgwjaE4mZtQvzQf5m+TggUDdGC0HIWvKiH80",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1OTI1NTA3N2UzYzNiZmZjOGZmMTVkZjZiYjkwYjAzNjQ1MGM1NmIxYjQxMGI4YWM1YWQ0NjUxZjhiOTEyNjVlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FTUNJRm5Wd2FnQmJsRlBXR3llV3Y3bTdPVWZZQm1TWlNWQmdaRFZRbjVlWXVSQkFoOW9JVFlmbXZSdlYvYlRhY3JpM0Y0NWdWUUs0ZGtXQnRNdDRNOTcxSjk1IiwicHVibGljS2V5Ijp7ImNvbnRlbnQiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSeVZFTkRRWHBQWjBGM1NVSkJaMGxWVjJkYVMzYzROMVpzZVZOWlFsWm5UM294ZUZveGRVOWphMFE0ZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwSmVFMVVSVE5OUkVFd1QxUlJkMWRvWTA1TmFrbDRUVlJGTTAxRVFURlBWRkYzVjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVjFTWGxqWW1wbGRsZ3ZjWFJ3YTFsak5VRlNkRmROTUdWUVJqQlpPVkoyYUhSTk1YTUtXbGh2ZFZSU2VXaHhiMlI1Um5WWFFXOU5kelpEYTJ4NVFpOXFlSE5QVWxsbU9YRktTa3g0VEZVMlkyWkRUbkFyYWt0UFEwRnNTWGRuWjBwUFRVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVjZRbk5hQ2k5UVJIcGljbmxCTXpCUGRUWnhSVkF2UlRablNFcHZkMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMkZSV1VSV1VqQlNRVkZJTDBKR09IZFlXVnBpWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYjFsWGJIVmFNMVpvWTIxUmRBcGhWekZvV2pKV2Vrd3lNV3hpUjBaMVdqSlZka3h0WkhCa1IyZ3hXV2s1TTJJelNuSmFiWGgyWkROTmRtTnRWbk5hVjBaNldsTTFOVmxYTVhOUlNFcHNDbHB1VFhaaFIxWm9Xa2hOZG1KWFJuQmlha0UxUW1kdmNrSm5SVVZCV1U4dlRVRkZRa0pEZEc5a1NGSjNZM3B2ZGt3elVuWmhNbFoxVEcxR2FtUkhiSFlLWW01TmRWb3liREJoU0ZacFpGaE9iR050VG5aaWJsSnNZbTVSZFZreU9YUk5RbGxIUTJselIwRlJVVUpuTnpoM1FWRkpSVU5JVG1waFIxWnJaRmQ0YkFwTlJGbEhRMmx6UjBGUlVVSm5OemgzUVZGTlJVdEVRWGxPUjFFelRXcEJNRTlYVm14UFJFVXlXbXBWTlU1VVZUTmFSRkp0VFZSSmVWcFhUbXBhVkVVMENrMUVUbXBPTWtVd1QwUlJkMGhCV1V0TGQxbENRa0ZIUkhaNlFVSkNRVkZQVVROS2JGbFlVbXhKUmtwc1lrZFdhR015VlhkS2QxbExTM2RaUWtKQlIwUUtkbnBCUWtKUlVWcFpNbWhvWVZjMWJtUlhSbmxhUXpGd1lsZEdibHBZVFhaaVYxWnpXVmMxYmxwVVFXUkNaMjl5UW1kRlJVRlpUeTlOUVVWSFFrRTVlUXBhVjFwNlRESm9iRmxYVW5wTU1qRm9ZVmMwZDJkWmIwZERhWE5IUVZGUlFqRnVhME5DUVVsRlprRlNOa0ZJWjBGa1owUmtVRlJDY1hoelkxSk5iVTFhQ2tob2VWcGFlbU5EYjJ0d1pYVk9ORGh5Wml0SWFXNUxRVXg1Ym5WcVowRkJRVmxUUkVWQ1ZEaEJRVUZGUVhkQ1NFMUZWVU5KUVZBelRtMUhUMHB6VWtFS2QzTnpOMWRKTjBSTkwwY3hVVmRTUTJSRlZETndTbkZpVEdsNmJFTkRSRFZCYVVWQk4ybDVZM05ZTVRFcmJqRmFkakpvYlU0MllXNXBia3d4YTJkbFV3cFRSbGhLUzFsTVoxUkNhUzlSWTBGM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzVVZkVVdqTmpXSFZrUVZCVGNUUkRWRTR5WjJOd1QwTlNDbmxTUVVONE4xUkRNbXg2VTJOeE5ucDROMnh2WTJ0UWEyeFBhR0p0WW5CMlluZFZhR0pGYWs1QmFrVkJOMUpxWkUwd1pFVmpRa2RIVEZaQmExWk1iRm9LWkRCM2VVNUxjRTVqUjB4TU5EZDJjazgxZEdsNWIyMXRSVEJQTDA1WlREUmlka3c1Y1dKSkwzZHliVlFLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668646188,
          "logIndex": 7239909,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "024d72049ee816f59557d4f122ecce1803c7a484",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484303804",
      "sha": "024d72049ee816f59557d4f122ecce1803c7a484"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

