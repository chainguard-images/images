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
| `1.22` `1.22.0` `1.22.0-r0` `latest` `stable` | `sha256:71a0c42838f97dfe3143a4778ee9d033beb4d49156edc02667b765d677e27a8f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:71a0c42838f97dfe3143a4778ee9d033beb4d49156edc02667b765d677e27a8f) | `amd64` `arm64` `armv7` |
| `1` `1.23` `1.23.1` `1.23.1-r0` `mainline` | `sha256:9200860b26e3cae1d367fb404c0fa0836ed4224a8b39aa055e2d7056bd7a3150`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9200860b26e3cae1d367fb404c0fa0836ed4224a8b39aa055e2d7056bd7a3150) | `amd64` `arm64` `armv7` |


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
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys
tuf: warning using deprecated ecdsa hex-encoded keys

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
        "docker-manifest-digest": "sha256:71a0c42838f97dfe3143a4778ee9d033beb4d49156edc02667b765d677e27a8f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "825e581f4771907bd86f6696c94a7b62e623f89c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCAZ8xDBjsd4a+C3CHdzZBwlzUTBnYaPlj31nZLYISZpgIhAOQxWwwF0FHRanAs4NomFbhxsupXDHKcqiMa0JcJOlts",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMzdjOWQxZWU2ZTdjMDcxZTcyNjZhYTYwOWJlZjFjYWEwZTBkNWIwYmZkZDRhNGRmYWQ0MjVlOTM3M2FjNjUyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRHlLVGxtRStXdkZ4S2UwbWxwQTRIMWtWM1M0SlVNQWR1NEFYQWQ0SHVvbEFpQXhZS2NXa3dvcmVHdUhSMFhYdFhMYWJnTnpXNU00M0poS3pKTnNyVFAwTUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwbFowRjNTVUpCWjBsVlkwczFUVmREVmxsaVpURmhjMkpySzJkU1p5czFVM2MxT0c5M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1ROTlZHdDZUMFJKTkZkb1kwNU5ha2wzVDFSSk0wMVVhekJQUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUzVkhnMlFrTTJaVU52Y1dseWFHVlRTUzlXUlRZeFFXeHhkVFZqU3pKM2FHaFFlV1FLTm1FdmRpOWhLekJHWnpkRmExVTBkeXR1UzBwMFRYQnVObVJhYWlzM1QzTldjbVJNSzJoRFNYRjZkRkF3VUhFeWNEWlBRMEZzV1hkblowcFRUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ1U3psekNtTnhhSGRWVVRsbFVHczRVRUoxTmt3d2FYTjFlVmhSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRV1pDWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0pHTTJJelNuSmFiWGgyWkRFNWF3cGhXRTUzV1ZoU2FtRkVRVEpDWjI5eVFtZEZSVUZaVHk5TlFVVkVRa05uTkUxcVZteE9WR2Q0V21wUk0wNTZSVFZOUkdScFdrUm5NbHBxV1RKUFZGcHFDazlVVW1oT01ra3lUVzFWTWsxcVRtMVBSR3hxVFVKM1IwTnBjMGRCVVZGQ1p6YzRkMEZSVVVWRWEwNTVXbGRHTUZwVFFsTmFWM2hzV1ZoT2JFMURWVWNLUTJselIwRlJVVUpuTnpoM1FWRlZSVVl5VG05WlYyeDFXak5XYUdOdFVYUmhWekZvV2pKV2Vrd3lOVzVoVnpVMFRVSXdSME5wYzBkQlVWRkNaemM0ZHdwQlVWbEZSRE5LYkZwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtOQ2FWRlpTMHQzV1VKQ1FVaFhaVkZKUlVGblVqZENTR3RCWkhkQ01VRkJhR2RyZGtGdkNsVjJPVzlTWkVoU1lYbGxSVzVGVm01SFMzZFhVR05OTkRCdE0yMTJRMGxIVG0wNWVVRkJRVUpuTkVJeFRuQTRRVUZCVVVSQlJWbDNVa0ZKWjJOeVpIY0tXbGxEYlZKTVJrOUlRWHB2VGtWc1pYSkNVV2xxYzBWMmExbDBkRlJ3U1cxMllqZE5Va3ROUTBsQlRsWldOM2wzY0dvM1oyUjVaMW96YXpWblFWbGFSZ3BqZWtOVllsRlRVRE42Umt3NGJrOHJiM1JzV2sxQmIwZERRM0ZIVTAwME9VSkJUVVJCTW1OQlRVZFJRMDFDUTBOelVUUkZlbTFCY1ZKTWJXUjVWMHh0Q2pGdU0wTldhVEprWjFGR1pETTFhRzlZTUhGMVJqQmpaa1ZKVUVaSVUwTlFNRkJqS3pseVVtMVFUbUZpVmxGSmQxYzNSamR3WlVWamMxTlNiUzkyUXpZS2MzRkNabGswUVVRMGFrbGpSVUY1Y1RSclEyVmFNelpuTjNaeFJteGxTVGhsU0hwbVoxQmFLekJVYkRVclNHWm9DaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1664307516,
          "logIndex": 4103502,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3138313622",
      "sha": "825e581f4771907bd86f6696c94a7b62e623f89c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

