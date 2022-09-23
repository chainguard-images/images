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
| `1` `1.23` `1.23.1` `1.23.1-r0` `latest` `mainline` | `sha256:391ea132692dc62fe5617ced7e8f559d0efa1501625dba1af950893dc548c679`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:391ea132692dc62fe5617ced7e8f559d0efa1501625dba1af950893dc548c679) | `amd64` `arm64` `armv7` |
| `1.22` `1.22.0` `1.22.0-r0` `stable` | `sha256:93717518fe287fd4b0f0d67f54dd8a515f1531ec6fa5e6bcfefa07fe082e849a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:93717518fe287fd4b0f0d67f54dd8a515f1531ec6fa5e6bcfefa07fe082e849a) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:391ea132692dc62fe5617ced7e8f559d0efa1501625dba1af950893dc548c679"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "eeea0af72cac14a0d21c68fabbc12e0edf15bda1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD8keOVVYbppQotIMiZYbVr+YpLYO/q3jYhMlciBcswNQIgdGnsU9vFk4o3pTcY0R3933udXlLFmvhsI3fDzJiTJz4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYmRkY2YwZTRhNDNhM2Q5ZWFmZWE5OWNhOTM5ZDE0MDdiZjc2MTM2MWUxODdmMzcyNWE2ZTk5MjU4NGEzYjAxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXVHNTVuUktxZkxHM2szYjJwWkRsd0dzR2QzRmI1YjNsVlZxaCtnYSs0VkFpQWl6eFI2N01WT3ZFZ0lHZFpMckdPZStPb3R0Vi9XRm9tWG04MTBDZ3FaQUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVldtTjJOVGQ0VGtkWEwyTjZWVmN2VlhsNGEyVXpabFphVGtsSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFVjZUMVJOTlZkb1kwNU5ha2wzVDFSSmVrMUVSVEJQVkUwMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSUW5GVlpGbDNTbTFPUzNFclRUaFROR2R6VXk5T01FeDBlVWhuUW1reWMwMUpZMUFLYm5od0swRkhiMXBSZWswMVlVOW5URmg0TkVoV00wd3hSblJvVlZKd00ydEpXRkJLVUZKVGNWaHdhalJ3YlRWTWNqWlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5YVdaUENreElPVFZuTjJGQkwxWldaRlJDYUVWeFpXcERaWEUwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVmRDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZvZWxreWFHeGFTRlp6V2xSQk1ncENaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm9iRnBYVm1oTlIwWnRUbnBLYWxsWFRYaE9SMFYzV2tSSmVGbDZXVFJhYlVacFdXMU5lRTF0VlhkYVYxSnRDazFVVm1sYVIwVjRUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVZERhWE5IUVZGUlFtYzNPSGNLUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVhkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpsQ1NITkJaVkZDTTBGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NbWRCUm5nNFFVRkJVVVJCUldkM1VtZEphRUZMWVZNM05YbzNRM0ExV0ZOdVZYQUtTbWRRV2tKNFdXMVFOSFpLY1hWYVpWaDBSbTUwTWxCM2JtZDVVVUZwUlVFMFMzUmtlSGhaT1ZsVmJGRjRNVlJYYmt4QmMwTkdhVGxQWjNwbE1WTk9iUXBYY1ZONk5IZzVWRlZuYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCVUdVMll5OTBlblV5TWxGQ1IxaEdNMFZDTVRSWldUTnFObXREQ2xOeU1FOXRlVmxsVUZST2FtNXRkMnRUY214VmRWcHVPSEV4WkRCa0x6a3dOMGw2TVRSblNYZEtjbmxoTlVWQlRuSkNRVEF4VFVWRlNEVXJNRUYxYzJFS2VIb3JNV0lyTlVWd2FYa3pWMjVCYUZsa1owNUZOV0ZIUVM5MFFqY3hNSFpuY1ZkTFJuUlRXZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663897187,
          "logIndex": 3781140,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109828542",
      "sha": "eeea0af72cac14a0d21c68fabbc12e0edf15bda1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

