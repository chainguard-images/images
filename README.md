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
| `latest` | `sha256:f38554cacad94b43086aff2b2215d6fce3ffa442a8a99ef4e38e604d165febaa`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f38554cacad94b43086aff2b2215d6fce3ffa442a8a99ef4e38e604d165febaa) | `amd64` |


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
        "docker-manifest-digest": "sha256:f38554cacad94b43086aff2b2215d6fce3ffa442a8a99ef4e38e604d165febaa"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6f3bf04d3d5417b0a957cb70e6d8e79344fa8d5f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDCBK/reCCXwhS49jJOrAjpPkn8zwx3FDyzz3xhCe+AvAiEAtTgGfmDwwsEFnmwxnM6drBD7G9EsHlaNTLqo8Upow3Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZmNlNWQ5MGY4ZmIzZTc5N2NjYWFiOTZiNDg5YmVjZjhjZmFmNGZlY2M2MzEyYTE3MWM3ZDIwOWFmMGVlZTc1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJREIvcGtZVE16V054a0Z6NEw2T1dkTkx6SDFLVWJsVUtSY24wQVdOSDZSZkFpQkZVaWdHclRrV1NNa2pScDVrSGU4dVl6dGVIejNHWU1WY1dZN05RbmliblE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlha05EUVhwWFowRjNTVUpCWjBsVlNHaFNOMWQxZEc5WWRreG5VbXhuVFhaUlNEVXJSM2h4ZUdNd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVXdUV3BWTkZkb1kwNU5ha2w0VFZSQk0wMUVSVEZOYWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6Y0dGUmJXSkhUbmczWTFReFozZzBRMWxNZGtsSFN6TlpObTVJZEdsRE1FYzVORmdLVm1jNFMzYzNWakJDUTBSYVJtaDROMEZLV1VkUk9FcGFOalk1UldnNFIyWTVSVGR3ZWtsYU1WRjNNRmROT0VoNk1EWlBRMEZzVVhkblowcFJUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzVDBkbENtNU1ObnAwU1RSaVIxZENSMjkzTTJWMWJWbzBMM0JCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGWFFtZHZja0puUlVWQldVOHZUVUZGUTBKQmFIcFpNbWhzV2toV2N3cGFWRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWnpKYWFrNXBXbXBCTUZwRVRtdE9WRkY0VGpKSmQxbFVhekZPTWs1cFRucENiRTV0VVRSYVZHTTFDazE2VVRCYWJVVTBXa1JXYlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RMmRIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZIYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NMEoyWXpOU2JtTnRWbnBOUWpCSFEybHpSMEZSVVVKbk56aDNRVkZaUlFwRU0wcHNXbTVOZG1GSFZtaGFTRTEyWWxkR2NHSnFRMEpwWjFsTFMzZFpRa0pCU0ZkbFVVbEZRV2RTT0VKSWIwRmxRVUl5UVU0d09VMUhja2Q0ZUVWNUNsbDRhMlZJU214dVRuZExhVk5zTmpRemFubDBMelJsUzJOdlFYWkxaVFpQUVVGQlFtaEZMMEpUWnpCQlFVRlJSRUZGWTNkU1VVbG5USEJoUjI1TU1rNEtSWFJJSzBWcVN6VnZSRVpxTmtNMFIyaFFZbmh2Y0VwdE4ySkxZVGM1VFRCdmNUUkRTVkZFWkcxaWExQnpVMUIzU3pGellqTnBUVTFsSzNSMlowTm9id3BPZGxSWmNTOXViMGQwVFZGSWJFUTVWMnBCUzBKblozRm9hMnBQVUZGUlJFRjNUbTVCUkVKclFXcEJXRmRQYWl0S2Vrc3lOblo1UzJzNGNIWktZVkE0Q201M05YaEhRblJzWm0xU2N6Z3dibGhXYXpGV00wTlVNWG8xZG1sU01tUndjMUJMUjJKaEwzVmliRlZEVFVGWVJpdEVTUzloWjJ4V1psbHZUWGQzVms4S1RrVnVRbUpwWWpVNFMzVm5TR3hoT0RaYWNFdzRjekZtVEVreWVHVkNkMFJ6VkhCNlp6UjRha05wVVRablFUMDlDaTB0TFMwdFJVNUVJRU5GVWxSSlJrbERRVlJGTFMwdExTMEsifX19fQ==",
          "integratedTime": 1667785381,
          "logIndex": 6651673,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "6f3bf04d3d5417b0a957cb70e6d8e79344fa8d5f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406937530",
      "sha": "6f3bf04d3d5417b0a957cb70e6d8e79344fa8d5f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

