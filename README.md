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
| `latest` | `sha256:26d478114616a32fd277ea4b5fe77e0cafb44f5965548f4745373d6afda7b5f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:26d478114616a32fd277ea4b5fe77e0cafb44f5965548f4745373d6afda7b5f6) | `amd64` |


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
        "docker-manifest-digest": "sha256:26d478114616a32fd277ea4b5fe77e0cafb44f5965548f4745373d6afda7b5f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c5b88bcf7c9ab647920815c4fe9cc12434658a9d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIH/6rR2vE2GcBdm1unYs8ug22GfogdNJKviPVVBzKbpdAiBhUdv74KrPujry8ogJiEmKsWBw8DA2JS7xtLpNu37tYA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiMzZjYjViN2JkNmUxYTgzNmQ0NjRkNzc3YzFkZjE2NmI1YzBiMGExYTJlMDIxNmY5ZTllMDZmZDNhNjE3OWJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRVZuM2tYaTNmdVJidnZ4dlc5dWdLSUhQeUJ5OEN6OFF5UEp0Nk1yYkFQQUFpRUFpWHFqWnJ1YmxZWUh3L1ZWbXhKMXoyYjVLSTU1UHE5eWlGQUZFTmQ3bGs0PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpSRU5EUVhwWFowRjNTVUpCWjBsVllsSnFLMGxVV2tobmJHa3pjRmRqYUZGS2JpczBURkZQU1UwNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhsTlJFbDNUVVJOTTFkb1kwNU5ha2w0VFZSQmVVMUVTWGhOUkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ6VlhkV1V6Y3dTMndyY2xZME1FZG5Ua2RDZVZGdWJUSTFZMU5aVDJkMlNsZFRXSGtLV1RkU09GVTBPQzg0VG5KT1NrcHNjRTVRVlhoaWIzTllTRGRRUjBGbVdGWTJSVlkwWjJoWGRWcHlTRWhYVUdScFlXRlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxVFhWNENrZG1aemR4UXpOVVUzVmxkelkyZDNabU9UUXpObkpuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdwT1YwazBUMGRLYWxwcVpHcFBWMFpwVG1wUk0wOVVTWGRQUkVVeFdYcFNiVnBVYkdwWmVrVjVDazVFVFRCT2FsVTBXVlJzYTAxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEVXVkp3SzNkQlFVRlJSRUZGWTNkU1VVbG9RVXh2TlU0MFpEWUtaV0kzWm5sSWFWWm9aVWx0VFRRek4zUldPV1ZXWkZnMVdYSTNhM1UzYTJkSlkzcHhRV2xCTVZsMGNVdEVUamhNZDNSMFUxWXZaMjFHVTFjelVsWmFNUXBSTmtJdllTczFXVzFZYkROUk5WaDFXRVJCUzBKblozRm9hMnBQVUZGUlJFRjNUbkJCUkVKdFFXcEZRVE5rSzBsek1DdFVMMUp3WVVWWk16VnBUVUpJQ25sUlV5OU1ZM296YVhKUE5HMURSM1ZFWlZGUmFXcHhhMUZaT1ZoWFYyNXlORlYxT0RsV2RIbG9SV013UVdwRlFUaFdOMjAyUkU1cllqaHBRMlZ3TlRNS01raHBWR2xUV25oMmQzbDVaMlIzTkRWWVNUaHBOakU1TlVwdmVXUjFMMDVJUjBOS2VUQlBSWE5XVlUxSlF6UkdDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667354444,
          "logIndex": 6326688,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "c5b88bcf7c9ab647920815c4fe9cc12434658a9d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3374282920",
      "sha": "c5b88bcf7c9ab647920815c4fe9cc12434658a9d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

