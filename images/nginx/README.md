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
| `1.22.1` `1.22.1-r0` `latest` | `sha256:45d7a7687e9aeb88724a4853f46a49632d79cd0b297dcde70dff38bcb2a6dfa3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:45d7a7687e9aeb88724a4853f46a49632d79cd0b297dcde70dff38bcb2a6dfa3) | `amd64` `arm64` `armv7` |
| `1.23.1` `1.23.1-r0` | `sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:310f9a01fc3e7a9410ae7ea1d9cac5add66d3f95d081efa6693a829e1b6aaa70) | `amd64` `arm64` `armv7` |
| `1` `1.23` `mainline` | `sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` | `sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:14854d1a7d0cb1a79dfc24675d8a712b5f8f02ec1f359a691669964bd0b6ecd2) | `amd64` `arm64` `armv7` |
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:45d7a7687e9aeb88724a4853f46a49632d79cd0b297dcde70dff38bcb2a6dfa3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "6979e934bd2e9bd611e94e2c8e6c83596e353b5a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDayVN/eBaGyAsL55PmW9a5PGYMBTRlH37s3up9sJwr1wIgbGLC1NoAfHnOg+zxrWwb16G1PK2OL3viCyfbiv5q9B0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkNTEzYjUzZTFjOWE2OWMxZGRiOTA1NGI1MzA1MGIxNDY0MjU4NTAyNTRjMGNiZGEzNTBiNjhhMTg5MjdkY2YxIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSGhHc2dqVEhxYXoreFNLQW0xNkZiZnR2QkFvL05GSWRTTTlzaWc5akVKbkFpRUF5b3hiZ2dRMlprRTBFTDNQblEzbU5GWC9Ec0xlVHU4YnVSNlBDcVIvVXFrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlJGaFpZV0ZQUzI1T1RUQkRlR0pVYzFwclNtRmFjVFZuTVhCVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlZHZDRUMVJGZWxkb1kwNU5ha2w0VFVSSmQwMVVaM2xQVkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwUWxKTUwwcFlXQzgxVTFJM1JtZ3dORkJFYkRSVVVETkJOMFpwUzJwQ1EzQndja2dLZVhWSFNVY3JObm81Y0dOM1FYaFliVWxWVFhZelMwZzFVelpaTUVWaFFuSndTbGhwWW1kTVJrUjNSalJzTVd0YVZXRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVVWpCTkNtaFpMMWgwU0hwRk5WZ3pSMUV3Ym1Od1pYaG5TamROZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwM1dVUldVakJTUVZGSUwwSkdNSGRYTkZwYVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Tlc1aFZ6VTBUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkZrMVRucHNiRTlVVFRCWmJWRjVXbFJzYVZwRVdYaE5WMVUxVGtkVmVWbDZhR3hPYlUwMFRYcFZOVTV0VlhwT1ZFNXBDazVYUlhkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbEZaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmdLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZbTFrY0dKdVozZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRsd04zSXZVVUZCUWtGTlFWTkVRa2RCYVVWQk9GbDFWa0Y2U25kWlVIZDZhVUpOU1RsWlNIQUthSHBKTUhGRmFtZ3ZZa2RIU1hoMUswRXJjMVZNYVd0RFNWRkROVkJwVjJrNWVERnhhbFpJWjBGeEwwRnNNRzkwYmxSR1ZtNTFkRFJvVTJSWWMwTjFTZ3BDZDBOdWNtcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFYZFBiWEpLZDBwdVpHeHJkazlHVVhsWlduTklXRkp2V0docmN6bGpMMnRNQ21rcmJYSjNZM04wVTFkaGJtNW1aMFoyYzJ3eVVFcDZaMDk0TTNkelZFSXJRV3BCZDBwalpUTnlVbG93VG5CUWNqWk9ZbEJXY21OUVIzRndhRGxyT0NzS01VRkpPRGwwVm1kbVRpOVNNblV3VG5KelVreHVaSGRFY0ZwcWF6TnVjWEZWUlhNOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666289962,
          "logIndex": 5511493,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "6979e934bd2e9bd611e94e2c8e6c83596e353b5a",
      "githubWorkflowTrigger": "push",
      "run_attempt": "2",
      "run_id": "3291134093",
      "sha": "6979e934bd2e9bd611e94e2c8e6c83596e353b5a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

