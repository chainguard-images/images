# postgres

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/postgres/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/postgres/actions/workflows/release.yaml)

WORK IN PROGRESS

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/postgres:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `15` `15-20221117` `15.0` `15.0-r0` | `sha256:ccbdceeae9477d7570e9b13bf9291172295ff8a8140869fe5e8d187c1a555827`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ccbdceeae9477d7570e9b13bf9291172295ff8a8140869fe5e8d187c1a555827) | `amd64` |
| `11-20221111` | `sha256:0f7343f622fc9c063da350b1706d1a0a6fdc57bf6d89bba58db1faabcc219bb5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0f7343f622fc9c063da350b1706d1a0a6fdc57bf6d89bba58db1faabcc219bb5) | `amd64` |
| `13-20221113` | `sha256:d7d29895a9918e80c8b29082a789b8861a3ccd25d09db7fc8343c5d320386867`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d7d29895a9918e80c8b29082a789b8861a3ccd25d09db7fc8343c5d320386867) | `amd64` |
| `15-20221115` | `sha256:f799d385a983a26eb63425bf93de5919491b2711f691c5ecbfeaf14d54fb00c0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f799d385a983a26eb63425bf93de5919491b2711f691c5ecbfeaf14d54fb00c0) | `amd64` |
| `13-20221110` | `sha256:52b5cd14b7061e96a2cfb05c0956b9a49a072d6288d983a72d36cf9150c672cd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:52b5cd14b7061e96a2cfb05c0956b9a49a072d6288d983a72d36cf9150c672cd) | `amd64` |
| `11-20221116` | `sha256:2041f4f6800b91f7fe4d625e13de0eea3f7db585030bc1b19249b347a4c4d89d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2041f4f6800b91f7fe4d625e13de0eea3f7db585030bc1b19249b347a4c4d89d) | `amd64` |
| `12-20221116` | `sha256:080e0f3c96da8c997e1ab90592a2ff52e0398f94597e5a88ff9f0bd4829207df`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:080e0f3c96da8c997e1ab90592a2ff52e0398f94597e5a88ff9f0bd4829207df) | `amd64` |
| `latest` | `sha256:4dd3a101113d788056a6a7364afb99736a18bb3d50036f638f6ef769c7c390f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4dd3a101113d788056a6a7364afb99736a18bb3d50036f638f6ef769c7c390f6) | `amd64` |
| `11-20221110` | `sha256:96d094c4440affef2315d6400f3fc77364d96277d46fb60b343caedc81be3b42`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:96d094c4440affef2315d6400f3fc77364d96277d46fb60b343caedc81be3b42) | `amd64` |
| `15-20221112` | `sha256:bd5054be007571d20946e7d6b45dfac447500e911f6adb77fd0390db50924f06`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5054be007571d20946e7d6b45dfac447500e911f6adb77fd0390db50924f06) | `amd64` |
| `12-20221114` | `sha256:307cd2f074efe2ec86757a5ec495ced10de4bb37db18ddcf5158921ac571d1d6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:307cd2f074efe2ec86757a5ec495ced10de4bb37db18ddcf5158921ac571d1d6) | `amd64` |
| `13-20221115` | `sha256:17aef14962028845a6562ac5ba6c79d04d0aeeb62b0b47e182964700f15d95b3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:17aef14962028845a6562ac5ba6c79d04d0aeeb62b0b47e182964700f15d95b3) | `amd64` |
| `14` `14-20221117` `14.5` `14.5-r0` | `sha256:61ef9090152fc7aafabf5a1f387e83bf06daca45486c75ae1d4b3234f7139b49`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:61ef9090152fc7aafabf5a1f387e83bf06daca45486c75ae1d4b3234f7139b49) | `amd64` |
| `13` `13-20221117` `13.8` `13.8-r0` | `sha256:8bae0e0a03af5cbd79106a6461d4a629714049800ff9bf6e142300457c424fc5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8bae0e0a03af5cbd79106a6461d4a629714049800ff9bf6e142300457c424fc5) | `amd64` |
| `15-20221111` | `sha256:babe4e277c16ca2958098116fdd4411a86c816d1a796e6dacbc32e5993e1a68e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:babe4e277c16ca2958098116fdd4411a86c816d1a796e6dacbc32e5993e1a68e) | `amd64` |
| `12-20221112` | `sha256:a112e0ec6b910d7cd859d18e644a0bf4bde0b93744b736a0f8cd775510d7913d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a112e0ec6b910d7cd859d18e644a0bf4bde0b93744b736a0f8cd775510d7913d) | `amd64` |
| `14-20221114` | `sha256:6da6e97762fe1e3ffa36aa40c919a913bab8dddfdfa71731a915c54d953f10e6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6da6e97762fe1e3ffa36aa40c919a913bab8dddfdfa71731a915c54d953f10e6) | `amd64` |
| `12-20221115` | `sha256:a0cdca3aff58e88c4ab387f88dc65110248e4d8f0200d9d3aab9585b245b2e53`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a0cdca3aff58e88c4ab387f88dc65110248e4d8f0200d9d3aab9585b245b2e53) | `amd64` |
| `15-20221110` | `sha256:4bce23bf48ff1b4c0717ce1c195b01c2561437c8d012c2136101612e5a1b613d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4bce23bf48ff1b4c0717ce1c195b01c2561437c8d012c2136101612e5a1b613d) | `amd64` |
| `11` `11-20221117` `11.17` `11.17-r0` | `sha256:8c41d82be1873fc1edb406fd0cecbdc321fbd204eaae9abe6155be00634eba27`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8c41d82be1873fc1edb406fd0cecbdc321fbd204eaae9abe6155be00634eba27) | `amd64` |
| `11-20221112` | `sha256:a25c521caf2931bf49760841483aff87036ca824a988b89288f58fa47069fc0d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a25c521caf2931bf49760841483aff87036ca824a988b89288f58fa47069fc0d) | `amd64` |
| `13-20221112` | `sha256:34b59a897410a153ee55eb052b8ae396b04f45d0b5bc25f726d7f74d0ef91aeb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:34b59a897410a153ee55eb052b8ae396b04f45d0b5bc25f726d7f74d0ef91aeb) | `amd64` |
| `14-20221113` | `sha256:0328cb07a01a49fbba2c4185095ef2d7149798d79a023330ef0c362ed5c85999`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0328cb07a01a49fbba2c4185095ef2d7149798d79a023330ef0c362ed5c85999) | `amd64` |
| `15-20221113` | `sha256:301229ca4d3c6339c5d62cbaefc13b6a534ba91e7056c4ba50f7f8da17ecd8d2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:301229ca4d3c6339c5d62cbaefc13b6a534ba91e7056c4ba50f7f8da17ecd8d2) | `amd64` |
| `15-20221114` | `sha256:da2f6c70dc8c8c67deeaa90f06f4ad0b85bf11268ef4fea300632b5100e972b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:da2f6c70dc8c8c67deeaa90f06f4ad0b85bf11268ef4fea300632b5100e972b5) | `amd64` |
| `13-20221114` | `sha256:f0e6d5eca9a56af5612bb672b50f9178cb2770d801437ca2e2f23784557b640b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f0e6d5eca9a56af5612bb672b50f9178cb2770d801437ca2e2f23784557b640b) | `amd64` |
| `12-20221110` | `sha256:e8e0240d84f168fb0ad4c5cf572d3d75ae5c1bafa8eb2e164e428cbe34308644`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e8e0240d84f168fb0ad4c5cf572d3d75ae5c1bafa8eb2e164e428cbe34308644) | `amd64` |
| `14-20221110` | `sha256:f55e07f1dd9acd00683081b505aee22943ac76a104b6228cc9a0435585df066e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f55e07f1dd9acd00683081b505aee22943ac76a104b6228cc9a0435585df066e) | `amd64` |
| `12` `12-20221117` `12.12` `12.12-r0` | `sha256:c434db32dfea291fe0505b35ff71e091b5a04a72562997d10a3cd3d9271735eb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c434db32dfea291fe0505b35ff71e091b5a04a72562997d10a3cd3d9271735eb) | `amd64` |
| `12-20221111` | `sha256:e411b32dc1577b5b78de27fc1bdf3cc00a0c21b5c6b0d3c55fd453c8c8c622bb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e411b32dc1577b5b78de27fc1bdf3cc00a0c21b5c6b0d3c55fd453c8c8c622bb) | `amd64` |
| `13-20221111` | `sha256:f893dac6fd6ddf8e99020b9b6bcd25d33b0b0c79827bd5d43ff563c9cf633031`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f893dac6fd6ddf8e99020b9b6bcd25d33b0b0c79827bd5d43ff563c9cf633031) | `amd64` |
| `13-20221116` | `sha256:5beef8b5396a5837e448d7ef218548b41249d4dc97fa83b5c937510a20bc560b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5beef8b5396a5837e448d7ef218548b41249d4dc97fa83b5c937510a20bc560b) | `amd64` |
| `15-20221116` | `sha256:d721369f354c8fcae13f15832f74a1413ee70e937782e28e2b561883a2dd084d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d721369f354c8fcae13f15832f74a1413ee70e937782e28e2b561883a2dd084d) | `amd64` |
| `14-20221116` | `sha256:2b90365d872d11b03f3d01e7322d53d3c66748a86db694ab934a6152989afa6e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2b90365d872d11b03f3d01e7322d53d3c66748a86db694ab934a6152989afa6e) | `amd64` |
| `14-20221111` | `sha256:5eb8a4fe1b53560e45bcdef276b472c91eed86bc1a5f018ba5f5b39152266668`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5eb8a4fe1b53560e45bcdef276b472c91eed86bc1a5f018ba5f5b39152266668) | `amd64` |
| `12-20221113` | `sha256:db9f975ab0de97bf8124abd1c527015098f7b17949821f0069834be23c323592`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:db9f975ab0de97bf8124abd1c527015098f7b17949821f0069834be23c323592) | `amd64` |
| `11-20221114` | `sha256:a8d4de7eb2f72c12a51fc0c9406242c8ffb438200c6e8a5645b3a6b0d5c5ac7a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a8d4de7eb2f72c12a51fc0c9406242c8ffb438200c6e8a5645b3a6b0d5c5ac7a) | `amd64` |
| `14-20221115` | `sha256:7bcb0c2fa1cc002abb6668385aba29df3181d0fe2b86b129c1065b57da3d80e7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:7bcb0c2fa1cc002abb6668385aba29df3181d0fe2b86b129c1065b57da3d80e7) | `amd64` |
| `11-20221115` | `sha256:26933885fa516fec06fd35621c1c758958125d81c0fbcc92a78b520eb69e5e67`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:26933885fa516fec06fd35621c1c758958125d81c0fbcc92a78b520eb69e5e67) | `amd64` |
| `14-20221112` | `sha256:ab1f3c5325c119c8e3f3d1139dbd2eb0906a10a107de16bd48740a1614f378a8`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ab1f3c5325c119c8e3f3d1139dbd2eb0906a10a107de16bd48740a1614f378a8) | `amd64` |
| `11-20221113` | `sha256:a748346a2bf5fde1c0cf3e34cd3e22165f6b1104b8a7b7f7c3a9cfda1c336bc1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a748346a2bf5fde1c0cf3e34cd3e22165f6b1104b8a7b7f7c3a9cfda1c336bc1) | `amd64` |


