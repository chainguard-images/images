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
| `latest` | `sha256:76bf5bdec368aba08ff653c3494c63596a27a9e10c0dcbd25b6c0a123004bf2f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:76bf5bdec368aba08ff653c3494c63596a27a9e10c0dcbd25b6c0a123004bf2f) | `amd64` |


## Usage

## Running PostgreSQL

The only mandatory environment variable needed by the PosgreSQL image is `POSTGRES_PASSWORD`

```sh
docker run -e POSTGRES_PASSWORD=password -ti --name postgres-test cgr.dev/chainguard/postgres:latest
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
        "docker-manifest-digest": "sha256:76bf5bdec368aba08ff653c3494c63596a27a9e10c0dcbd25b6c0a123004bf2f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1ebb88f1522cf3ab79e8d207207ffcb35f7e9830",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIGHcHGobmdo1BUUT93m4/zBmvon8kWdH8eZ8FEQy7qYwAiBwuqVB67HLCoMaEWXOIlx27OmHjqKi0oa4/EkdlbDlhw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2M2NkZDc1OWQ0NTQyZDNjZTA4MWFkYzA4NzliNGQwNjhlMDU2NjA2NmI2OTI2MTI1YTVmMzA2MzRiOWZjMTY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSFVSNFlhYVFUREVMMWpUM1ZRTHVuY3ZmZ3c1T1lQb3BwTXFMVHFyNllFTkFpQUpWOUZCV1E4MlIwc1Z2bW9HQWtjdGtoZTdxcHRkTnlhWjFxYy9UOWp3K0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlla05EUVhwWFowRjNTVUpCWjBsVlJuZERMM2t3U0hkNE9WZFVjMU42U0dOWlNVbDJWM0ZaVVc1SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFbDNUbnBSTWxkb1kwNU5ha2w0VFZSQmVFMUVTWGhPZWxFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMUVV4VGJHZHBhR3RtYzJWRVJYcE9URUZQYTNWamMyZDRVVFJoTWpKMVJUWmtWMFFLYWpoNGRVeHhhVGMxTDBaQ2NURXJTMWxtVEV0c1dVRnpjV1ZNVmt0S05ESnRNek5aVHpaNVdrWjRNMk5OWTAwd05rdFBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNWVROMkNsTlpSUzlOWmpaU1NVSmljU3RwV2tJeVdVZENZalZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWjNoYVYwcHBUMFJvYlUxVVZYbE5iVTV0VFRKR2FVNTZiR3hQUjFGNVRVUmplVTFFWkcxYWJVNXBDazE2Vm0xT01sVTFUMFJOZDAxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEVSSGd5UkRCQlFVRlJSRUZGWTNkU1VVbG9RVTFTU21sd1NHRUtMMUJUVXl0SlNVNVdTRVV6TW5NMUt6QlhhRWx5Umt0TmRuRjFZbGRGVVcxYWNrMUZRV2xCUjJSVVduTTVkVTlZU3paV04wRkpWbEV4Wm5GalRWWjNWZ3BQWld4cE4wWk1aMnA2YVdOQ1ZGZFFUVVJCUzBKblozRm9hMnBQVUZGUlJFRjNUbTlCUkVKc1FXcEZRWEk1YUdNeU4zbDNjbEp5SzNKUFdWaG1OVGN5Q21KalRFbFFOMU4wVlZGd1F6RnlZWGRZVTI5cU1EY3dZMHB2VUhZd2RUQTVSVTUzTmtwS2NsUnJWMUJNUVdwQ1kzWlZWWGRoTVZoNWMxb3ZWWE5rYkVRS1NVaFpVV3R0UldKdVpFTkJVWFIwYmxSTmVVWkVPRWhsVjBacVRqVjNOMjVTY3k5aE5sWmFRa3hrYTBsaVVHYzlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667268470,
          "logIndex": 6263434,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "1ebb88f1522cf3ab79e8d207207ffcb35f7e9830",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366226461",
      "sha": "1ebb88f1522cf3ab79e8d207207ffcb35f7e9830"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

