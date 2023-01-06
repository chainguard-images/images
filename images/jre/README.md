<!--monopod:start-->
# jre
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/jre` |
| **Variants/Tags** | `openjdk-jre-11`, `openjdk-jre-17` (`latest`) |
---
<!--monopod:end-->

Java JRE image using OpenJDK via [Adoptium Temurin](https://adoptium.net/en-GB/temurin/) sources.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/jre:latest
```
## Use it

Create a simple Java class

```sh
cat >HelloWolfi.java <<EOL
class HelloWolfi
{
    public static void main(String args[])
    {
        System.out.println("Hello Wolfi users!");
    }
}
EOL
```

Next create a multistage Dockerfile and add the Java class

```sh
cat >Dockerfile <<EOL
FROM cgr.dev/chainguard/jdk:openjdk-17

COPY HelloWolfi.java /home/build/
RUN /usr/lib/jvm/openjdk/bin/javac HelloWolfi.java

FROM cgr.dev/chainguard/jre:openjdk-jre-17

COPY --from=0 /home/build/HelloWolfi.class /app/
CMD ["HelloWolfi"]
EOL
```

Build the image

```sh
docker build -t my-simple-java-app .
```

Run the image
```sh
docker run my-simple-java-app
```
