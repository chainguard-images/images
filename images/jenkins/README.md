<!--monopod:start-->
# jenkins
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/jenkins` |
| **Variants/Tags** | `latest` |
---
<!--monopod:end-->

Minimal Jenkins container image. **Currently experimental.**

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jenkins:latest
```

## Usage

This is an experimental image and subject to change.  We welcome all feedback.

To test out the Chainguard Jenkins image you can run
```sh
docker run --platform linux/arm64 --rm -v $PWD/data:/var/jenkins_home -p 8080:8080 -ti cgr.dev/chainguard/jenkins
```

And visit Jenkins in your brower http://localhost:8080

And if you want to backup your Jenkins data, mount the `$JENKINS_HOME` folder to a mounted volume
```sh
docker run --platform linux/arm64 --rm -v $PWD/data:/var/jenkins_home -p 8080:8080 -ti cgr.dev/chainguard/jenkins
```
