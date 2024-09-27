<!--monopod:start-->
# maven
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/maven` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/maven/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for maven

Minimal image with Maven build system.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/maven:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Using Maven

Chainguard Maven images come with different versions of OpenJDK, ensure you choose the correct image tag for your application needs.  In these examples we will use a Chainguard Maven image based on OpenJDK 17.

Check the maven version
```
docker run --rm --platform=linux/amd64 cgr.dev/chainguard/maven:openjdk-17 --version
```

### Examples

#### SpringBoot

Visit https://start.spring.io

Select the following options:

1. __Project__: select `Maven Project`
2. __Spring Boot__: latest GA version, e.g. `2.7.5`
3. __Project Metadata__: populate your application details
4. __Packaging__: select your packaging. For this demo, we'll use `jar`
5. __Java__: select Java version, e.g. `17` that matches the OpenJDK image version we are building with
6. __Dependencies__: choose your dependencies, e.g. `Spring Web`
7. __Generate__: Hit that generate button!

![Spring Initializr](docs/png/spring_initializr.png)


Go to your downloaded zip file, unzip
```sh
mkdir ~/chainguard-sb
cd chainguard-sb
mv ~/Downloads/demo.zip .
unzip demo.zip
cd demo
```

You now have your generated Spring Boot application souce code.  Now let's build it.

```sh
docker run --platform=linux/amd64 --rm -v ${PWD}:/home/build cgr.dev/chainguard/maven:openjdk-17 clean install
```

Check to see your compiled `jar` file
```sh
find target -name "*.jar"
```
You should see...
```
target/demo-0.0.1-SNAPSHOT.jar
```

Let's run the application using the Chainguard OpenJDK JRE image.  _Note_ there's a few things happening here and this is just for test purposes, see section below for more real world scenarios.

Choose the Chainguard OpenJDK JRE image tag that matches your application's Java version selected when generating your Spring Boot application above.

```
docker run --platform=linux/amd64 --rm -p 8080:8080 -v ${PWD}/target:/app/ cgr.dev/chainguard/jre:openjdk-17 -jar /app/demo-0.0.1-SNAPSHOT.jar
```

Now visit the Spring Boot Application in your browser using the same port mapped in the docker command above.

e.g http://localhost:8080/

![Spring Whitelabel](docs/png/spring_whitelabel.png)

Note this is the expected Spring Whitelabel error page.


#### Multistage Dockerfile

The steps above are useful to test Chainguard images however, we can now create a multistage Dockerfile that will build a smaller image to run our demo application.

First create a `.dockerignore` file so we don't copy the generated maven `./target` folder from the steps above into the multistage docker build.  This helps avoid any permission errors during the build.

```sh
cat <<EOF >>.dockerignore
target/
EOF
```

Next create the multistage `Dockerfile`

```dockerfile
cat <<EOF >>Dockerfile
FROM cgr.dev/chainguard/maven:openjdk-17

WORKDIR /home/build

COPY . ./

RUN mvn install

FROM cgr.dev/chainguard/jre:openjdk-17

COPY --from=0 /home/build/target/demo-*.jar /app/demo.jar

CMD ["-jar", "/app/demo.jar"]
EOF
```

Build your application image
```sh
docker build --platform=linux/amd64 -t my-chainguard-springboot-app .
```

Now run your application
```sh
docker run --platform=linux/amd64 --rm -p 8080:8080 my-chainguard-springboot-app
```
Again visit the Spring Boot Whitelabel page in your browser

e.g. http://localhost:8080/

![Spring Whitelabel](docs/png/spring_whitelabel.png)

### What's inside?

Now let's take a closer look at your newly built image.

Check the size of your image, as this is based on Chainguard images it will only contain the Linux packages required to run your application.  The reduces the number of packages that can be affected by CVEs.

```sh
docker images | grep my-chainguard-springboot-app
```

You can also check for vulnerabilities using your favorite scanner.
<!--body:end-->

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.