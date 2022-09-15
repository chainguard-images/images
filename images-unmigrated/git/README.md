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
| `2` `2-debian-11` `2.37.3` `2.37.3-debian-11-r5` `latest` | `sha256:f65a6637b0e727fe5d0f49fa8f687c9d1ec5d093b16ff74d10dc6e3d518747ae`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f65a6637b0e727fe5d0f49fa8f687c9d1ec5d093b16ff74d10dc6e3d518747ae) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `2.37.3-r0` `root` | `sha256:726e10068e68131393e56b1bc4e510c587ad67ba525ea155e105010e907cceb1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:726e10068e68131393e56b1bc4e510c587ad67ba525ea155e105010e907cceb1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f65a6637b0e727fe5d0f49fa8f687c9d1ec5d093b16ff74d10dc6e3d518747ae"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ab5ddad8a73e92f57159a9e2ad9e3aa9257647c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/git",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDXijRRDjW9iWDBrC3opp7JE6aij2fo8YsOtVuQgsHiWgIhAM9QOkn3bx4i6lk7zzFJE+EvZ0SHVniWruBobblmUKZu",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwY2YwZjczY2ZkYzJjMDkwYzNiNWViNTdkZDQzYzRjN2IxNWQ3NjU3NWM5OGU2YjQ3NmViYWYyNzIxYzQxMmU2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRUFuNjE0ZFR0SUVyeldYMlEvaHdyVmllK1Z2cWpnZ1JSKzA1NHk3aXdQV0FpQkFVb1dPTVZIaHRPVTMySzlVcG9Cb2xYTU5tQTkyRVJaUFdDRFdZZVQ0Y3c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRSRU5EUVhnMlowRjNTVUpCWjBsVlEyVjZXREJ1Y2t0V1VHVkJjV2hKTW1RNVRXMU5NUzlVZERsemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRGTlJFa3dUMVJKTlZkb1kwNU5ha2wzVDFSRk1VMUVTVEZQVkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxZGtSM2NWcHJTSFIxY1hKWVNHczVNRzV6TUdWalJsaEdTbVZ4VnpCQ2FuQjFSV1FLZUdWdVRFOVFaVlZJTmxsU2EwMW5SRUpETlU0eE1WWjZUelE1TUV0Uk1XTXpSMEZUT1hKbVYycFhUbm96WW5vNU5tRlBRMEZxTUhkblowazFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ4ZEU1SENuaElaMUUxUkdkS0t6WndUVXR4VEcxaFJVSnpkM05CZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BhTW13d1RIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtOb2FGbHFWbXRhUjBaclQwZEZNMDB5VlRWTmJWa3hUbnBGTVU5WFJUVmFWRXBvV2tSc2JFMHlSbWhQVkVreFRucFpNRTR5VFhwTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFphTW13d1RVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcGQxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqbENTSE5CWlZGQ00wRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuZWpoT1NtdE5RVUZCVVVSQlJXZDNVbWRKYUVGTGRHaDFjMUZOU25kdllXWXdWVkZFTUVWbmIxcEplbUpqVEVWc1kzRlBUVkZ2VmxCU1lVNEtXamhUUkVGcFJVRjZSbmh3TVhWYWVHTkJSVUZ0Y2pOSVVIbHNOa0ZqTDFaTVVESjFUVFZuYVNzMmVXdFdhbE14VDFoRmQwTm5XVWxMYjFwSmVtb3dSUXBCZDAxRVlVRkJkMXBSU1hoQlNXUXpVRkJPYnpNeUt6WnNSREpHV0ZSS1NXWXljVUZJWkVoVE0wUnljMk54TkV0RksxZGhRMkkxVlZVd2ExUTVjVEJRQ2xOa1ZVeEtTa1YzWmsxcVFtUlJTWGRKVERjdlpWa3pWa2hIUlRNclpEa3ZiRFJTVm1GTE0zVldOMjVEUzBsQlIycFBVVW95Um5RM2VIQkxLMlZQZWswS01VNVFTRzVLYlZGVUsxUlJRWHBqTHdvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663210188,
          "logIndex": 3504173,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3057455515",
      "sha": "ab5ddad8a73e92f57159a9e2ad9e3aa9257647c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

