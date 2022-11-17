# jdk

[![CI status](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/jdk/actions/workflows/release.yaml)

WORK IN PROGRESS.

These images are currently being migrated to a new set-up. Pulling images from
`cgr.dev/chainguard/jdk` will pull new Wolfi (glibc) based images, which do not match the images built
from `apko.yaml` in this repository. 

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `openjdk-jre-17-20221109` | `sha256:35f2836f1afa57fa1064e481d2e10e14c756b98a7a54a37cfdf138ebc564342b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:35f2836f1afa57fa1064e481d2e10e14c756b98a7a54a37cfdf138ebc564342b) | `amd64` |
| `openjdk-jre-17` `openjdk-jre-17-20221117` `openjdk-jre-17.0` `openjdk-jre-17.0.5` `openjdk-jre-17.0.5.8` `openjdk-jre-17.0.5.8-r1` | `sha256:e519ff3e3548398b88394323a81cfa26d7c264133fa2f3ad7d194c0f04688591`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e519ff3e3548398b88394323a81cfa26d7c264133fa2f3ad7d194c0f04688591) | `amd64` |
| `openjdk-11-20221109` | `sha256:01ab33f239cb9bab311ba4fe63b1f85864de6dd6d0b3119ea7d5ec638a1e4e5a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:01ab33f239cb9bab311ba4fe63b1f85864de6dd6d0b3119ea7d5ec638a1e4e5a) | `amd64` |
| `openjdk-17-20221109` | `sha256:ad0036b87381b5a8a91f92be081b5b1a0027f88f52f87664a82b1820c29fe564`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ad0036b87381b5a8a91f92be081b5b1a0027f88f52f87664a82b1820c29fe564) | `amd64` |
| `openjdk-jre-17-20221112` | `sha256:3857b8fcc16d0e592d4c290c9d48baa3d9d467ff4d4aeca20ad0d882f4ac96f3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3857b8fcc16d0e592d4c290c9d48baa3d9d467ff4d4aeca20ad0d882f4ac96f3) | `amd64` |
| `openjdk-11-20221115` | `sha256:447adefdd3ce59479eb81a8aabed1a43fa3f146a1715146941bc76b0394a0a93`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:447adefdd3ce59479eb81a8aabed1a43fa3f146a1715146941bc76b0394a0a93) | `amd64` |
| `openjdk-jre-17-20221114` | `sha256:bba5411ec8c9765e5f4187919b0f0f35a51c8f362588f59d2d579b0a3fc89577`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bba5411ec8c9765e5f4187919b0f0f35a51c8f362588f59d2d579b0a3fc89577) | `amd64` |
| `openjdk-jre-17-20221115` | `sha256:137648ebdccfad5f41510729f3519f53f719c21e82c71ef76756ff19b371d997`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:137648ebdccfad5f41510729f3519f53f719c21e82c71ef76756ff19b371d997) | `amd64` |
| `openjdk-jre-11-20221115` | `sha256:23e333db93a843f5969e811b81b1319f447a19ce8508674aed7fc32ef6e927ad`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:23e333db93a843f5969e811b81b1319f447a19ce8508674aed7fc32ef6e927ad) | `amd64` |
| `latest` | `sha256:f15bc574cae0c15d52c545a10f41fc458770831bba24bf93bf716c8f60f3ebce`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f15bc574cae0c15d52c545a10f41fc458770831bba24bf93bf716c8f60f3ebce) |  |
| `openjdk-11-20221112` | `sha256:0ae0fcce6ae0549a41cd01ccfb0c4702cae94f4edef8a2c27dc501cab00eb9c7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0ae0fcce6ae0549a41cd01ccfb0c4702cae94f4edef8a2c27dc501cab00eb9c7) | `amd64` |
| `openjdk-jre-11-20221116` | `sha256:e52e76bdfeba942931021985dd98a4525a5fd31e9845a4b18cc39565f4ce696c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e52e76bdfeba942931021985dd98a4525a5fd31e9845a4b18cc39565f4ce696c) | `amd64` |
| `openjdk-11` `openjdk-11-20221117` `openjdk-11.0` `openjdk-11.0.17` `openjdk-11.0.17.8` `openjdk-11.0.17.8-r1` | `sha256:51b434ef4be36b64d24a8a6e1e7b59bab667c20a1ede181d4e00120f1efdd74c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:51b434ef4be36b64d24a8a6e1e7b59bab667c20a1ede181d4e00120f1efdd74c) | `amd64` |
| `openjdk-17-20221111` | `sha256:6d978b8a11bd9864f9c9a444be420c47173f1978e448acbce0a901a722d682aa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6d978b8a11bd9864f9c9a444be420c47173f1978e448acbce0a901a722d682aa) | `amd64` |
| `openjdk-jre-11-20221113` | `sha256:af6e0eeea9d4225a35e253675ceac456bf5d5bfff807d303878b0b275b8c6d86`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:af6e0eeea9d4225a35e253675ceac456bf5d5bfff807d303878b0b275b8c6d86) | `amd64` |
| `openjdk-jre-17-20221113` | `sha256:e385f99f76b6dcfdea62e518a3b6d26fbd63250e231a643669e829024267ef83`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e385f99f76b6dcfdea62e518a3b6d26fbd63250e231a643669e829024267ef83) | `amd64` |
| `openjdk-jre-11-20221109` | `sha256:3805ce10c4eae441ff9a27542dd182477256bc18f537698e5551a18684b5b411`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3805ce10c4eae441ff9a27542dd182477256bc18f537698e5551a18684b5b411) | `amd64` |
| `openjdk-17-20221110` `openjdk-17.0.5.8-r0` | `sha256:66a1fe47c510762ad8c0e9abedd54c6b19eafd7741817598e4f67d988fb59566`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:66a1fe47c510762ad8c0e9abedd54c6b19eafd7741817598e4f67d988fb59566) | `amd64` |
| `openjdk-17-20221114` | `sha256:d280b49e3fbaa037691cce913a31a791fb567a752f22b8d4bc84951c2e36318f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d280b49e3fbaa037691cce913a31a791fb567a752f22b8d4bc84951c2e36318f) | `amd64` |
| `openjdk-11-20221116` | `sha256:2dfe0cfb5a78efff4869abfdd48b3e302a73deefd320c0d1d0a0964bca930526`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2dfe0cfb5a78efff4869abfdd48b3e302a73deefd320c0d1d0a0964bca930526) | `amd64` |
| `openjdk-17-20221116` | `sha256:570a36de0d348915bd6f3244ffbb06fb9cd9fb95a154e2774a28319e08579f70`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:570a36de0d348915bd6f3244ffbb06fb9cd9fb95a154e2774a28319e08579f70) | `amd64` |
| `openjdk-jre-17-20221110` `openjdk-jre-17.0.5.8-r0` | `sha256:3d2094ad4733cb2c5b828f2185e0391d3f8dacc82d1620a3a364aef14658cd90`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3d2094ad4733cb2c5b828f2185e0391d3f8dacc82d1620a3a364aef14658cd90) | `amd64` |
| `openjdk-jre-11-20221110` `openjdk-jre-11.0.17.8-r0` | `sha256:04fcbc390c8b4a3d28d6d52fd2feab3bcfb4ebf520a0e7aeb80ab8332927d3ce`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:04fcbc390c8b4a3d28d6d52fd2feab3bcfb4ebf520a0e7aeb80ab8332927d3ce) | `amd64` |
| `openjdk-jre-11-20221112` | `sha256:585b5929c1e32bbb320acf22118e1134a95e881ff316a1605c1e2c9e0384a89e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:585b5929c1e32bbb320acf22118e1134a95e881ff316a1605c1e2c9e0384a89e) | `amd64` |
| `openjdk-jre-11-20221114` | `sha256:9382574d05acb78e54a2e3d6cad5104d03844856c4d8d811147e7d597b5e3e28`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9382574d05acb78e54a2e3d6cad5104d03844856c4d8d811147e7d597b5e3e28) | `amd64` |
| `openjdk-jre-11` `openjdk-jre-11-20221117` `openjdk-jre-11.0` `openjdk-jre-11.0.17` `openjdk-jre-11.0.17.8` `openjdk-jre-11.0.17.8-r1` | `sha256:56a4d0903b703a100143bf704b767938d9580a71f31b4c26fd5fdb433032e8b9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:56a4d0903b703a100143bf704b767938d9580a71f31b4c26fd5fdb433032e8b9) | `amd64` |
| `openjdk-11-20221110` `openjdk-11.0.17.8-r0` | `sha256:9fa1477171b186efdaa27345de2397bc3e8cfd5eee9b08b5c3dd08ec4bc54281`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9fa1477171b186efdaa27345de2397bc3e8cfd5eee9b08b5c3dd08ec4bc54281) | `amd64` |
| `openjdk-jre-11-20221111` | `sha256:f9a73a99b36fd36fbbefd467d1a6d1d0227248e55bbd14f4e44f3302dbd850a9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f9a73a99b36fd36fbbefd467d1a6d1d0227248e55bbd14f4e44f3302dbd850a9) | `amd64` |
| `openjdk-17-20221112` | `sha256:ea6dc49be6388c72f4589698ef677c3b0f5f3a0aafd6b5c963d797d7369a8018`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ea6dc49be6388c72f4589698ef677c3b0f5f3a0aafd6b5c963d797d7369a8018) | `amd64` |
| `openjdk-11-20221114` | `sha256:39229c5a8b71000666f1ab8d43bede22d8d10e7a8d9b65afa509e74d7fe7c4d8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:39229c5a8b71000666f1ab8d43bede22d8d10e7a8d9b65afa509e74d7fe7c4d8) | `amd64` |
| `openjdk-17` `openjdk-17-20221117` `openjdk-17.0` `openjdk-17.0.5` `openjdk-17.0.5.8` `openjdk-17.0.5.8-r1` | `sha256:e952aaccfcb169183b20b1eb7cb1586d0d85a5b2b4b8d361ee108f54b6913807`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e952aaccfcb169183b20b1eb7cb1586d0d85a5b2b4b8d361ee108f54b6913807) | `amd64` |
| `openjdk-jre-17-20221111` | `sha256:89047fc2fdf42d2f141b53fa88f04119579a7e75dc3963f73c41c853161e8480`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:89047fc2fdf42d2f141b53fa88f04119579a7e75dc3963f73c41c853161e8480) | `amd64` |
| `openjdk-11-20221111` | `sha256:07d6f49c42600d68ffa2d022a767ee8a2bb11330d6ab3909ab5030f87c85a6fc`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:07d6f49c42600d68ffa2d022a767ee8a2bb11330d6ab3909ab5030f87c85a6fc) | `amd64` |
| `openjdk-17-20221113` | `sha256:57c17fb417a01d7a7a539041cdf1ce8493fcb4cc30a93ad2a3d6e9b88487302c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:57c17fb417a01d7a7a539041cdf1ce8493fcb4cc30a93ad2a3d6e9b88487302c) | `amd64` |
| `openjdk-11-20221113` | `sha256:3f21f911e33cb767fe0cee6da9938ff111cd3b1d1c83635940f37892e6302774`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f21f911e33cb767fe0cee6da9938ff111cd3b1d1c83635940f37892e6302774) | `amd64` |
| `openjdk-17-20221115` | `sha256:3b2f7aeb62652c4b4c1b1c1ea10f4571a2f961953b501f4941129e2c8f899f61`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3b2f7aeb62652c4b4c1b1c1ea10f4571a2f961953b501f4941129e2c8f899f61) | `amd64` |
| `openjdk-jre-17-20221116` | `sha256:158ca109b5a9852001471a3738861dedf5ae1873afbbb4c0168151f901e00f8f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:158ca109b5a9852001471a3738861dedf5ae1873afbbb4c0168151f901e00f8f) | `amd64` |



## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/jdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/jdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/jdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:f15bc574cae0c15d52c545a10f41fc458770831bba24bf93bf716c8f60f3ebce"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5bc07fbe6a638e5855a02b518c780e137a401c92",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/jdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC7C+bqyqkuiwV++Sz0Qzm229ZgAcvgPgZiyV4jTsXr3wIhAK9Cc0REHw1XMoxEspAdNSYBZy/T09+f2B7WaNP4TFl1",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMTNiNDgwZTAzZjE4ZmE1NzU4YzMyNDYwOTNlMGIwYmFkYjhlYzdiMTc0N2ZiZjZkZjk3M2YyNTk3MjVlNTlkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNmOUVvY1dZWWZGdzJWOFB3ckcrMDhyK1g4RkhYYmhOZzIzeVlYM3JsV0lnSWhBSjBMaWJhbWc2Q3hFUzFKaXd1T2NNUVZMOVdjejlXVzhJWXd5RnRZd252eiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlpUZFdWa0oyZFRabFUzZFFRbWhMSzI0elRVUlhhbWQzU1RZMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVXdUbnBGZWxkb1kwNU5ha2w0VFZSRk0wMUVSVEZPZWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4VEhReU5GbDNaWEJYUkROcWRtNWljVEJDTUZGblJVSnBUVXAzZUcxMWMyVlVXbUVLTDNJd1RGRnpSMnQyS3psb1NsQklaV3RpT0RocllXeEliSFZ6VG5WMGNFNVJjVXh4TVVaWFpuVnBTMnhtTkM5RVpEWlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0VUhwTENqbGxhSFpEY0ZWaFZESXhNbVYyVjNkSGJWUllNbmROZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Y0d0aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsZEthazFFWkcxWmJWVXlXVlJaZWs5SFZURlBSRlV4V1ZSQmVWbHFWWGhQUjAwelQwUkNiRTFVVFROWlZGRjNDazFYVFRWTmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1Y1ZwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUldjd1ZFZFhVVUZCUWtGTlFWTkVRa2RCYVVWQk1HczViWEV6UkdoUmJqVXhSR3hKZWt0S1ZYRUtjMDlOU1RJeWMySTNORGhNYVhwNE16Z3paVXBHVUVWRFNWRkVWbFl2TUd0UmNXdHpOVXgxY0VablYyTjRkQzh6VmtGMlFrVkZhV1ZzTm5oR1UwRTVUd3B6VkdrMk9XcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUQjFlRWt6S3pWT2NEWlNWSFo0UzJsVldubFVPV0pIWkV4clpTdEJjaXQ2Q21sTGJHaHdSSE5KVVZVeVZEaEZhVmxUVkdFMkt6TmxVVm8zY1V4WE9DdE1RV3BDVjBaRk9YUjFSa3BHYW1aUWJ6RTNjbnBPZUZkclZYVkVUbEZKVTNZS1pHdE1kaXR0VWxJck1tOVJla2s0WWtselZtczNlVEZCVTFoeU1qQXlWMDk2TjBFOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668649634,
          "logIndex": 7242802,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/jdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/jdk",
      "githubWorkflowSha": "5bc07fbe6a638e5855a02b518c780e137a401c92",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484635298",
      "sha": "5bc07fbe6a638e5855a02b518c780e137a401c92"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

