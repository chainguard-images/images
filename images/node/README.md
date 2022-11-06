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
| `latest` | `sha256:2e1aa442d8af6a9b5a0e6a51bfc4d48dcacd75cc0c803c2404125199aa591f03`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2e1aa442d8af6a9b5a0e6a51bfc4d48dcacd75cc0c803c2404125199aa591f03) | `amd64` |


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
        "docker-manifest-digest": "sha256:2e1aa442d8af6a9b5a0e6a51bfc4d48dcacd75cc0c803c2404125199aa591f03"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c1e5573325202d50134814443bb531580ec3596b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDczwbfZFvxBRUKlHb92xOafjWW1Zu1XuatCtPjxdQb0gIgQrStwyBrMfzKQ6MgYfNnQe0cZAEdpgF7Ac5H/QIhScY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ZDM5MTE0MzQ5NTBlZWFkNTdjYWU4YjYxMTU4ZGRhY2Y1OWJiYTBlMWRhNGI5ZGYzMWMzNjM1M2ZjYTUwY2E4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRW9JcGUvZ3FleDBIL1VRRDlCekVKYndKb2xzbkp4cjBFUHN3dEFUQmZwQkFpQnlFN29mSWl5MFgydjNMRStBVHZvY3BiMldLZFJReXlMY0lBd2grWDZuTkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlMyNU5XVnBHVGsxR1pHMDRTalY0YTJrMWVHazNiM293VmxKamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVjNUWHBCTTFkb1kwNU5ha2w0VFZSQk1rMUVSWGhOZWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyTkd4SWVFZHRNRW81ZURGTVRsUndNVTlyTms1QlYzTjFlVTh5U1VGTlJYRkllVm9LZW5ORlpFeDVTRUZ3U0ZCclZUUTFiVU5qWjB4QksxcG9TMUJPY0dGRVRGbG9jakUwWjJGWmEwNWxPV1pVWjNBNVptRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZtTUZCQ0NtdEdjVzFOU2xRMVMyODFVbGxYWkRaR1pXWlJSMVJ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNXVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRMGhPYW1GSFZtdGtWM2hzVFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwZE5lRnBVVlRGT2VrMTZUV3BWZVUxRVNtdE9WRUY0VFhwUk5FMVVVVEJPUkU1cFdXcFZlazFVVlRSTlIxWnFDazE2VlRWT2JVbDNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDBwQldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUlYxa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1KdE9XdGFWRUZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XV3RIUTJselIwRlJVVUl4Ym10RFFrRkpSV1YzVWpWQlNHTkJaRkZFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVrdGtiazlOUVVGQlJVRjNRa2ROUlZGRFNVUkNXVGhRU0hsV1RrVmxPVlZCT1VveldWUUtlRU41ZVZWNE4wdFljRlJaVkV0alJXUndUWGRHU2tZeVFXbENRM1ZKVTNSdVRHNURMMWRYVGtWM01VWnFWRFJyVmpGNFV6bDZSSGhpY1c5NlpHRk5iZ3BoY0ZkWVoxUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYUmhWbWhGUlVsS1dtWXlUV3hMYjJwSllta3ZXVnB2ZFRoMFZVVkpkVzFwQ2xBemJXTldkMVJOYTNwdVVWbDJNSGwyUWt4UFJITnNaa052UlhKaWVFeHBRV3BCWmt4eGMxSkJaalpsYkRZM01tUnlPSE5HSzI1d01HOUVlRnBSY0VrS1oxZGlWMkpyV25FMk1uUkdTMHg2UTNWU2FuRldUelpqVUVodE5HUXdkR2RHU21zOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667696590,
          "logIndex": 6589954,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "c1e5573325202d50134814443bb531580ec3596b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402356550",
      "sha": "c1e5573325202d50134814443bb531580ec3596b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

