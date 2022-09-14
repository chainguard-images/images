# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/alpine-base/actions/workflows/release.yaml)

Alpine base image built with distroless tools.

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `20220304` | `sha256:b6d0a93e443467054243e205ab6aba7219d503ca3f103948896fc8641bb7585a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b6d0a93e443467054243e205ab6aba7219d503ca3f103948896fc8641bb7585a) |  |
| `20220308` | `sha256:c4dfa83046ad1c17cf5c9356a0757919f0bffd641a0ea1ba6d7961658a74ee59`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4dfa83046ad1c17cf5c9356a0757919f0bffd641a0ea1ba6d7961658a74ee59) |  |
| `20220315` | `sha256:f09d9579490cc6afbd4689c9a5945a2d7fa68c4c2eb84815fa56b0754af276d0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f09d9579490cc6afbd4689c9a5945a2d7fa68c4c2eb84815fa56b0754af276d0) |  |
| `20220328` | `sha256:cf66d2646278ca469d2b14f79f4acd460f602acb084a4b9f1a6d9529e0fa8082`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cf66d2646278ca469d2b14f79f4acd460f602acb084a4b9f1a6d9529e0fa8082) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220318` `20220319` `20220320` | `sha256:67a6c71a4bb998c2e1022bd64638727c01ade46a91051b5bae539082fa60e3c0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:67a6c71a4bb998c2e1022bd64638727c01ade46a91051b5bae539082fa60e3c0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220409` `20220410` | `sha256:3eb71d59ee6758c358c62b0dc6ffb90b138de4d7d212430a9c51a6528e367aaf`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3eb71d59ee6758c358c62b0dc6ffb90b138de4d7d212430a9c51a6528e367aaf) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220421` `20220422` `20220423` `20220424` | `sha256:08c4916687ae6431f8f7c3b3d8943e74ded6197017a31d814e625e96b12e8f29`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:08c4916687ae6431f8f7c3b3d8943e74ded6197017a31d814e625e96b12e8f29) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220428` | `sha256:3947f67f8d7ed60531de5244a7572c8d9ba3e84a9810fd02f8878f52e22d6e7e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3947f67f8d7ed60531de5244a7572c8d9ba3e84a9810fd02f8878f52e22d6e7e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220302` | `sha256:413bcae11977ff02d0ff7bee244f56c192baafaf318c83470be1fc6e37afbe0e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:413bcae11977ff02d0ff7bee244f56c192baafaf318c83470be1fc6e37afbe0e) |  |
| `20220306` | `sha256:175b26e5dd2ee098d6071d775f07b71951cb5a95c1f19a57ebff7a90c60e75ee`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:175b26e5dd2ee098d6071d775f07b71951cb5a95c1f19a57ebff7a90c60e75ee) |  |
| `20220307` | `sha256:cdf44f7e0534d9579cceca212d1c1874132212c347d77ce4f6566bee503a95bd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cdf44f7e0534d9579cceca212d1c1874132212c347d77ce4f6566bee503a95bd) |  |
| `20220317` | `sha256:53a86d7bb98b2ca83e55bf78e7840e1b0adbfc0b13944c489685b680d9554ed8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:53a86d7bb98b2ca83e55bf78e7840e1b0adbfc0b13944c489685b680d9554ed8) |  |
| `3.17_alpha20220715-r0` | `sha256:f7c7326973e7215457f76f6ab6786d899ac2649706f698707d9efe9f770d8743`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f7c7326973e7215457f76f6ab6786d899ac2649706f698707d9efe9f770d8743) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `3.17_alpha20220809-r0` | `sha256:09ffedb199e159c97bd59338703e2fb82c73190be9b055558026c5ecdaf45b4a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:09ffedb199e159c97bd59338703e2fb82c73190be9b055558026c5ecdaf45b4a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220414` | `sha256:c4b3b85fab777ccd8d6604075aace2a02c1563fcf5f95237151265b1e6cb54b0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c4b3b85fab777ccd8d6604075aace2a02c1563fcf5f95237151265b1e6cb54b0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220420` | `sha256:a72c0636c40a3dea33b099fa40405a3ea1e440ffa6ca003e13a6594a68f2d8ec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a72c0636c40a3dea33b099fa40405a3ea1e440ffa6ca003e13a6594a68f2d8ec) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220303` | `sha256:4e0a5c3e8669935e22aed1331254240f30f372825103df476e8bfeb6ab8980a6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4e0a5c3e8669935e22aed1331254240f30f372825103df476e8bfeb6ab8980a6) |  |
| `20220305` | `sha256:b09b225c0b76f9502ca0d426749fc7810c79548d39f593576cc5a7f453691ed4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b09b225c0b76f9502ca0d426749fc7810c79548d39f593576cc5a7f453691ed4) |  |
| `20220326` | `sha256:b803a64d93ec4f646cc882d15c285cbed5f65dc18d8a41e1ac6702998efa704f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b803a64d93ec4f646cc882d15c285cbed5f65dc18d8a41e1ac6702998efa704f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220329` `20220330` `20220331` `20220401` `20220402` `20220403` | `sha256:37213df43839e55aac18a31235495ab6fb5385d401824e92488c8a50a1d34e4a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:37213df43839e55aac18a31235495ab6fb5385d401824e92488c8a50a1d34e4a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220310` | `sha256:5f8e3f897fc7820ee60808d2b1b99b32e2c65b3a4a02caf2ce99dff08e4b24a8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5f8e3f897fc7820ee60808d2b1b99b32e2c65b3a4a02caf2ce99dff08e4b24a8) |  |
| `20220429` | `sha256:669e9d0d09fb2edd5cb2f2978a230c0bc08565ff475bb88582902028d27755c5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:669e9d0d09fb2edd5cb2f2978a230c0bc08565ff475bb88582902028d27755c5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220311` | `sha256:bfdd37f89b544b5f90936191a69a46dd67d98b537874d57d3e559ae70104e701`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bfdd37f89b544b5f90936191a69a46dd67d98b537874d57d3e559ae70104e701) |  |
| `20220312` | `sha256:c8509a92c3501ebca4ca531c8807aaa292172a48b58a12cf2d52c4354632bfea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c8509a92c3501ebca4ca531c8807aaa292172a48b58a12cf2d52c4354632bfea) |  |
| `20220425` `20220426` | `sha256:a2ac99cc34e427ec344adb30ec0c9a471ae8312a80b4e61df6f9b4498ab25a04`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a2ac99cc34e427ec344adb30ec0c9a471ae8312a80b4e61df6f9b4498ab25a04) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220412` | `sha256:44e5e908759337a42740b62ca4c1bc71125d931f71225ef577d4d25d0726c060`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:44e5e908759337a42740b62ca4c1bc71125d931f71225ef577d4d25d0726c060) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220321` `20220322` `20220323` `20220324` | `sha256:e3e8f37a7f83189aaad98a99ee1a27c19e21dc25b40a5c4f0270fd152b8b7ff7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e3e8f37a7f83189aaad98a99ee1a27c19e21dc25b40a5c4f0270fd152b8b7ff7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220325` | `sha256:796740df8f76330d7615e2245e3367f995ec95f5b62b81bb25d4ebe0086d7f7d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:796740df8f76330d7615e2245e3367f995ec95f5b62b81bb25d4ebe0086d7f7d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220404` `20220405` `20220406` `20220407` | `sha256:b6c9c4469288d535f1a49eee824126282a6ef61744380c734aca18f5d3ef9499`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b6c9c4469288d535f1a49eee824126282a6ef61744380c734aca18f5d3ef9499) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220411` | `sha256:cc177ccc62d3d487e211b54981adaf092441cb6a83e1af4b94e703c899a05752`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cc177ccc62d3d487e211b54981adaf092441cb6a83e1af4b94e703c899a05752) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220314` | `sha256:288dc97ead94a7f471598ca107b316f20357f0019a7ce24fbce44ab5a1ea894b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:288dc97ead94a7f471598ca107b316f20357f0019a7ce24fbce44ab5a1ea894b) |  |
| `20220415` `20220416` `20220417` `20220418` `20220419` | `sha256:6a0680824538b9e7d88a4d966ca028b659b5e4976eabae997edf82b3d1d9fa9e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6a0680824538b9e7d88a4d966ca028b659b5e4976eabae997edf82b3d1d9fa9e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `latest` | `sha256:7ad13ec60c7b50d107bbe922d84ae0026c781ec5a70dd114906ad5fe91fc8d9b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7ad13ec60c7b50d107bbe922d84ae0026c781ec5a70dd114906ad5fe91fc8d9b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `3.17_alpha20220809-r1` | `sha256:73d3cd83c1a54d6b3445e9e97dbad39b345a8b91319f39c0447951d1022822c3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:73d3cd83c1a54d6b3445e9e97dbad39b345a8b91319f39c0447951d1022822c3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220413` | `sha256:f37e202da93956c46c13bffbbcd012bfc6c89b19659a6c21783d388ec0cd481d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f37e202da93956c46c13bffbbcd012bfc6c89b19659a6c21783d388ec0cd481d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220313` | `sha256:6719dd1b04902bf1220526c23895b8786a92ec6f79b5740d13266184a74d9ac6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6719dd1b04902bf1220526c23895b8786a92ec6f79b5740d13266184a74d9ac6) |  |
| `20220316` | `sha256:338c0c095cbe832fb2ee5ac8753ac6af226ba461cc38f7d3009d4e2c0be8e107`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:338c0c095cbe832fb2ee5ac8753ac6af226ba461cc38f7d3009d4e2c0be8e107) |  |
| `20220327` | `sha256:899a0fdff08cb08c5bc3ae740ee66e5e11062442b9299455a57f4b1e01818fd5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:899a0fdff08cb08c5bc3ae740ee66e5e11062442b9299455a57f4b1e01818fd5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `20220408` | `sha256:eb48b5c72738973afdb51df14e3184c4a7534851b72121ce7dccc4f00dccdbea`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:eb48b5c72738973afdb51df14e3184c4a7534851b72121ce7dccc4f00dccdbea) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run distroless.dev/alpine-base echo "hello distroless"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/alpine-base:latest | jq
```

