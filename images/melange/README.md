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
| `latest` `v0.1.0` | `sha256:34324cc9fdf5f6d09182dfda628e72ced7a3c13065793d9b542bf93885750fa0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34324cc9fdf5f6d09182dfda628e72ced7a3c13065793d9b542bf93885750fa0) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:34324cc9fdf5f6d09182dfda628e72ced7a3c13065793d9b542bf93885750fa0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4118ac86e39658c02b46854ed168a60fc01e6bee",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCAOSv/E7XMIP67clo/dobvAT5Qo8nxF+jeQiM/qOqT8QIhANPQWhbWxCuq9B23PVGABR0/YENT56AHbN83zDzPQ8NH",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNTVmNDE2MTdlMmI0MTlmMTk0MGExZGE3ZGIyMDBmNWEyMGVmNjM3Nzk5MTBiMDY0MjE4MjdhYzI2ZWQzZGE0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURvVVR6U3VwQldnY0JqL3kwM1NFMS9Xam9LdEtib2NzS1NDWnpPOEVYT09RSWdkbVZrY1doSmwwU3BRWXZudGxyQ1dmazlTWExwVW8zTzQzTGwwVXpuQ29RPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwUFowRjNTVUpCWjBsVlRVRmxVa2xxY2pSWFVWTm1lRWd5Umk5SFdWbHlkekJoVkU0MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFVjRUVlJCTVZkb1kwNU5ha2w0VFVSRk0wMUVSWGxOVkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKUmxCTVVFNUVZM1ZsUVc1MlJIZDVTVTlZYlVrek5XcHJZVUZLYWpWUmVISTNUM2dLY0ZGcFIzZDFRa2dyVW14WU5XY3pTVlJKVFcwNE1XaExTMFE0ZFhCb2RWVlBieTlSTDNCMlEwZDRNMGs1ZEc5MWVrdFBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyUWpCWUNrSmpia1l3TWxSeGFVNDBjM053U0ZReFltdFBUUzlGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFVVhoTlZHaG9XWHBuTWxwVVRUVk9hbFUwV1hwQmVWbHFVVEpQUkZVd1dsZFJlRTVxYUdoT2FrSnRDbGw2UVhoYVZGcHBXbGRWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUWFtWnZlVkZCUVVGRlFYZENTRTFGVlVOSlVVTnFWemxMVWtacFltNEtNbVZRVEhKT1NYZzNkbWxRWldsV1pHdFRTbGsxSzFwcU1uaFdWRE5wUW14RlFVbG5UVWw2VWtWWFpTdFFUblZ6ZUZoc01HYzJhblprVDNKRWJDdG5OZ3ByTVd3clZVOXNTbVpqUzNSb1JtZDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRlJRWGRhWjBsNFFVbG5kVXBhVGtGM2JVYzVLMUU1ZEhaeEszVXdVbHBOQ21SbU1VbFBPR2ROWWtreFozZHdkbU0wVVRVMFNUZFlLM2hhYlZSWVRDdE5TbXhKYlVKaEsxaDRkMGw0UVVwTk4wcERSVFkzT1RsaE9IUjNlbnA0UkZrS1lrVnZibGwwVjNWcWRUUk1ZM2xXVmpRMlluQldTblIxZHpRMVdHMDJkazB3VXpoaloxZ3JRa3hOVmxCb1FUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1665969082,
          "logIndex": 5246834,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "4118ac86e39658c02b46854ed168a60fc01e6bee",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261579228",
      "sha": "4118ac86e39658c02b46854ed168a60fc01e6bee"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

