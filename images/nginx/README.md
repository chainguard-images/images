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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:c076e443583a2b6bcd95a8bdddf136d81aa130ad824e46a5faf99465ab1d5b51`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c076e443583a2b6bcd95a8bdddf136d81aa130ad824e46a5faf99465ab1d5b51) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:c60b89d460d8923cc30ca86886906ebb3fff8ff59e368af95fd08fdfa5e30ade`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c60b89d460d8923cc30ca86886906ebb3fff8ff59e368af95fd08fdfa5e30ade) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:c076e443583a2b6bcd95a8bdddf136d81aa130ad824e46a5faf99465ab1d5b51"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "cab750a01d3678bc8730bf25f043298902d7c688",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBCEz0Q6gBIhP52DCKmMvtLvgj2gS0VYcVR+BBm8zcsyAiEAq9T87A/t6DF/WNFNufdzpGay+1n46PII+zLO4IO0ZB8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MTVhOGRmMWMyNzYyMzU0OGZiMzQyNGIwMDVmY2Y2MGE4OTBiNGE0M2FmMGMyMDdkMGMzYTM2ZWQ2MWFjM2VlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2t6STRmcC9zdHIvV29TSjhndlBHc2MrUkUwdmRGMEgvSVUvemtDVUlYTEFpQlFjVnJxZk5MTlhWTHFrRE1UcXJSWEdjOGVTNVVjU0IyUjNPTGp3TmdzNmc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlFYSnNTVWN6TlM5eVEyOXNiekY0ZWxOdGNHMU1VWGt6ZDBsUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlZHTjNUbXBCZDFkb1kwNU5ha2w0VFVSRk0wMVVZM2hPYWtGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5VW01aWRraEViR0pqWVVNMWFYWjRVVkpsSzFwRmJURnNXVXQxTWt4aGIyVkZOMnNLWWtsa1JsRmlSa3BuZEVJdmMxaFVURGd6Y0U0NUsyOWxhV1JRWTFCSVJtbFlMMm9yUTNsbWQzWkVOV3d6ZERGVGRuRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlVyT1c5QkNtUjJiVVZKWWxsUEwwTkhTM1phZGtOQ00wUTFZa1ozZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUjA1b1dXcGpNVTFIUlhkTlYxRjZUbXBqTkZsdFRUUk9lazEzV1cxWmVVNVhXWGRPUkUxNVQxUm5OVTFFU210T01rMHlDazlFWjNkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRWMWFsQkZkMEZCUWtGTlFWSnFRa1ZCYVVKRWRVVmxjRkZNY0RGTU16Vm5iamxCWjJoUk0yRUtiR0Y1VkdJNWFWbGpXV0pDUVd0a1VqQjFlVTV6ZDBsblZISmtRbGhMY25Wb1NFRmhNVXd2TTNCR1MwWTJSRnBvTTI5aFkyVjJWVTFDVG5nd2VsUjBUUXBEV2xGM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVU1SGVXaGlSeTlXVTJKcU5HSndZMUZZZUhvNVpEbDJVVkpSU21kc09YUlJVemRNQ21KYVlrZ3pjMVZUYlRrekwzVnRPRVpyTUdGWVpqVkdUbEJGVFV0cVowbDNZemhWZVc1SFZrc3ZOV3BzU1hwVmMzZGtWVVowVmt0Vk9HdDFNRFkyUlhnS1lYbE5Wa1pMUVVsdlFYY3ZTVVZtUlhBdmMzTjFiWGt5UmpsTGVVMXVSemtLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666026371,
          "logIndex": 5291725,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "cab750a01d3678bc8730bf25f043298902d7c688",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3267002541",
      "sha": "cab750a01d3678bc8730bf25f043298902d7c688"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

