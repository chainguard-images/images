# Git image

This repository contains a `distroless` [Git](https://git-scm.com/) image.

This image contains `git`, `git-lfs`, and supporting libraries such as `openssh`
(for `ssh`-based auth), and `ca-certs` (for `https`-based cloning).  It is based
loosely on the original Tekton `git-init` image's
[`Dockerfile`](https://github.com/tektoncd/pipeline/blob/main/images/git-init/Dockerfile#L5).
