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
| `latest` | `sha256:23387cd650fdd7e8d6acf0d4b1fa7cbb5e689cc38c9976e09ccbe474e4c3ff2d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:23387cd650fdd7e8d6acf0d4b1fa7cbb5e689cc38c9976e09ccbe474e4c3ff2d) | `amd64` |


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
        "docker-manifest-digest": "sha256:23387cd650fdd7e8d6acf0d4b1fa7cbb5e689cc38c9976e09ccbe474e4c3ff2d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "de318e9daf736296beaa666bcf892b2e44cca626",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC6BQV4dTr05IlKLTJ/YFhkGuGnIB/SS5hWqkTG2+wKsgIhAKfSZWfQAA2usBpSiSydJntzIR73drNHIrI14xRTsa9l",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZjhkZGNkZDBmOTBlMmQzYjI2ODNjOGNlM2Q4ZTQ0YWYyNWI4ZGRjYjk1NzYzNWU0ZjZhYTVlZjY4NTc3M2FkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQXFpR2lWZXNSemlLdlNFVHZkVnUyd0ZtQmN3UVZ5SitXdDVpOEluTTduOUFpRUE2MmIrNEl5T292Q1BMUUl6ekpmLy9LcEY2MWFWT3l0QklOUk5KWTRDQ2VJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZha05EUVhscFowRjNTVUpCWjBsVldqQmpaMFJCVW5adEwyTnFTMVJVUkRWRGNEWTJXRE0wTms4MGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlZGVjRUWHBSTUZkb1kwNU5ha2w0VFZSQmVVMVVWWGxOZWxFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1UkZBclUwRk1hbmhTUXpkQlYyUnpZVzUwVTB0TVpHeHNRbVpUZFhsREsyVTJTRWdLVUNzM2FrZ3phMnBoT0ZKblZuUkJjbXRyTWtkTGNVRnNlaXMyU3pkT2NHVm5Xa2xTYkRKSmVVUnFhMWw1VkU0MlpVdFBRMEZyWTNkblowcEVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCWkhaTkNtZDBjV1ZGVldVdlYxcEZkRzFNZVM5aGRFbHVja3hWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlhUjFWNlRWUm9iRTlYVW1oYWFtTjZUbXBKTlU1dFNteFpWMFV5VG1wYWFWa3lXVFJQVkVwcFRXMVZNRTVIVG1wWlZGbDVDazVxUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbW9LWVVkR2NHSnRaREZaV0VwclRGZHNkRmxYWkd4amVUbDFZakpTYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sUldVdExkMWxDUWtGSVYyVlJTVVZCWjFJM1FraHJRV1IzUWpGQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRVJxYm5oM1JVRkJRVkZFUVVWWmQxSkJTV2RhYmtWUlRWbGtWRzU1ZEZSVlNtTTNURUZvTkZGd2RXUUtjbEZ0WVZCcloxUnNURVV5WTBaQldEbHJUVU5KUW1rdmMxbFdjMFJUZVhKNFpqSlpSR3MxVVdkQmVFWlBNMGd3Wkd4bGN6VXlRM0JSUVc4eGNVNXNTZ3BOUVc5SFEwTnhSMU5OTkRsQ1FVMUVRVEpuUVUxSFZVTk5VVU5zVm1ST2RtUmpSRUl4YkRocVdYVkRNREl2UVRSNE5IY3dNMUJ2VUVFcmJGZFBWamhNQ2xCWFVXVlhRMGQyV0ZWbmNGUkVNVzVXWW10WlNtWmxWV2MzYjBOTlNGUmxOMVZIU0RsRU4xRlhaMWxMYVVwTVFtOVNUbTlWWTA1MmVrNWFTalpzWVZrS2J6VXZaVzR4WVVWQ01sWkRPRU1yUzBRd01sWm9kVFF5THpkcmFpOVJQVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667402030,
          "logIndex": 6363480,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "de318e9daf736296beaa666bcf892b2e44cca626",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3378752713",
      "sha": "de318e9daf736296beaa666bcf892b2e44cca626"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

