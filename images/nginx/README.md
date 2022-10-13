# nginx

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/nginx/actions/workflows/release.yaml)

A minimal nginx base image rebuilt every night from source.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:1e6a66869d57449f475a8abc2d973aadd4b02b4361927aba1da77099d34092e8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1e6a66869d57449f475a8abc2d973aadd4b02b4361927aba1da77099d34092e8) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:3f85673bd528e5e611653814a67c6ebdcf14f5751e90513e730ade1b79a9f506`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f85673bd528e5e611653814a67c6ebdcf14f5751e90513e730ade1b79a9f506) | `amd64` `arm64` `armv7` |


## Usage

To try out the image, run:

```
docker run -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see the nginx welcome page.

To run an example Hello World app, navigate to the root of this repo and run:

```
docker run -v $(pwd)/examples/hello-world/site-content:/var/lib/nginx/html -p 8080:80 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080`, you should see `Hello World from Nginx!`.



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/nginx:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/nginx:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/nginx"
      },
      "image": {
        "docker-manifest-digest": "sha256:1e6a66869d57449f475a8abc2d973aadd4b02b4361927aba1da77099d34092e8"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "4d3de184508fde3048b0ff7e10afe4d0c7495e6c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEdhPWCmm5kFgTzBi+fG5uHteEd/o02AQF7EDZnFQ2JWAiASsaZk3hy0X2y79XhUu+Cy8EALc/t6Lu2+sxy1Hw40yg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxYWU4OTllZTJlMTUxY2RhM2YxMDFjNmM5MTc4NjU3NTgxMjkzZmQ4ZjQyMDRkY2MwY2FhOWJkYTkyNjlhNDU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRTZLTWw1V0Nadlp4dGY1UDdVV01kM0R1NW9uaGs2N1Vza2VLMFpDZXh1ckFpQTB1bVJUbXAzbDltWmVhZlV2Y01ua283aHNQbU5wU2hSWUtwbGtod1NYbmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlNreElSbXBwVlRaNlJXdzBiM1ZZTDBWc1VtVTRTbmx6U0RSM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFbDNUbnBWTTFkb1kwNU5ha2w0VFVSRmVrMUVTWGhPZWxVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2UlUxVWJscHljbTlTVkZSUmF5OWxSMVEwZGxWSFJITkhTbk5sV2pCeWFrNHpjVW9LVXk5UE1tSnFVQ3NyT0hWRFIwdDJVMEZOZFVjMlVGSnBaR1JDYlZBdlJqTlBlR04wVFVkR05VUkdORnBsT0doTlIwdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUyU0cxV0NuVkxTRWxyZW1OM1JsZHJLeTk2YTFoRmRFbHJORkpqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkZKclRUSlNiRTFVWnpCT1ZFRTBXbTFTYkUxNlFUQlBSMGwzV20xWk0xcFVSWGRaVjFwc1RrZFJkMWw2WXpCUFZGWnNDazV0VFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhwNGEzUkhaMEZCUWtGTlFWTkVRa2RCYVVWQmJrUXJPWGRoU1cxV2VERkRWa3BMZUZWaVEySUtlVXByTUZCQ1RFTnhOREJuT0VSWGVXNUhTMWsxTUdkRFNWRkViVGg1YkRoclJVTlZUakpWZEVSNVltVlNOemxsVG1oeGJqSm9OMWt5ZUVwdlUxaFNZUXBpT1VoVGExUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQmJEVXdPVTl1UVdsYVRVRmlhSEZHYTB0NlJtbE9Ra05WY2lzNGNUaHlSMWcwQ2s5aFVIQklLMnQyZFZWclpHWllVbTEzV2tkeVIxaDZkVEE0UWxwSGVFMURUVkZEWmtkUFVqSkJkVEZDZVhWRlIwTktZVzFYZWxsUWRqVm1XWEJIYTJZS0szazJhbkZFUldOVFFuWnBlVUZGVmtGNmN6UkxNa2xDZG1OeFN6Rk9VRmN2VVdzOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665626893,
          "logIndex": 4998681,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "4d3de184508fde3048b0ff7e10afe4d0c7495e6c",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3239052562",
      "sha": "4d3de184508fde3048b0ff7e10afe4d0c7495e6c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

