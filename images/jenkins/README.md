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
A minimal, wolf-based container image for Jenkins - an open-source CI/CD server that enables developers to build, test, and deploy their software
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jenkins:latest
```
<!--getting:end-->

<!--body:start-->
## Use It

The following command launches a new Jenkins controller using docker, mounting
a local directory to the jenkins_home directory, to persist data:

Run a local, development instance of Jenkins, specifying a local volume as
the jenkins_home for data persistence:

```bash
docker run --rm -v jenkins_home:/var/jenkins_home \
  -p 8080:8080 -it \
  cgr.dev/chainguard/jenkins:latest
```

In the console output, the initial admin password will be logged. Use this to
login to the Jenkins UI:

- [http://localhost:8080/](http://localhost:8080/)


If you want to backup your Jenkins data, create a local directory for the files and mount it along with the `jenkins_home` volume. You can then start a Jenkins container and copy the files out:

Refer to the [upstream documentation](https://github.com/jenkinsci/docker/blob/master/README.md)
for full instructions on running and configuring Jenkins.
<!--body:end-->
