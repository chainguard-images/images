# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:0c2cbe08ada572ae644bf59780c52e0bca8d71c12c1477eea8d5015641d95e56`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0c2cbe08ada572ae644bf59780c52e0bca8d71c12c1477eea8d5015641d95e56) | `amd64` |



## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/wolfi-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/wolfi-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:0c2cbe08ada572ae644bf59780c52e0bca8d71c12c1477eea8d5015641d95e56"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "fc7aae389b57bd91276744c0fe99f83ffceb67c7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIFTxH7cdeeh2tjWvXxonzOKg7BgdH4nmWDjsizW2bnxkAiBlZFJ6Pgm2Syw3buw+VSnPXH9lSixiWUTU9UdBmEhv0w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNGVlZWQyMGYwZTk1NGM5YmNlN2U0MGZkNTdkOWZmNmZlMjZhMjQyNTJlMTQwYWRjZWJhNWJjMmZkYTNlNDE3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR2I0eHF6eEZPNjcvU05kRjRKbkVuWEFrNk5Qc29qN2hENWxycHRwMHR3S0FpRUF3ZlJ4aWNyeENidWUrZEtjZlJMcm9rK3dHajRXMFJmRnVoM3llL0IxRDBrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhsbFowRjNTVUpCWjBsVlNURnhheTlSSzBsQ2NVc3JOR0ZRWkdOTGVsSTNTMHBhTUhSSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUbnBSZDFkb1kwNU5ha2wzVDFSRk5VMXFTWGhPZWxGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZVVm1STVkwTnVZMEZpZFVReFEyVk5kblEyWjNZNGFWcERVa2R3VkhOb1NYbFlSVGNLVld0UlVFRjZPV2xSUkU4NU5IVkpUa0ZYY0RaRE1EaFhUbkZuTTFOWGRIazRRVWR3Wm10c1dFRXhWRVJIWkVGMFlqWlBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLWjBwMkNqa3pPWEUzYVU5RVVWaDNNbEZVVkV4cWVIQTVTM05qZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BrTWpseldtMXJkRmx0Um5wYVV6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRhRzFaZW1Sb1dWZFZlazlFYkdsT1ZHUnBXa1JyZUUxcVl6Sk9lbEV3V1hwQ2JWcFVhelZhYW1kNldtMWFhbHBYU1RKT01rMHpDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhVbkFLWXpOU2VXSXllR3hqTTAxMlpESTVjMXB0YTNSWmJVWjZXbFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNVllWFV4TVVGQlFVVkJkMEpJVFVWVlEwbEdlVk52ZVVWYVVVSnJNREV5UjIwNE1VdzFPRTVVVjFWVk5uZ0tXWEpKY1VKWlJ6QTVUVnBOTkdablJFRnBSVUV2VVRNd2JtUTBlRXhZWkcxd2VDdDRhR05YUW5wWE5ucHhTbTFPUVU4MlRWRlZaR0ZpUzNoS1NYTkJkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVUZCZDFwUlNYZElRVTVLZGt4cmNVbEVjSFJDZVZsT01HRkVNbmc1TVVsaVpIZGFiVGx6VDAxbWVIRllUQzlzQ21oWWMwTlBlakJxVVVoVVJYWnRhM0J1SzNKdE9VaHhTMEZxUlVGc2FrWk9lVVpCV2twek5URjJjbVp0Y0c5bldVNXJMM05EZDAxSGQxSjVOVXBNWkVZS09IVndRWGRXTkVOdVNpczNMMUJRT1cxak5EVjFhVFZYYVRkUVdnb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663625263,
          "logIndex": 3564041,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085948022",
      "sha": "fc7aae389b57bd91276744c0fe99f83ffceb67c7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

