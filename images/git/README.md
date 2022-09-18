# git

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/git/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/git/actions/workflows/release.yaml)

This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source). The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

## Get It!

The image is available on `distroless.dev`:

```
docker pull distroless.dev/git:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `2.37.3-debian-11-r5` | `sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5bd9e1bc50745c14199118e2a393a39e54d615444c91c6f09c3763ec8169d129) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r6` `latest` | `sha256:4c457d7c6976742b535acd18ad3b2c848d391e62b34ecdf66f3aa2610f041b31`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4c457d7c6976742b535acd18ad3b2c848d391e62b34ecdf66f3aa2610f041b31) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:fdc6a9b3c5e256a9a2c0040a7ea10db1ff932e968d4194e0557d4b1ffd527897`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fdc6a9b3c5e256a9a2c0040a7ea10db1ff932e968d4194e0557d4b1ffd527897) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

The Git distroless image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

### Docker Setup

To make sure you have the latest image version available, start by running a `docker pull` command:

```shell
docker pull distroless.dev/git
```

Then, run the image with the `--version` flag to make sure it is functional:

```shell
docker run -it --rm distroless.dev/git --version
```
You should get output similar to this:

```
git version 2.37.1
```

### Cloning a Repository Locally

Because your local system user's ID (uid) might differ from that of the container image, if you want to clone repositories locally using this image you'll need to set up special permissions for the target dir. Then, you'll be able to set up a volume and have the contents of the cloned repo replicated on your host machine.

First, create a target directory somewhere in your home folder and set the required permissions:

```shell
mkdir ~/workspace
chmod go+wrx ~/workspace
```

Now you can use `docker run` to execute the clone command, using the directory you just set up as a volume share between your local machine and the container image on `/home/git`.

```shell
docker run -it -v ~/workspace:/home/git --rm distroless.dev/git clone https://github.com/distroless/git.git
```

You should get output like this:

```
Cloning into 'git'...
remote: Enumerating objects: 57, done.
remote: Counting objects: 100% (57/57), done.
remote: Compressing objects: 100% (47/47), done.
remote: Total 57 (delta 19), reused 35 (delta 10), pack-reused 0
Receiving objects: 100% (57/57), 15.23 KiB | 866.00 KiB/s, done.
Resolving deltas: 100% (19/19), done.
```

You can now check the contents of your `workspace` directory, where you should find the cloned repo.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/git:latest | jq
```

Output:
```
Verification for distroless.dev/git:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/git"
      },
      "image": {
        "docker-manifest-digest": "sha256:4c457d7c6976742b535acd18ad3b2c848d391e62b34ecdf66f3aa2610f041b31"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4a3c3e7b87d5b9446c5df04be8bdaf42f706fcbe",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDXOm72dlpZX2P4ynt3KVhdPNFytz4iWRS+4g9GP7dosAiB8CdqYDhFuI/O2CQqo68/MmyBQQNhaUsMzesvs6OnsdA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmMjQ5OGIyZGE5ZjY0MWEzMGI1ZjJmZjAxNzQyYTQ0ZGI3ZjRhNjY3YTdmMzc2YWNmOTZiOTEyZjhkMjkxOWFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQ2bG5ZV2hLMTJWekx4TXBRMzNtb2xNMFVlMk5OSUJnUmJqalJ0NXhFWU9nSWdDeG5pa1k0TkltbWFHR3RDYUtmNDQ5QWhyZDI3NFZSUnEyUDRLRjd2V2swPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNha05EUVhneVowRjNTVUpCWjBsVlEzaHVhVEoyZVdoWVVFOVZkMGN2Y1VSdGEyc3ZOVU1yTVV0QmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRSTlJFa3hUa1JWZUZkb1kwNU5ha2wzVDFSRk5FMUVUWGRPUkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZhYVhsWGFEZDVZVk5OTkZWS01URndaVm92YUVsT2NVMDRhR3c0Wm1GQmVWcFhZa2tLV1dWUlowMDRjV3RhUjI0NFVtSkdlbk5NTkZoRU16bEZWRmh5VDFoT1dYVTNlbTVqYUhSVlNWVndSM2hvUnk4MmIwdFBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYyZEhCVENrVnZkV1pHTDNkaE1GVXlhamRLVTNSUlVUWjFVMGh6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk1GbFVUbXBOTWxVeldXcG5NMXBFVm1sUFZGRXdUbTFOTVZwSFdYZE9SMHBzVDBkS2ExbFhXVEJOYlZrelRVUmFiVmt5U214TlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFphTW13d1RVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTURaR1NXcHZRVUZCVVVSQlJXTjNVbEZKYUVGTVpFeFZSakpQVFhWR2RVZHpXWGxqVURKQ04xUk5UMEpVTTJaRU1WTTFkbTB6V1RCYVEyNEtkMEpYWlVGcFFWbHVlamhIYVZaRFNYbG5ZMncwYzNFMlRqTklRbGhFYVVwUll6bHNLeTl4U3paMGRFVllRVXQwZFZSQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dVFVUkNhMEZxUW10S01VUnNZWGxGYm1kT1pUSkRNbmhVVEZCellXYzRkbVpsYjAxa2NGbFdiVzFZU1U5NmFHSmhLMk00YkU1SlMybEtaRXRSQ2tSaGNVWnhNMVJ0YVZSalEwMUNhRkUwV2tSMFlYaG9aVXR1Tm1WRlEyZ3dVa0ZsV2pWTWRXNUNhR05rU0UxSE5GSktlbWd6VDJzM1oyWkVZVE5GVEZRS1IwUkxkSGhUY1RKalJqSjNVM2M5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663469730,
          "logIndex": 3528093,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3075618686",
      "sha": "4a3c3e7b87d5b9446c5df04be8bdaf42f706fcbe"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

