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
| `1` `1.23` `1.23.2` `1.23.2-r0` `latest` `mainline` | `sha256:7f3b8edac0692519c2d3f70a3a20d31f871a6b001d05e1943fc46abdefe53348`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7f3b8edac0692519c2d3f70a3a20d31f871a6b001d05e1943fc46abdefe53348) | `amd64` `arm64` `armv7` |
| `1.23.1` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.23.1-r0` | `sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ef537a031641f9b56e7e52c57dffdbd6ec8749b330114d77343567f733298cad) |  |
| `1.22.1` `1.22.1-r0` | `sha256:045d8776c68d37fb757a733595dbca7211cfd130e7c53b0899e0a936870e5eba`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:045d8776c68d37fb757a733595dbca7211cfd130e7c53b0899e0a936870e5eba) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:7f3b8edac0692519c2d3f70a3a20d31f871a6b001d05e1943fc46abdefe53348"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "286ea3b9814f301a6dc17f2a2c8196aa5942c94c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDHZBy2e6FEDkLpi07jDkBGRofAO7HXRzyD9AsdB/ph6gIhAOPvPoYTrh5PBeFSFCodFCSSrvaEi0V5NIxKH+ehei1C",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNzNmYTdmMDBlOWZkY2MxMTBkNTU2MzczZDdmYzU1ZGZjZWViYWFjYzViMWMxMmRlNjQ1YzM3ZDQ0NzFkYzA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQmtCeVVKcVpyUDFxR0FRbHZpcEpOOFZwNEZuSGdwVDJ3clhEYmVzM3lsNEFpQWtYZWNpK3piZEVBKzlWK1NEUytqWVZpZkM2ZUJvVjJqTktFcFE1K2JDQ3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVlFXWTVNMk12UkRCdWVqTk9aMVJXUmlzNGFIaFJUazlHT0hwUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlZFMHhUMVJWZWxkb1kwNU5ha2w0VFZSQmVrMVVVWGRQVkZWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxWjJkQ2NrYzJZVVpzWVU1U1luQkhNbmQ1SzJWRE9VSlVSbEZ3UmpGeVlYa3hMM2NLWm1FMFRrb3JhbmRCU1hoSVNrMTNRME16UXpkYWVUaDZZbEJwYUZaS2NTODFVVlp0T1VsdUwxZHdWVXh3TWpreUswdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqTjFkTUNuZDNORFZrTW5kMVNsSnJkRWxqVUhaS1ZuWm5lbGxyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkVrMFRtMVdhRTB5U1RWUFJFVXdXbXBOZDAxWFJUSmFSMDE0VGpKWmVWbFVTbXBQUkVVMVRtMUdhRTVVYXpCTmJVMDFDazVIVFhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZCamNVVkhkMEZCUWtGTlFWSnFRa1ZCYVVFNVpIRmtRV2x6YlhGR1dEQTJNWFJ4TmxvcmMwUUtVVkpWZFNzdlkzZHBjMGQzVTNrelREUllXbXN2UVVsblNTOXRNMnQzVFROaFVsUkpNREZPVEc5c2RtbFdSVE5yWkZrM01FbHJlbEpIZGtKb2JYWjBZZ292U1RSM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzUkdOaFJWWk5VMmRuWW5SSlRWa3hURGRWZVVNM1ZtVkZRMU5ZWlZsNGFHNUNVMFJyQ2xBMmVYSnZhMU50VGs5MlNHRlFOVlpVVkdwd1dWaFRTR1JXVVVWQmFrRXlkM2xXV21KTWRXODBlR1JTVWpSeFJVbEpjbmwzUlV4b1dWSk5ablJVYmxRS2RtMVNZVkpoUVd4MVlXMTZia2czTlRrclRHcFVWMEppU0RrNUwwMVljejBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667484002,
          "logIndex": 6426802,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "286ea3b9814f301a6dc17f2a2c8196aa5942c94c",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3386183006",
      "sha": "286ea3b9814f301a6dc17f2a2c8196aa5942c94c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

