# ko

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/ko/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/ko/actions/workflows/release.yaml)

This is an image that contains ko, go, and build-base.<br/><br/>This image is designed for use in situations where you would like to use `ko` with codebases that have C dependencies where `cgo` must be used. In these cases, staticly linking against musl instead of glibc results in smaller binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ko:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `0.11.2-r3` `latest` | `sha256:f48b11bd3e5060b9aa0f6fecb3e11c1d840b3d7e4f6b32832a2e91cb27639478`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f48b11bd3e5060b9aa0f6fecb3e11c1d840b3d7e4f6b32832a2e91cb27639478) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `s390x` |


## Usage

### Using with CGO

Navigate to the `example/` directory:

```
cd example/
```

Then run:

```
docker run --rm -it \
  -v ${PWD}:/work \
  --workdir=/work \
  -e KO_DOCKER_REPO=example.com \
  -e CGO_ENABLED=1 \
  cgr.dev/chainguard/ko build ./ \
    --push=false \
    --preserve-import-paths
```

This will build the example program, but not push it, due to `--push=false`.

To push, you will need to mount in your Docker config to provide auth by adding:

```
  -v $DOCKER_CONFIG:/docker-config \
  -e DOCKER_CONFIG=/docker-config \
```

If you're using Docker credential helpers, those will need to be made available in the container as well so that `ko` can invoke them.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/ko:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/ko:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/ko"
      },
      "image": {
        "docker-manifest-digest": "sha256:f48b11bd3e5060b9aa0f6fecb3e11c1d840b3d7e4f6b32832a2e91cb27639478"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "046faad65eda290482e28de5f9e9e05d70227b51",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/ko",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIC4/8dh1rPxWrdmZtdtLkyyZo24/4cusNZVwZMg1m2MJAiEA1uloqpCNg+EMPX0FsRwbSoMBx68boLKQAnMhOUC/0Xk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3M2FkOWUwYTlmOTk4NTVkMjExNjRkOTI1NDM1ZWFiYmY5ODIwOTAyMTU5MWI0YjM3OWI3MjYxZTQ0YmIyOTRjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRzQ1dXRpTWIzL3c2SU42elFNZi9nMWZPRDBVSHV4M1IvNkM0cHk5L0dFTEFpQXFKSVVVYVovS0pJTVVaelE5czVTaU5zWVp3UHIrdnRpLzRFWlk4eDEzekE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNWRU5EUVhoNVowRjNTVUpCWjBsVlRVeHBWMmQyVUM5SFNrWkJWV3BUWW1rM1kweHhSazV0V0VkUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFbDZUWHBOTkZkb1kwNU5ha2wzVDFSRk5FMUVTVEJOZWswMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZLVjBGRU5FOVFObWtyWXpGaU1VWnJRbmgzTWtSclYxVnNlV3N2VG01RFNuWlNUM29LYUVsSGQwNXFXamRZWm5GU016bElVWEJrYTJ3M1dsUnBhazVSWlhreFVsVnRZVlJ5VVdkblJsVkxWamgyWlZsbmREWlBRMEZxYzNkblowa3pUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxWVd4NENsUlRlVWh4T1hkSFZXRmtWMkZOTDBwdlEyZE1SVEF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFoUldVUldVakJTUVZGSUwwSkdUWGRWV1ZwUVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BoTWpoMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1dVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlEwaE9hbUZIVm10a1YzaHNUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBSQk1FNXRXbWhaVjFFeVRsZFdhMWxVU1RWTlJGRTBUVzFWZVU5SFVteE9WMWsxV2xSc2JFMUVWbXRPZWtGNVRXcGthVTVVUlhkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGQzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZPV2tkc2VtUklTbllLWWtkV2VtTjVPWEppZWtGa1FtZHZja0puUlVWQldVOHZUVUZGUjBKQk9YbGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMmRaYzBkRGFYTkhRVkZSUWdveGJtdERRa0ZKUldaUlVqZEJTR3RCWkhkQlNWbEtUSGRMUmt3dllVVllVakJYYzI1b1NuaEdXbmhwYzBacU0wUlBUa3AwTlhKM2FVSnFXblpqWjBGQkNrRlpUazlqWW1NMFFVRkJSVUYzUWtsTlJWbERTVkZFY25oa1NFSjNhbU5SVjNwak9GSkpXblY0YldKNk5YUXhOVE53TVVWNVJHNTFNMU5TYUVweGRFNEtiR2RKYUVGTE1FTTFRVkIwZUhaVFNsTlFLeXN3YTIxcFQzZE5jR0ozTVV4T1FXVXhhVzh3VVZoT1UxcHVTbFYwVFVGdlIwTkRjVWRUVFRRNVFrRk5SQXBCTW1OQlRVZFJRMDFEWldkWk0wUnRhR2RMTVdaWlIyNDRZakZZU0haSk5rNXRNbTFGT0VWVmNrWXZTWFF4TTFsT1V6Um1TV2QxZW1FMk1rMDFUM1ZpQ21RNFRXTkpOVTVMVDJkSmQxQk1URFpuUWxNd2QzRkJkV05ZVTA1YVYwSkxNa05uYWxWSGJuUTVWbk1yWm10NFNsaHpWRkZCU0d4SmNXNDBkM001YW5RS2F6SjNXRGxRUml0RE1HdHFDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1663468434,
          "logIndex": 3527969,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/ko/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075568262",
      "sha": "046faad65eda290482e28de5f9e9e05d70227b51"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

