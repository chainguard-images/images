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
| `latest` | `sha256:55d5daf95641bd027c91e29ff6384124afd0027f17f625ce496843e68ddbaaf2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:55d5daf95641bd027c91e29ff6384124afd0027f17f625ce496843e68ddbaaf2) | `amd64` |


## Usage

Minimal container image for running NodeJS apps

The image specifies a default non-root `node` user (UID 65532), and a working directory at `/app`, owned by that `node` user, and accessible to all users.

It specifies `NODE_PORT=3000` by default.

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
        "docker-manifest-digest": "sha256:55d5daf95641bd027c91e29ff6384124afd0027f17f625ce496843e68ddbaaf2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "111db084b0acb33796f08faf405f96967f579239",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDL8wmNrALEd9eWoXjej4lvZcYiOb+XtJ0aUH2v5iqZfAIhANkGyCPsw+355WYS21Lo32Jtog3wLTiQLP+l8KrV046P",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNGZhOWYwYjZkM2M1ZWUzZjk2MTJmYzRlMTQ2NTYyYTE2Y2UwZjAxYzA5NTEzYTUwMmJmZmUwZmUyNjQ3YWFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJREduNTZvTktiV2lzQVpndzlnZlUvb2FWUElBWXI1eDBsUExua3JDUEVJNUFpRUEvUkxCS2ZNdHQ2TlNZNWVJV2J5ditEcFpzRUt2ZlduTE41UVNGTHpUd0J3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhreVowRjNTVUpCWjBsVlFrVkJTMmhqTDA1QmJrNDNXalZTT1ROdlJISnFialF3YmpWTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVjNUVlJKTkZkb1kwNU5ha2w0VFZSRmVVMUVSWGhOVkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDZG1ob04xUm5UWGR3TmtzMlNtUnZiMGcxZFU5YVFUWnRMMUZEYzFoWGFGWldibEVLVGxoNksxWkJRbGgyZVVSQ2IwMDRNRzFWYVhCeGNpc3dORWREUlhBemFsbG9Uek5uTms1MlJIVkNOMmRSZDA5WWFUWlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ6YW1OcUNqSlZMMGMyY0U1a2RtSjFPVGQzV0hZd2JYcHFPSHBWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUkZlRTFYVW1sTlJHY3dXV3BDYUZreVNYcE5lbU0xVG0xWmQwOUhXbWhhYWxGM1RsZFpOVTVxYXpKT01sa3hDazU2YTNsTmVtdDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVuQlhlRzVwUVVGQlJVRjNRa2hOUlZWRFNVVm5WMlZ2VEZGcU5UVnFSamh2YW14TVdEZ0tXVmR2WWtOdmFXSkRWMFJYWTFaNkwyOVJSRGxRVFdWUFFXbEZRVEJLZUZGalVIRXphR1V3TWtoV2JVUm9MM1V2U1VWTVZtczNTUzl3WVhoS2FVSk5UUXB1VnpKb05uWTBkME5uV1VsTGIxcEplbW93UlVGM1RVUmhRVUYzV2xGSmQwRXhWbVZXUm05SVIyRkNURTVyUnpkcFZYWTBkWEJCTlVsSE0zSkxUVXBqQ2tRNVdsSlBlVzFGYUhRNVluRnFLMjl4YmxaSU1ESkZWMnRaYldKVE1XWjBRV3BGUVRKaFVTdE1jbVJNVlRjd1ZESXZWV2hKSzJ0b01qazFNV3hLT0hRS01uTXlSbkE1ZUVGcFkyMDBlVWx2Ym5SbFVGbHhVMGhzVG1kaWREWTRZMkYxY0RKMENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668214892,
          "logIndex": 6903957,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "111db084b0acb33796f08faf405f96967f579239",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3448936407",
      "sha": "111db084b0acb33796f08faf405f96967f579239"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

