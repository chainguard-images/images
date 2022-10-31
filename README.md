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
| `latest` | `sha256:41d97096ec08c71906121100e9ce4d63c45ee0756b7ade9a67b51d2465fb7a6a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:41d97096ec08c71906121100e9ce4d63c45ee0756b7ade9a67b51d2465fb7a6a) | `amd64` |


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
        "docker-manifest-digest": "sha256:41d97096ec08c71906121100e9ce4d63c45ee0756b7ade9a67b51d2465fb7a6a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "43c4833de15c05e7433829e856103e3ad8734d3c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/postgres",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHpQdUa3APxFw6dbxKG1ZzSqfqHpp9gJpD5yCns0d0b6AiAiOG7Q3oJ9e7Uemkn2Dsj2HLevcXkXf0PJEKkYKJq8LA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZTU0Y2RlMmZmNDZiZTViMmZkOWU3NjMzY2M5MjBhMjUwNTk1MmVhZTJlZDg0YWUxMzJlZDk1Y2VlZWZiNGVlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURPZFMxOWxmcGFuMFA4dkliRERzQnlJdUJvcWtzVWhzQ3hEWTFEUkNMalZRSWdETHhYQi9YbVcwQnVZSXhTaEthemxDdnVKQVRNM0d6azhNbm5wTC96WTB3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlNsUTBXRkE1Vm5Ca1ZYTmxSWE5XYURsNlVuTkxXbmxDV0RCUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTmFrbDRUa1JSZDFkb1kwNU5ha2w0VFVSTmVFMXFTWGxPUkZGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3VmpObVQzUlRSRXd4Um1kTWExQmhRa0VyUlZabFVHeEhkR1o1VjAxMk1FbG5SM0FLWkV4R09FOVVlV3RDYjJaRGVYSjVSV2s0YVc1NFNtZzVZMloyWm5adE1sbzJNVWwxVVU1c1NVNVJUbWhhV2pocldXRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJWTNoeUNsbERaWG81WWxoS1F6SmxSVWxDVDBVeFpEZHFZMnRKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGbldVUldVakJTUVZGSUwwSkhRWGRZYjFwallVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW5aak0xSnVZMjFXZWt4NU5XNWhXRkp2WkZkSmRtUXlPWGxoTWxwellqTmtla3d6U214aVIxWm9ZekpWZFdWWFJuUmlSVUo1Q2xwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1QxRlpTMHQzV1VKQ1FVZEVkbnBCUWtGUlVYSmhTRkl3WTBoTk5reDVPVEJpTW5Sc1ltazFhRmt6VW5BS1lqSTFla3h0WkhCa1IyZ3hXVzVXZWxwWVNtcGlNalV3V2xjMU1FeHRUblppVkVGVFFtZHZja0puUlVWQldVOHZUVUZGUTBKQlVuZGtXRTV2VFVSWlJ3cERhWE5IUVZGUlFtYzNPSGRCVVUxRlMwUlJlbGw2VVRSTmVrNXJXbFJGTVZsNlFURmFWR013VFhwTk5FMXFiR3hQUkZVeVRWUkJlbHBVVG1oYVJHY3pDazE2VW10Tk1rMTNTRUZaUzB0M1dVSkNRVWRFZG5wQlFrSkJVVTlSTTBwc1dWaFNiRWxHU214aVIxWm9ZekpWZDB0QldVdExkMWxDUWtGSFJIWjZRVUlLUWxGUllWa3lhR2hoVnpWdVpGZEdlVnBETVhCaVYwWnVXbGhOZG1OSE9YcGtSMlI1V2xoTmQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVFVKNGRVZFJRVUZDUVUxQlVucENSa0ZwUlVFck1IRnJTWEpxTTFSaGRHUUtTMjVrWlU5aFN6Tm5TMEZzV0dsWlNFOW9OazVUVUU1MWNteDNZV2xDUVVOSlIwZHJiVEZ3Y1dGblNubHRjVkJNUmxndll5OVlVVWxRVEZSaGVYVktWZ3AxU0ZOUFdrOWlLME5yVkV4TlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OUXpOWFJFNU9RVFozVTJzNVRtNVdaR0YyY0VkVE1IbG1OM2hDQ21keWRVc3JiUzgxYUhoUlJWQnhOM05tTlcxMmJHRTJSa3hKT0dsQmNGQXZVVFo2VGpkUlNYaEJVRzlPVmxaaGJFbDJhVlU1SzNGMlVsbHJSM2xsTUhRS1VuUm5OMDh3VkhSclRFbzJNRlUwUlV4U1ZtUlROblZGVWxsaldEZzVjVnBTVjNoRk0xcEtkbVIzUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667254484,
          "logIndex": 6252496,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/postgres/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/postgres",
      "githubWorkflowSha": "43c4833de15c05e7433829e856103e3ad8734d3c",
      "githubWorkflowTrigger": "push",
      "run_attempt": "2",
      "run_id": "3364936353",
      "sha": "43c4833de15c05e7433829e856103e3ad8734d3c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

