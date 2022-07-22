# Git image

This repository contains the source files for the Git distroless image `distroless.dev/git`. This is a minimal Git image based on Alpine, using up-to-date apks available on the Alpine Community repositories (not built from source).
The image contains `git`, `git-lfs`, and supporting libraries such as `openssh` (for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).

You can use this image with `ko build`, `docker`, and other OCI-compatible engines.

As with other distroless images, new releases of `distroless.dev/git` are automatically built and uploaded every night.

## Usage

The Git distroless image allows you to run ordinary Git commands in CI/CD pipelines and also locally via Docker.

## Docker Setup

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

Because your local system user's UUID might differ from that of the container image, if you want to clone repositories locally using this image you'll need to set up special permissions for the target dir. Then, you'll be able to set up a volume and have the contents of the cloned repo replicated on your host machine.

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

All distroless images are signed using [Sigstore](https://www.sigstore.dev/). This can be verified
using the [cosign](https://github.com/sigstore/cosign) tool:

```shel
COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/git | jq
```

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
        "docker-manifest-digest": "sha256:5328b68a05eddb32289ca7137172aab7bd52f54c6d66772e6f964aeada57dc9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCr5HsORh+RDOAi085lDMlhQqzJG5jTVwqDhJ/IiyHzogIhAJcypCAU2+FkJE1vUeqSPK3mr9UzDy2nVi/OkUrNm9/R",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MzhiZmEyYWMwZjQyYjY1OGE4NGEwNWRmZGJiYzQ0ZjU2MzY3YzBmMTBkM2U0ZDNkN2NmZWQ2NTVmZTU5ZDMwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRzBrOG1RZVJEVmF0aG0yekp0TUY4MHZDWG53OEVYSU5ORDd4YmZqcmdYOUFpRUFnNXpEQXZVdDRTZFdYTFRNQ0JMZ2lUNzZMeUFLRC9PZXJmMDRFTldlRkZzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnJha05EUVhocFowRjNTVUpCWjBsVVVtZG1OR2wxVlROMVV6ZHhMelZwWkRNdk1WWnZjME5YWTFSQlMwSm5aM0ZvYTJwUFVGRlJSRUY2UVRNS1RWSlZkMFYzV1VSV1VWRkxSWGQ0ZW1GWFpIcGtSemw1V2xNMWExcFlXWGhJYWtGalFtZE9Wa0pCVFZSR1dFNXdXak5PTUdJelNteE1WMngxWkVkV2VRcGlWMVpyWVZkR01GcFVRV1ZHZHpCNVRXcEJNMDFxU1hoTmFrRXdUa1JDWVVaM01IbE5ha0V6VFdwSmVFMXFSVEJPUkVKaFRVRkJkMWRVUVZSQ1oyTnhDbWhyYWs5UVVVbENRbWRuY1docmFrOVFVVTFDUW5kT1EwRkJVMmRQZUhabFJWZE5kSFpvZG5CclRsbHdTakV2TnpsVGJXdGthbk4wT0dKUFVWQTVjR0lLUkhwQ01EbHdVRWxTTW5CbFQybHNZa1ExV25KeVlVaEhkRzFQYjJGVWIzSXdWV05QVFdOck1WSktha3RpUlc5cmJ6UkpRMDlFUTBOQmFsRjNSR2RaUkFwV1VqQlFRVkZJTDBKQlVVUkJaMlZCVFVKTlIwRXhWV1JLVVZGTlRVRnZSME5EYzBkQlVWVkdRbmROUkUxQ01FZEJNVlZrUkdkUlYwSkNWR1ZzVTJFd0NsUkpibWhMY0V4RFpXVkdlalF4WW1KTWNWTkJZa1JCWmtKblRsWklVMDFGUjBSQlYyZENWR1l3SzI1UVZtbFJVbXgyYlc4eVQydHZWbUZNUjB4b2FHc0tVSHBDWlVKblRsWklVa1ZDUVdZNFJWWkVRbE5vYkVKdlpFaFNkMk42YjNaTU1tUndaRWRvTVZscE5XcGlNakIyV2tkc2VtUklTblppUjFaNlkzazViZ3BoV0ZGMlRHMWtjR1JIYURGWmFUa3pZak5LY2xwdGVIWmtNMDEyWTIxV2MxcFhSbnBhVXpVMVdWY3hjMUZJU214YWJrMTJZVWRXYUZwSVRYWmlWMFp3Q21KcVFUVkNaMjl5UW1kRlJVRlpUeTlOUVVWQ1FrTjBiMlJJVW5kamVtOTJURE5TZG1FeVZuVk1iVVpxWkVkc2RtSnVUWFZhTW13d1lVaFdhV1JZVG13S1kyMU9kbUp1VW14aWJsRjFXVEk1ZEUxQ1NVZERhWE5IUVZGUlFtYzNPSGRCVVVsRlFraENNV015WjNkT1oxbExTM2RaUWtKQlIwUjJla0ZDUVhkUmJ3cGFhbU42VDFSQmVFMVhUVEpOVkUxNVdsZEdhbHBIU1ROUFZFWnBUVVJKTVZwcVRUVlpiVkUwV1RKR2JFMHlXWGhOUkVadFRYcEJZMEpuYjNKQ1owVkZDa0ZaVHk5TlFVVkZRa0UxUkdOdFZtaGtSMVZuVlcxV2MxcFhSbnBhVkVGalFtZHZja0puUlVWQldVOHZUVUZGUmtKQk5XdGhXRTR3WTIwNWMxcFlUbm9LVERKa2NHUkVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUXdwQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1Vsc0NuazJiM1ZCUVVGRlFYZENTRTFGVlVOSlEyRmxka0ZSWkdjNVZtOXNaRE12ZW1kVFp6QllaMVpCTkZOeFdXcE5SM2hvVmt0Rk1YWnFRWFpEZGtGcFJVRUthbU12TlVocE9IY3pSbEJ6TUdOTVRTdEdNbGRTT0hNeU9FaHNXVkowUmxaUlZHOTBhekp6UnpkVGIzZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkd3BhVVVsNFFVczBXVzh4TVZFdlYzUlRSMWRWY0VaTVp6RnZLMjlUTldwVWJuVnpPVTl0VWpKMGNHeEZURU5sWld0MlVETmpUVE5LYWpKeE1WZFhiV1JQQ2tSSlFtaHhkMGwzVFRoemVrOXZiMjFPV1VSQ2IzVlJZalJrUjNScGRVc3hValZDTkUwM2IwcFBPWEpJWlVvdmRuaHdRMHBpUTJ0MmVVNXNSelEzVDBFS04yMTRTRkIwUjJzS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1658491518,
          "logIndex": 3007446,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/git/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "2718445892",
      "sha": "f739011c6132eacdb791b025f39bd8cae3f101f3"
    }
  }
]
```
