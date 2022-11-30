# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/python/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `migration-20221123` | `sha256:320632b276a7e69039cd9f97bc7172c82a6e9228cf5bb84d5e718a14404f7613`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:320632b276a7e69039cd9f97bc7172c82a6e9228cf5bb84d5e718a14404f7613) | `amd64` |
| `migration-20221127` | `sha256:52a85ac37e4776041bbfe67733cb6500c7efb6b3f95bdd8005fbd2c4aabdacf7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:52a85ac37e4776041bbfe67733cb6500c7efb6b3f95bdd8005fbd2c4aabdacf7) | `amd64` |
| `migration-20221129` | `sha256:d753169370eee75c39b5b113cccd2171327a7d676fb503d6a01344c4a3cf1089`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d753169370eee75c39b5b113cccd2171327a7d676fb503d6a01344c4a3cf1089) | `amd64` |
| `latest` | `sha256:39b4fbf59bd456f7aa807dc527e882a4c4ccc7d7258c408f8bfc963ba900df54`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39b4fbf59bd456f7aa807dc527e882a4c4ccc7d7258c408f8bfc963ba900df54) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221121` | `sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1) | `amd64` |
| `migration-20221126` | `sha256:2267da75e3fe01d6f215fc51fcbf268c2105da1eb9739f83ef4dbc774bd51259`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2267da75e3fe01d6f215fc51fcbf268c2105da1eb9739f83ef4dbc774bd51259) | `amd64` |
| `migration-20221128` | `sha256:4f524714a33b738ab1e6ffdff812b9062388e358071967885f6373aec1b5ee23`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4f524714a33b738ab1e6ffdff812b9062388e358071967885f6373aec1b5ee23) | `amd64` |
| `migration` `migration-20221130` | `sha256:f88529ca0198e6e4de02c5c08d1e04570dbce4918e563d8fb17c928e4269baf6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f88529ca0198e6e4de02c5c08d1e04570dbce4918e563d8fb17c928e4269baf6) | `amd64` |
| `migration-20221124` | `sha256:335f4780b3e6b2137db65a0da5df15ab8491af3f2e05c7af00d6f4a212d402b7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:335f4780b3e6b2137db65a0da5df15ab8491af3f2e05c7af00d6f4a212d402b7) | `amd64` |
| `migration-20221120` | `sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef) | `amd64` |
| `migration-20221118` | `sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a) | `amd64` |
| `migration-20221119` | `sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974) | `amd64` |
| `migration-20221122` | `sha256:2fb92368254ec422ead3d189999868e1c35daf729178681766c4e827dfd6fdf4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2fb92368254ec422ead3d189999868e1c35daf729178681766c4e827dfd6fdf4) | `amd64` |
| `migration-20221125` | `sha256:ca1dede10d2b15036ae0ea9f5459419df5a2de171068d1ec2230f8a03f9a8d41`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ca1dede10d2b15036ae0ea9f5459419df5a2de171068d1ec2230f8a03f9a8d41) | `amd64` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run --rm cgr.dev/chainguard/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/python:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/python:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:39b4fbf59bd456f7aa807dc527e882a4c4ccc7d7258c408f8bfc963ba900df54"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "3b0788cf4c72a9011504175c1e35ce39e671b4b7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEqGcYCSaOBZIv9mBSKwSFZj1jhc7fplil1x2V8n2ZzxAiEAojySZX2ej2D6k0ZsfpuN/QkHXfm7FZPaH68TrJFeFNI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3YjIxODljMzA2MjNiOWU5ZGFiZjMzMWYzNWQzODg2Mjg1ZmU4MGQ3Y2U2YmNmOTQwMGQ5NDFlMDgwMmY1NmRiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRWMzYW9IbUtSTXdDNDBFZTNvbFd5ZStCUUh3Z3JjcVd0b2ZMTi9NWlplMkFpQThGQ2F5VHZOWS9jVC9ZTW11OGdnNkUxeXBkZy9zM2R4WHMzTEV6NnA3eGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsNVowRjNTVUpCWjBsVVJVMW9VRUZFWms1UE1tNVhhWFZLZUVkUGFHSndZVTloYVVSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEZlRTE2UVhoTlZFVXdUbFJDWVVaM01IbE5ha1Y0VFhwQmVFMVVTVEJPVkVKaFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVV0ptTldJNFpHZGFXRmN3UTJkbEszVkpTRGRpVlU1MVZqWmFRV3htVmtKVWQyNTRkbElLUW1oT2RWVnBVRmt5T0hSd2JHRlRNVTFyY2pkdlIyNHhhMk53VVcxSmNqSXpWVU5tZFRSTlRUUmhTRVJsVDNFMGJ6UkpRMVJFUTBOQmEyZDNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNVMmRsYkdoeENrODNkR2g1VDJkcVlqVjBjbEZ2VmxsWWVISnZVM3BCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDYjBKblRsWklVa1ZDUVdZNFJWaHFRbU5vYkhCdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV1RKb2FHRlhOVzVrVjBaNVdrTXhjQXBpVjBadVdsaE5kbU5JYkRCaFJ6bDFUSGsxYm1GWVVtOWtWMGwyWkRJNWVXRXlXbk5pTTJSNlRETktiR0pIVm1oak1sVjFaVmRHZEdKRlFubGFWMXA2Q2t3eWFHeFpWMUo2VERJeGFHRlhOSGRQVVZsTFMzZFpRa0pCUjBSMmVrRkNRVkZSY21GSVVqQmpTRTAyVEhrNU1HSXlkR3hpYVRWb1dUTlNjR0l5TlhvS1RHMWtjR1JIYURGWmJsWjZXbGhLYW1JeU5UQmFWelV3VEcxT2RtSlVRVk5DWjI5eVFtZEZSVUZaVHk5TlFVVkRRa0ZTZDJSWVRtOU5SRmxIUTJselJ3cEJVVkZDWnpjNGQwRlJUVVZMUkU1cFRVUmpORTlIVG0xT1IwMHpUVzFGTlUxRVJYaE9WRUV3VFZSak1WbDZSbXhOZWxacVdsUk5OVnBVV1ROTlYwa3dDbGxxWTNkSVFWbExTM2RaUWtKQlIwUjJla0ZDUWtGUlQxRXpTbXhaV0ZKc1NVWktiR0pIVm1oak1sVjNTbWRaUzB0M1dVSkNRVWRFZG5wQlFrSlJVVmtLV1RKb2FHRlhOVzVrVjBaNVdrTXhjR0pYUm01YVdFMTJZMGhzTUdGSE9YVk5RakJIUTJselIwRlJVVUpuTnpoM1FWRlpSVVF6U214YWJrMTJZVWRXYUFwYVNFMTJZbGRHY0dKcVEwSnBaMWxMUzNkWlFrSkJTRmRsVVVsRlFXZFNPRUpJYjBGbFFVSXlRVTR3T1UxSGNrZDRlRVY1V1hoclpVaEtiRzVPZDB0cENsTnNOalF6YW5sMEx6UmxTMk52UVhaTFpUWlBRVUZCUW1oTlp5OUlUMFZCUVVGUlJFRkZZM2RTVVVsblVGWlVVVGNyWlRWellrWkVhMjh3UTFGUGNXSUtWMHA1WnpOcGJ6UmFkREJXVDJZdk5XUmFjMk5DYkc5RFNWRkVRbk5EWW5BME5rVTVWSFEyT1RJNVdWUnpUMWhXU3l0NFZWZE1jbFZGY2xrMlZFNWtPUXBpZFRkeVRHcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtNUJSRUpyUVdwQlZWVndhRU5WYUd4MlFVWjFjM1UxVFVoa1VWQTFiRFZzUmpZek1tcGtUVWs1Q2paaVVHRk1ibTV2VW5wTlJXMU5PR04yZEVGQ2FGUmhWRVpLYlhGYVZFMURUVUZ6UVZOU2VtaFBWMDFFTnpkTlNqWTVMelJpYXpOUFVtaGtiR2cxWVZvS2RqUm9lRGN4TkhoMlJrTklRazlIVW10aVlVODRWMnhsTkhGMVNXdFBjek5VUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1669806918,
          "logIndex": 8152285,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "3b0788cf4c72a9011504175c1e35ce39e671b4b7",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3582760602",
      "sha": "3b0788cf4c72a9011504175c1e35ce39e671b4b7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

