# wolfi-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/wolfi-base/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wolfi-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:da4acec741f927eebdf7b608552c85332589e7ff656802bb1f89e706a5750b62`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da4acec741f927eebdf7b608552c85332589e7ff656802bb1f89e706a5750b62) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/wolfi-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:da4acec741f927eebdf7b608552c85332589e7ff656802bb1f89e706a5750b62"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "46b6f93f033edc6911a3cc441bae9d280064accd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFeXcScCqx6WoBG3At9XKbry79ykfmg3rao8mEpJABbqAiEArtj1NwJ0anaOnX1cZuaaH5TSFqOERhTjQi/NQNaXPx4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZWRmNzI1MGFmNzc4Y2Q1M2M2NzIyODYzOWRjNGM5YTk2NWMxMmViNTNmOWMxYWNjOGU1ODM5Y2NkNTFjZDU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURrRmJVSTVVeTUwNGZkR1p3aGh0aEdOUzVyOEdZTWVOUkNBbmhETzg3ZGhnSWdOd0pnc2lMSDdqZ0dXR1U0R0d1QzlkMjZrK3FmbHI0dUZwUitWRnRuK2NzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVlNYaDBOVWRXVGtWWWNFTjNhRFk0Tkd4UFFqWk9WRWMyY2xwdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTmFrVXdUWHBOZDFkb1kwNU5ha2wzVDFSSmQwMXFSVEZOZWsxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxTVVwbUx6VklOVm92Ym5KUk9IUXJjWE5TYTNsVlkzRTBaV0pNTUhaV04yWkVabGNLTUU5TFNFOUJWVGN4YzI5VlowNDVXVmMxUXpVMU4yZ3lRVkpEUTFRelZHeHBlWFEzVFd4UVZXcHZZbW8xVldWVk4zRlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwU1V4Q0NuWmpVMXBEVFdaVFVVTktjWGQyZEVGbWJEWlliRzVWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFV21sT2JWazFUVEpaZDAxNlRteGFSMDB5VDFSRmVGbFVUbXBaZWxFd1RWZEthRnBVYkd0TmFtZDNDazFFV1RCWlYwNXFXa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtY3hlbUpMZVhOQlFVRlJSRUZGWjNkU1owbG9RVXhRUlhWbVR5OEtZeXRsV2pRM1FYTXlVVmN5TkhSdFFrOVBTRVJNVXpaV2RsUkpaVXRyUVRGVmJWRTBRV2xGUVRCQ04xazFkVGhSZW5kMlMyMUJWMEp0VVhZME9WbEtUUXAwYjJWaVFtTnZWekExZEV4NGJrcFFhR052ZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkpkMVZOVWt0TVVFMVBjMEV4TnpSNGNTOTFaMnB2Q2xsaE1GaHhaMWRDYW5CU2QwMDJLMmMzT1U1M1QxZHZiVVI1TkdKaFRUWjRWVUp3VlZGbGIwOXRSU3RhUVdwRlFYQlZZMGxhWlV4dGNISXlRbll2TDJvS2JqRk1ZazF6U1c5UVIwaHRRbTV2VjFwalZuZDJSMEV4U0Uxd2F6SlhURFZJU3pGaFlYRlZOMVF2Y0ZKTWIxSnVDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663710214,
          "logIndex": 3633077,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3093646156",
      "sha": "46b6f93f033edc6911a3cc441bae9d280064accd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

