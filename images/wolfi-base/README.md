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
| `latest` | `sha256:c2335187717fbc9551c35b9a517b942b5d8768a8a2fb6c6cb53825bd8ed925a9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c2335187717fbc9551c35b9a517b942b5d8768a8a2fb6c6cb53825bd8ed925a9) | `amd64` |



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
        "docker-manifest-digest": "sha256:c2335187717fbc9551c35b9a517b942b5d8768a8a2fb6c6cb53825bd8ed925a9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "16dab418ecb6ea1e425b68594ce13ecc2aedee02",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/wolfi-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDiVAcaz1Km3YIlsSahLBAMGgRtSjuG7gnljsbp/+zlFAIhAKy3R+lqnY4A2klnRFVw/Cp4GseO8HkuBOWMxxaEhi7n",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiM2RjMDdhYmRmMjk3ZDExN2MzMTM1MGUzZmY0NGVhNmQ2ZWMzOWQ2MTNlNGNhZDE2Yzk0MTk1MDhjMWUzZjA5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNWQmw5blpQQ2FCbmFpYXk3eVZaLy9LZmV1c0YySU1RNkV6VXdqTDZ0U1F3SWhBSXkwT2c3SW5DRDhOV0IyYjU2bFdGMG9TQ1J5YXM2UnoxMVJKTDdTZ2RsWiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwaFowRjNTVUpCWjBsVlJHOWtMemRCZUZwMlN6UXJlazlxU0dwdFltWldNemhLTUhsamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDRUMFJWZVZkb1kwNU5ha2w0VFVSRmVVMVVaM2xQUkZWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuWVROVVFtSjFPRTVoU0hSS0t6WTNaRGRsY0RGSFEweDVTQ3M0Um1SNVRsRmFTR29LUmpoaFRGVXZXR3BMZG5GQ1IwSTJORzVtVTJ3eWIyTmpPWEJCTDBsR1VraHFLMFU1ZFhkNU5XMDFUSGx5YlV4VlF6WlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlU1ZUhOTENrWktXak5EZURNeVNFMTFibVZpV25WVmNGUnFOekZuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKQldVUldVakJTUVZGSUwwSkhTWGRaU1ZwbFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6WkhaaVIxcHdURmRLYUdNeVZYWk1iV1J3WkVkb01WbHBPVE5pTTBweVdtMTRkbVF6VFhaamJWWnpXbGRHZWxwVE5UVlpWekZ6Q2xGSVNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcEJOVUpuYjNKQ1owVkZRVmxQTDAxQlJVSkNRM1J2WkVoU2QyTjZiM1pNTTFKMllUSldkVXh0Um1vS1pFZHNkbUp1VFhWYU1td3dZVWhXYVdSWVRteGpiVTUyWW01U2JHSnVVWFZaTWpsMFRVSkpSME5wYzBkQlVWRkNaemM0ZDBGUlNVVkNTRUl4WXpKbmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFVV210WlYwa3dUVlJvYkZreVNUSmFWMFY0V2xSUmVVNVhTVEpQUkZVMVRrZE9iRTFVVG14Wk1rMTVDbGxYVm10YVYxVjNUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFYRkNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNlR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9UTmlNbmh0WVZNeGFWbFlUbXhOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVVGb1oydDJRVzlWZGpsdkNsSmtTRkpoZVdWRmJrVldia2RMZDFkUVkwMDBNRzB6YlhaRFNVZE9iVGw1UVVGQlFtYzRNWEowTmsxQlFVRlJSRUZGWjNkU1owbG9RVXRRVUM5SE5VNEtOVFpWYkM5aksxUldRM00yWW1aM1VrcFlkbk5SYWt0a1VuWjJUVGRWV21ocFpXSllRV2xGUVd4U04wWlJRVkZQWkZaQ0swaHlOMFZ5VDFkVk5WWXhSd281YkZKelFXdDJhVGxUVjFSRE9YQk1hWFozZDBObldVbExiMXBKZW1vd1JVRjNUVVJoVVVGM1dtZEplRUZLVjJnMFlreDZPRXhRTVd4SGRYUTNNWHA2Q25SS00zaFpaRzR4YlZaeFIzWnNSVUZKVW5VeFYyRllWV3B3Y0dWMGNVSlliSEE0YXpWVGRrcDZVbWwyUW5kSmVFRk1Uelk1WW5WSmVuZzFLMlZaTUM4S1kxWnlSMGRtVW1KVFMyTnNSRXh1UzJNMVlrZHhXbmhhVkdkNU1qVm1RVGRyZGpaMmRqRmFVbmd5Y0VWWGNXWmxkR2M5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665598735,
          "logIndex": 4977846,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/wolfi-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/wolfi-base",
      "githubWorkflowSha": "16dab418ecb6ea1e425b68594ce13ecc2aedee02",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236941299",
      "sha": "16dab418ecb6ea1e425b68594ce13ecc2aedee02"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

