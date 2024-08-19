<!--monopod:start-->
# sonar-scanner-cli
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/sonar-scanner-cli` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/sonar-scanner-cli/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Scanner CLI for SonarQube and SonarCloud
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sonar-scanner-cli:latest
```
<!--getting:end-->

<!--body:start-->
To use this image, ensure SonarQube is installed and accessible to the host where you will invoke the scanner. The scanner image will default to connecting to the SonarQube API on port 9000.

The following command shows example invocation of the image, assuming `$PWD` is the directory containing code to be scanned and `-Dsonar.host.url` is the address of a SonarQube server:

```
docker run --rm -v $PWD:/usr/src $IMAGE_NAME \
    -Dsonar.login=admin \
    -Dsonar.password=admin \
    -Dsonar.projectKey=default \
    -Dsonar.host.url=http://192.0.2.1:9000
```

 Refer to the [SonarScanner CLI documentation](https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner/#sonarscanner-from-docker-image) for detailed instructions on how to configure environment variables for the running container and for additional properties that can be configured at runtime.
<!--body:end-->
