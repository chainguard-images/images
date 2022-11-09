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
| `latest` | `sha256:2f2a3555818766989d3af8e78f7db4de88300a5e0bca270cc47294fa692a76cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2f2a3555818766989d3af8e78f7db4de88300a5e0bca270cc47294fa692a76cd) | `amd64` |


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
        "docker-manifest-digest": "sha256:2f2a3555818766989d3af8e78f7db4de88300a5e0bca270cc47294fa692a76cd"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "424e500f791e6629591f451a316f58ac62598b2d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/node",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIG1iUD9SEMud1wtLF0vOyKvtrgpuenXLy9tw+x4fPVTRAiBGCS4rBOd4IcW7kU5Y1ptO8xH1tcyvRyc6WpExl1tJjQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmYmM4YTg3M2FiNGE0NjNiMGM4ZGFmMjY3ZmUwOWI3NGNmYmJlNTgyOTgyN2FjMTExZDFkZWJmZTI1ZTM5MzU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDNBRVVBOFRRUzVWcnJCeU8rVnladVZ1ZE85RGdEdGhIMDlYdEliRWhvaEFpQXIva0dFek9nZ2p6TGF3QVVxTVUwaGFLVW5VR3ZmSHBMMU9hL0psL3lWOWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZGaEhiVGQ0T0dsSFZuVnVXR2R3VlN0R2JtVlBOM0ExUTFwVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlZHY3hUa1JGZVZkb1kwNU5ha2w0VFZSQk5VMVVhM2RPUkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZWUVRaVE5tZFpNRmhNSzFKaVNXOVdMME5xWXpsUWFqWjFlWEpGVXpsYU1HSkNVVUlLYTNSelZFVklTVTk2UVVGV1UwOHlPRlpXWkhwbVIxazVRblZ3VURGVWIzVkRaQzgwV0ZKdmNESk9aV2gyZURGVlNXRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZvUWtscENtMTZUa3N5ZW5wYWMySm1TMVZSVVRCQ2JuSktaR0p2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TlhaYVIxVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPUkVrd1dsUlZkMDFIV1ROUFZFWnNUbXBaZVU5VVZUVk5WMWt3VGxSR2FFMTZSVEphYWxVMFdWZE5NazFxVlRWUFIwbDVDbHBFUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbW9LWVVkR2NHSnRaREZaV0VwclRGZHNkRmxYWkd4amVUbDFZakpTYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sM1dVdExkMWxDUWtGSVYyVlJTVVZCWjFJNVFraHpRV1ZSUWpOQlRqQTVUVWR5UjNoNFJYbFplR3RsU0Vwc2JrNTNTMmxUYkRZMENqTnFlWFF2TkdWTFkyOUJka3RsTms5QlFVRkNhRVl5SzBsWVkwRkJRVkZFUVVWbmQxSm5TV2hCVG1OYVRWQkpVVkJSTm5Ob1VUTXhURzkyY0ZjM05tMEtaSEk0VDJGcVpFNTVRVEpDWTFSNGFqbHVhRWRCYVVWQmRWQTVNRTFIVHpZNGJ5ODJha2hLY21OWk5pczFjMHBOVlV4bWIwUklRU3RoTlhjMlYzQjZWQXByVGxsM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzUzNCVFQzWlNZM2RQS3k4MmVTc3djbVowYWtKblQzQXlZbXBHUVRCWlRFVjZUVFpzQ21kRk1HZHlVeXQ0U1dSMU1VOXdiVVJaTkcxQ09IbFBhVGh4UjNCQmFrVkJaMjltVFRaUVpXRlZhblozZVZZek5tVlhXV05OVUhGWU5HVnhVVzlYY0hNS2NVdFNWM1JRVUd3d00zSmhkWFZRZEdOR1drMUZUelF3YmxRNVRUbElLMVlLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1668020056,
          "logIndex": 6792633,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/node/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/node",
      "githubWorkflowSha": "424e500f791e6629591f451a316f58ac62598b2d",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3430977371",
      "sha": "424e500f791e6629591f451a316f58ac62598b2d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