## Usage

## Running PostgreSQL

The only mandatory environment variable needed by the PosgreSQL image is `POSTGRES_PASSWORD`

To test and __not__ persist PostgreSQL data run...
```sh
docker run -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

Alternatively, to persist PostgreSQL data you can mount a volume mapped to the data folder
```sh
docker run -v $PWD/data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
```

In a __new__ terminal exec into the running container and use the PosgreSQL to create a DB and Table
```sh
docker exec -ti postgres-test bash
```

Connect using the postgres user
```sh
su postgres
```

Create a test DB
```sh
createdb test
```

Connect to the test DB
```sh
psql test
```

Create a table
```sh
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);
```

List the tables
```sh
\dt
```

You should see the newly created `accounts` table
```sh
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | accounts | table | postgres
(1 row)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/postgres:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/postgres:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/postgres"
      },
      "image": {
        "docker-manifest-digest": "sha256:4dd3a101113d788056a6a7364afb99736a18bb3d50036f638f6ef769c7c390f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "75b6e12c4acacc2d0d599c7138283c373196d922",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCO1xQU+lGfmI2BH5d/Ugru2ubp4F6pbUaACSYRZ61YSgIgQoH+avSSG8oGwsTAJJkddUHTDLPJSklvM+HNttrl/NE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMGI2N2YwNDQzY2YwNmE2N2MxNDg1NTVlMjUzNjQ1YzQ1MGQzYzk0M2Q4ZGJiNzYyMzkzZjg1MjMxYmZjNjI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURSQmMwNGQ0dHU1RmRMSDkwbG8zVzhyYW1hb21IVHlIVFozSUNyTVZNeTV3SWdLTjd0OUdDQk5qYnF4WTFCVHdDejVoQ0QvZ1h4YU04c3U3QlEySWxadVpJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwaFowRjNTVUpCWjBsVlpreGxZVEZGU1VsVVIwZDVSa3h1WXpWRU0weFZiVnA2TVd0TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVjZUMVJCZUZkb1kwNU5ha2w0VFZSRk0wMUVSVEJQVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY2WmpkVVZVVjFaM2RRUmxRd1kydEhTVE0zT0RSbVdVTk5PUzlRV0hvMmJXaFZWbUlLTjNJMlluWnlWbk13VkZJdldVaEpjQ3RyTmpsTk5EaDJVbUpaUlZKTlFqY3piRXhwYVVoalZ6TlFVbTlUUkhsaFRYRlBRMEZzVlhkblowcFNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZPVjBjNENrODBTR05qUlZkMVFrZDFOV2cxVUVoYVMyZFhTemxuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpOT1Ywa3lXbFJGZVZsNlVtaFpNa1pxV1hwS2EwMUhVVEZQVkd4cVRucEZlazlFU1RSTk1rMTZDazU2VFhoUFZGcHJUMVJKZVUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwZDFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT1VKSWMwRmxVVUl6UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEpUVGxSTkRSQlFVRlJSRUZGWjNkU1owbG9RVXR4Y2xaUFIyVUtjSHBKZUU0MVpqazVPQ3QxWnpsRk9VUk5PVzkxTVdkeVVrZzVhRXcwYUcxQ1RsSkhRV2xGUVN0M0sybFVNMlIwTDJoMVdtNTNWWEJQWlRaRFZFNVJiZ3AxTjNZeU5FRlFXalZCVVZadE4ydENUVzVCZDBObldVbExiMXBKZW1vd1JVRjNUVVJoUVVGM1dsRkpkMDlCU2tkNU1UQjBVak5KYWtGTVNrbEdVRVJMQ21ReWRqZFVTbXRTTUZWa1oxSmFOMmxvTTJ0SVVYZERUbXd5T1cwM2JuQkpaMGhZU1dreWJpODRNV1VyUVdwRlFYZ3JOMHRwUm1ZNFRFNVpNVUZ6ZFZFS1dGQjZSMUZpWkRWcFNubHRWVVkxYTFaMVlWTndhMjlLUzFjM09FTnZWVXRJVVZkWVFrRlNkVUZqYWxWSFRGZHVDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1668649147,
          "logIndex": 7242431,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "75b6e12c4acacc2d0d599c7138283c373196d922",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484609095",
      "sha": "75b6e12c4acacc2d0d599c7138283c373196d922"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

