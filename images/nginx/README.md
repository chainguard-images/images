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
| `1.22` `stable` | `sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:85007badb1a2a67a486ed03fff11c3b642eedff2c371809a1abee101bdc960ea) | `amd64` `arm64` `armv7` |
| `1.22.0` `1.22.0-r0` `latest` | `sha256:bee9ce97bd72a082fa676f370938d01f3ab651598df4ca4861bc579f761c1215`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bee9ce97bd72a082fa676f370938d01f3ab651598df4ca4861bc579f761c1215) | `amd64` `arm64` `armv7` |
| `1.23.1` `1.23.1-r0` | `sha256:e4d88ae67b00502ad0ab2418bb730b0e1b93a065fbf00251ec641b508ae861e6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e4d88ae67b00502ad0ab2418bb730b0e1b93a065fbf00251ec641b508ae861e6) | `amd64` `arm64` `armv7` |
| `1` `1.23` `mainline` | `sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:569586682ceac6667f87da7591627eb01337c768f757e93fab911591f2c3780d) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:bee9ce97bd72a082fa676f370938d01f3ab651598df4ca4861bc579f761c1215"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "workflow_dispatch",
      "1.3.6.1.4.1.57264.1.3": "4e8326d2400ffb36f39aebb252188492c25fea84",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/nginx",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDeNrMAPAs2vyXMgyEEzujaYdews6NMdf/mBF2pHhJasQIgKteBBjRXCKM4Zc3UQGMoky3J6TzfJrGnKDq8WvCuIX4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NTY0NTQ1MzdjMTgzZGVkNmQ5NzBmMGIwMTRlNmI4OGNmMzUyYWU2OWQzMzBjMjcwMWNiMzBmMWI2NzI1MTRhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FTUNJRm1hNTg0OG1ZekFwdnpic0FDb2xHL3dXRVhMVC9melduL21LSFAwV1l4ZUFoOUFrL0liYlR3MkRCQnM3RDN3WllFalZ0d0ZORS9ydSttZ0ZnWHU3ZE1QIiwicHVibGljS2V5Ijp7ImNvbnRlbnQiOiJMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VSemFrTkRRWHBwWjBGM1NVSkJaMGxWVm1WR1UwVmxNM2xEVVhOblQwVnhZVVF6TVdKUWJVOUVjSFl3ZDBObldVbExiMXBKZW1vd1JVRjNUWGNLVG5wRlZrMUNUVWRCTVZWRlEyaE5UV015Ykc1ak0xSjJZMjFWZFZwSFZqSk5ValIzU0VGWlJGWlJVVVJGZUZaNllWZGtlbVJIT1hsYVV6RndZbTVTYkFwamJURnNXa2RzYUdSSFZYZElhR05PVFdwSmVFMUVSVFZOYWtGM1RWUlJlRmRvWTA1TmFrbDRUVVJGTlUxcVFYaE5WRkY0VjJwQlFVMUdhM2RGZDFsSUNrdHZXa2w2YWpCRFFWRlpTVXR2V2tsNmFqQkVRVkZqUkZGblFVVmFORXRTVEROaVkwdEdUa1ZwWm10bGVVbE5VVGczTUZnM01YTnJOV05ZVkhSQmFIZ0tSMm80U3k4cmVIZHhURGRYWjNkbk56bHBhVzkyUnpOSGVHUjRiVkU1VkRWa1NqZDJUSEZOUWpWNlMwMTRiMGh5VUhGUFEwRnNZM2RuWjBwVVRVRTBSd3BCTVZWa1JIZEZRaTkzVVVWQmQwbElaMFJCVkVKblRsWklVMVZGUkVSQlMwSm5aM0pDWjBWR1FsRmpSRUY2UVdSQ1owNVdTRkUwUlVablVWVTNRblJNQ2padlZHRm1kRWxZVldKV1UwaEJTbEJFYkM4cmQyOXZkMGgzV1VSV1VqQnFRa0puZDBadlFWVXpPVkJ3ZWpGWmEwVmFZalZ4VG1wd1MwWlhhWGhwTkZrS1drUTRkMXAzV1VSV1VqQlNRVkZJTDBKR01IZFhORnBhWVVoU01HTklUVFpNZVRsdVlWaFNiMlJYU1hWWk1qbDBUREpPYjFsWGJIVmFNMVpvWTIxUmRBcGhWekZvV2pKV2Vrd3lOVzVoVnpVMFRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZDa3d5YUd4WlYxSjZUREl4YUdGWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWG9LVEcxa2NHUkhhREZaYmxaNldsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFXWkNaMjl5UW1kRlJVRlpUeTlOUVVWRFFrSkdNMkl6U25KYWJYaDJaREU1YXdwaFdFNTNXVmhTYW1GRVFUSkNaMjl5UW1kRlJVRlpUeTlOUVVWRVFrTm5NRnBVWjNwTmFscHJUV3BSZDAxSFdtMVphazB5V21wTk5WbFhWbWxaYWtreENrMXFSVFJQUkZFMVRXMU5lVTVYV214WlZHY3dUVUozUjBOcGMwZEJVVkZDWnpjNGQwRlJVVVZFYTA1NVdsZEdNRnBUUWxOYVYzaHNXVmhPYkUxRFZVY0tRMmx6UjBGUlVVSm5OemgzUVZGVlJVWXlUbTlaVjJ4MVdqTldhR050VVhSaFZ6Rm9XakpXZWt3eU5XNWhWelUwVFVJd1IwTnBjMGRCVVZGQ1p6YzRkd3BCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2Q2xWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5MMGhYV0dRMFFVRkJVVVJCUldOM1VsRkpaMVJ6THk4S0wzWXZMMFV6U0dWNmEyVlZiRTlZWmxKcU5FRjViakZOWWpWRlpVMVpTM0ozYkhsSVJVMHdRMGxSUkdNeWFGQm9kbFkzWmxCRlJuRlhlRTV4YlVONGNBcDZlVkZ6UjFoWU9HaFRNRnBaWm1ZclFuQm9kbFY2UVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV2UVVSQ2JFRnFRVE5GYW0xMFMwaFVZakl2UjFKc1RqazVDbmxSWlhSRVV6SkphVFZDTTJoak1IbFBkR05DZGtoblpYZGpOME5LV2pSeGVVTmpTVVJtTVZoSk5rTmFVVTl6UTAxUlExUktiSE5wTWxKNFJYVjBkalFLUkdkNWNVbHpiVkFyTTFGRVQycG1jMkZXYUdsTVNFWXplbGxEVEZJMlRFbHFSbmM0TkVOc2NYVmtXazVuYVVwa2JsQkJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666209710,
          "logIndex": 5451486,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/nginx/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/nginx",
      "githubWorkflowSha": "4e8326d2400ffb36f39aebb252188492c25fea84",
      "githubWorkflowTrigger": "workflow_dispatch",
      "run_attempt": "1",
      "run_id": "3284499124",
      "sha": "4e8326d2400ffb36f39aebb252188492c25fea84"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