Output:
```
Verification for distroless.dev/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:7ad13ec60c7b50d107bbe922d84ae0026c781ec5a70dd114906ad5fe91fc8d9b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "417c560c281532a4f32d72736953e5184ad0fc0a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDHe+i0NbUZGL6a9A+XqheP1oj1pEiubNxxMFv3HHmu7QIgcs8AOswzZdfVS8jmL9fqwBlgbWZmILeoHpPg5auVx+Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1ZDY2YmIwZmRhMmY4ZjllZDZjNjk4NTU5YjBmODAwNjQwZTA2ZDFmNGYzMzdkYmMxODBjNTM1MmU2NmE2YzYyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRVVNQ3c4LzB6eW1jc1g0RWlDOFczeDc1WWZoOVQ0K1ByMFBQeWE0Z2FzZkFpQVJMWkZkSGZMSHhkZGlJVGhiZ3dWa0wydEhIS1RQNmI2aEpMb0t2QWlHRkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhsdFowRjNTVUpCWjBsVldXOXBRVXBDV2pGRlNEWkZNVXN2T1RaM1pYbzVVMjgzTDNjMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRCTlZGVXhUMVJCZUZkb1kwNU5ha2wzVDFSRk1FMVVXWGRQVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ5UjBGVFQwMDRUVEZsWTNOT1FtRndlak12YXpkUFYzUlVaMmxtVGtsWU1VOTBiMjBLYURGaGFIQjJVeXQxT1dvelQzQkNVWEppV21sSU5tNW1XbVZqYVZGMFkycHNTMUZ4Y2psalR6aDFOR3cwTWxwMlZXRlBRMEZyWjNkblowcEZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZT1hsTkNtdFRjRGcwUW1OWWRIUjFZM0Z1YlhKTFZuVXlXV3gzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwbldVUldVakJTUVZGSUwwSkdkM2RYYjFwWllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BaVjNoM1lWYzFiRXhYU21oak1sVjJURzFrY0dSSGFERlphVGt6WWpOS2NscHRlSFprTTAxMlkyMVdjMXBYUm5wYVV6VTFXVmN4YzFGSVNteGFiazEyQ21GSFZtaGFTRTEyWWxkR2NHSnFRVFZDWjI5eVFtZEZSVUZaVHk5TlFVVkNRa04wYjJSSVVuZGplbTkyVEROU2RtRXlWblZNYlVacVpFZHNkbUp1VFhVS1dqSnNNR0ZJVm1sa1dFNXNZMjFPZG1KdVVteGlibEYxV1RJNWRFMUNTVWREYVhOSFFWRlJRbWMzT0hkQlVVbEZRa2hDTVdNeVozZE9aMWxMUzNkWlFncENRVWRFZG5wQlFrRjNVVzlPUkVVeldYcFZNazFIVFhsUFJFVXhUWHBLYUU1SFdYcE5iVkV6VFdwamVrNXFhekZOTWxVeFRWUm5NRmxYVVhkYWJVMTNDbGxVUVdOQ1oyOXlRbWRGUlVGWlR5OU5RVVZGUWtFMVJHTnRWbWhrUjFWblZXMVdjMXBYUm5wYVZFRnJRbWR2Y2tKblJVVkJXVTh2VFVGRlJrSkNXbXNLWVZoT01HTnRPWE5hV0U1NlRESkdjMk5IYkhWYVV6RnBXVmhPYkUxQ01FZERhWE5IUVZGUlFtYzNPSGRCVVZsRlJETktiRnB1VFhaaFIxWm9Xa2hOZGdwaVYwWndZbXBEUW1sbldVdExkMWxDUWtGSVYyVlJTVVZCWjFJNFFraHZRV1ZCUWpKQlFXaG5hM1pCYjFWMk9XOVNaRWhTWVhsbFJXNUZWbTVIUzNkWENsQmpUVFF3YlROdGRrTkpSMDV0T1hsQlFVRkNaM3A1Tlc1a1dVRkJRVkZFUVVWamQxSlJTV2hCVEZwR2JsSTBaWFJsWVVsT1RWcGxORUUwT0dvemJVNEtUVWsxVkRaNFNHNU5ZMmR0V0N0eFpIVjNha0ZCYVVKV1kycG9PRmR5ZEROaWFVcGFTRFJQZDJwa2FtSnlhMVpLUmtsRVpsSXZVV2N6UkhSbWFWcGpiQXAzUkVGTFFtZG5jV2hyYWs5UVVWRkVRWGRPYjBGRVFteEJha1ZCTWpWaWR6bFBWWE5QTVdkbEswd3ZZblJZWWtwdVNrRTNkbkJqTmpsamQxb3dWM1Z1Q21OWGEyNHhkbmhzTldJemVWSTRhMjVHVkM5M2RFZFRTRlExTmxWQmFrSTFORmhPTldJelRVdFlhbU56TkROR2EwaENXbGt4UTNwcWVuVlZZbVl5VXpJS1FUa3llRE4wVnk4clNtaENORXBOWmxnMmJ6STBLMlZGUTJOVVFqbFJTVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663171164,
          "logIndex": 3498115,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3054254946",
      "sha": "417c560c281532a4f32d72736953e5184ad0fc0a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

