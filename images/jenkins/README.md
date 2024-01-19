<!--monopod:start-->
# jenkins
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/jenkins` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/jenkins/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [Jenkins](https://jenkins.io) container image. **Currently experimental.**
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jenkins:latest
```
<!--getting:end-->

<!--body:start-->
## Use It

This is an experimental image and subject to change.  We welcome all feedback.

To test out the Chainguard Jenkins image, run the following command, which will create a volume to persist build and configuration data from the container's `$JENKINS_HOME`:

```sh
docker run --rm -v jenkins_home:/var/jenkins_home -p 8080:8080 -ti cgr.dev/chainguard/jenkins
```

And visit Jenkins in your brower http://localhost:8080

If you want to backup your Jenkins data, create a local directory for the files and mount it along with the `jenkins_home` volume. You can then start a Jenkins container and copy the files out:

```sh
mkdir -m 777 jenkins-backup
docker run --rm \
  -v $PWD/jenkins-backup:/backup-dir \
  -v jenkins_home:/var/jenkins_home \
  -p 8080:8080 -ti \
  --entrypoint=/bin/bash \
  cgr.dev/chainguard/jenkins
cp -r /var/jenkins_home /backup-dir/
exit
```
<!--body:end-->
