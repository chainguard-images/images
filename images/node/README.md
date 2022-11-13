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
| `latest` | `sha256:8e7c420d6a6079dda515c116f8d5d3c5e723b6ab74b872405602e3ee0e909c31`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8e7c420d6a6079dda515c116f8d5d3c5e723b6ab74b872405602e3ee0e909c31) | `amd64` |


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
        "docker-manifest-digest": "sha256:8e7c420d6a6079dda515c116f8d5d3c5e723b6ab74b872405602e3ee0e909c31"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8336b336d5ab16ecf43610760c24db2e8485d240",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIBOKenEhXbybAZ0bvQkF1eDzFR3PbiDNst+THyUg+SY/AiEA3NXvRhbmjT/NeiX4F9aDnneSlgsn0mo6rW4aRbVqvLk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NWVmYjI3ZTNjY2MyZGIxOTg3MDQ3NjU3NDUxM2NlNTVjYzdkMWI1MGMyZTliMDk0MzdkMjM1YWRiM2Y3MTFlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWZnNXdkRFpqa3psdkFiQ1BHQnN5ejRKaGF0RnJqdVFmVkkvSjdUZmVRVUFpRUFvdXU4NTVjeTRKR1hyZmZVeDdVQXh5VmpldXFweFQ1ZzFmUGFlRUZrUjhRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlFrNUlaVkpRWkRSck5GbEdjVUpWUWxCcllYZHZMekV2VWxKdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFRXhUMVJKTlZkb1kwNU5ha2w0VFZSRmVrMUVSWGRQVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6U1d0bmVUazVjbWxETkdkTGJXNVpjSGxTTm5wSWVFWjFRbUZTYkd0TVJYRlRkMElLYm1wSmNIZGtSVVo0YTFkNVpqZGtlbFIyUlZCTmVHSk1haXM0YUhNMmVrOXJNVUZ1YUZWWlRUTlRTVUkzWVV4U2VrdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtY21KVUNpczJNbU5CTkVwRWJVaG1SMVJXY0daaVdWZEVSRUZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUm5lazE2V21sTmVrMHlXa1JXYUZscVJUSmFWMDV0VGtSTk1rMVVRVE5PYWtKcVRXcFNhMWxxU214UFJGRTBDazVYVVhsT1JFRjNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVuVm1ObFpTUVVGQlJVRjNRa2ROUlZGRFNVaE1aa1o1WldGSFIwcENaamxCTm1kU2NFZ0taVlJFY200NGRWUjBhRzFrUjFKR2QxUk9iVzF5VDI5RlFXbENRVEF5WTJaWVMzQnFNRnB4TkVsbVJsbFJSelJrWXlzMlVuTkRkREpHUWxKNk0wNUhiUXBEV0ROMk0xUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUSjFUVWMxTURScGNqZzFia2t2UWk5Mlp6UnNOV3Q2Ym1kTFJHTmpkVkpQQ21wU2FsSjBjbHBVVjI5RldFbEpia3MxWWk5RmVFUmtTR0pSY0VkdE9Ia3pRV3BDYTNKSlpGb3hWbnBwYnk5NFNYa3hVbEVyV1c5eVRUQTVSV05UZEdvS05ubDNiM2xRWkdwUkwwUkNOMmN2TnpoaGVDdDVOMDFZUW0xRk0xaE9PVm9yY0dzOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668301178,
          "logIndex": 6962950,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "8336b336d5ab16ecf43610760c24db2e8485d240",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453236384",
      "sha": "8336b336d5ab16ecf43610760c24db2e8485d240"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

