# node

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/node/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/node/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/node:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:8be990241d2697f4d293f0d52b3102253ad059b29e732acb39db4ea25762625a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8be990241d2697f4d293f0d52b3102253ad059b29e732acb39db4ea25762625a) | `amd64` |


## Usage

Minimal container image for running NodeJS apps

### Example

Navigate to the `example/` directory:

```
cd example/
```

The Dockerfile is based on Docker's [Build your Node image](https://docs.docker.com/language/nodejs/build-images/) tutorial, but uses the Chainguard node base image instead.

Build the application on the node base image.

```
docker build \
  --tag node-docker \
  --platform=linux/amd64 \
  .
```

Then you can run the image:

```
docker run \
  --rm -it \
  -p 8000:8000 \
  --platform=linux/amd64 \
  node-docker
```

...and test to see that it works:

```
curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing" }'
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/node:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/node:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/node"
      },
      "image": {
        "docker-manifest-digest": "sha256:8be990241d2697f4d293f0d52b3102253ad059b29e732acb39db4ea25762625a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "393f3fda92c7c7f1150ffa349f1caf5480bf7ff6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCG4oan4VdGg8QdqEtumutlfR9NZXaNh5u5m0eymVwdowIgd/zYnkNGsdiOHwtmxELyzmP6F13Vf0u/CxumFebpjLY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1YWVkMDg0ZjVjNzIwYTBjZTUxMzMwMWM1MWQzMTdmMDk1YmViMWVmNzIxNTkzZDA5NjY2N2IzNjA0ODI4NmE5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR2gxSUt6MGhDaHB0enBnU3NkK20wZFl4TzA4YzJxV2U2a3NSQUdQMGt5YUFpQWdEd3N5RndwaGVIelpDMmFXZUFqeG9YNGx5MEZHNTRLaW8rb1NpbHk4UFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwaFowRjNTVUpCWjBsVldUVTNNVWhzYmxScGQxRlZibFZ0V1hWblduaGxiMjVrV2taWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlZGRjRUa1JKTkZkb1kwNU5ha2w0VFZSQk1VMVVVWGxPUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwYjNGa05UVXliMVpqTW5reGNHdHJZak5OZEUxWU5XaHZWemxOTmpSVU9FaEpSMGdLZUdadFJqaG9UR00yVFVzMU5uUnNSMHRqVEhoRVVESlhRekYzYTB0TUwwWnBLM0U0VjB0dWJGWlVOMmszYmxjM2FrdFBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtUlZOekNuRllSWEJHVkhwelpIZENNMkpuTURGQlpXbzRaRTlOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNPRWREYVhOSFFWRlJRbWMzT0hkQlVVbEZSVmhrZG1OdGRHMWlSemt6V0RKU2NBcGpNMEpvWkVkT2IwMUVXVWREYVhOSFFWRlJRbWMzT0hkQlVVMUZTMFJOTlUweVdYcGFiVkpvVDFSS2FrNHlUVE5hYWtWNFRsUkNiVnB0UlhwT1JHeHRDazFYVG1oYWFsVXdUMFJDYVZwcVpHMWFhbGwzU0VGWlMwdDNXVUpDUVVkRWRucEJRa0pCVVU5Uk0wcHNXVmhTYkVsR1NteGlSMVpvWXpKVmQwcEJXVXNLUzNkWlFrSkJSMFIyZWtGQ1FsRlJWMWt5YUdoaFZ6VnVaRmRHZVZwRE1YQmlWMFp1V2xoTmRtSnRPV3RhVkVGa1FtZHZja0puUlVWQldVOHZUVUZGUndwQ1FUbDVXbGRhZWt3eWFHeFpWMUo2VERJeGFHRlhOSGRuV1c5SFEybHpSMEZSVVVJeGJtdERRa0ZKUldaQlVqWkJTR2RCWkdkRVpGQlVRbkY0YzJOU0NrMXRUVnBJYUhsYVducGpRMjlyY0dWMVRqUTRjbVlyU0dsdVMwRk1lVzUxYW1kQlFVRlpVa2xLU214NVFVRkJSVUYzUWtoTlJWVkRTVkZEWVRSeVluUUtjbGxqVFRaaFkyazVURWhKTWs5RWVHdEdVbXhJY1hkeFMyVTFTVmc0UVZONFJ6ZzVOWGRKWjBRNFUzUXpLMGh0WWk5bGNtcGFjV1psZUVoNWVVazNUd3BUUVRZMFVYRlNMMHBWTURZNVMwWlhjMVEwZDBObldVbExiMXBKZW1vd1JVRjNUVVJhZDBGM1drRkpkMkpGUmpndlJtUjJRVEZ2YjJsMmVsTmFjRnBXQ2xwbGFFTXpkakpWVlhKTEwzcEdjakJMU1ZkUlZrUjBUbWRDV1VSd1dUWlVZVTFJZUVobFRFODJNMkZpUVdwQlpHNXZSakY2UTFGNFN6Qk5kM0pISzBZS1IxTkZNRVJSWVVOek1ERkliRzVXTlZCak9XMDVaelJtYTIwck4wNW5ZMnd5U1ZkRmRtSTBXR1JzY0VwNVltYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667657673,
          "logIndex": 6563233,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "393f3fda92c7c7f1150ffa349f1caf5480bf7ff6",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3400406451",
      "sha": "393f3fda92c7c7f1150ffa349f1caf5480bf7ff6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

