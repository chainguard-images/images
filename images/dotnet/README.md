<!--monopod:start-->
# dotnet
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dotnet` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/dotnet/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for dotnet

Minimal container image for .NET and the .NET Tools.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/dotnet:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's .NET Images are comparable to the .NET images available from Microsoft.  Like most Chainguard images, the .NET images come with only the minimum dependencies needed to function and do not include things like a shell or package manager.

The Chainguard .NET images are available on `cgr.dev` as two variants: `dotnet-sdk` and `dotnet-runtime`. The SDK variant contains additional tooling to facilitate development and building, while the runtime variant contains only the runtime to execute .NET applications. Both the SDK and Runtime images also have `latest-dev` versions that contain a shell and various other tools for development.

To download the SDK image, you would run a command like the following:
 
```shell
docker pull cgr.dev/chainguard/dotnet-sdk:latest
```

And to download the Runtime image, you would run the following:

```shell
docker pull cgr.dev/chainguard/dotnet-runtime:latest
```

For simple cases, you can use the SDK image directly, or with a multi-stage build using the SDK image as the builder and the Runtime image as the final target container.


## Getting Started

Begin by going to your .NET application directory (or the location where you house your .NET applications) and execute the following command. This command will detect the .NET project in your directory and create a base for the Docker initialization:

```shell
docker init
```

This command will create the following files:

```
Dockerfile
compose.yaml
README.Docker.md
.dockerignore
```

After the files have been created, replace the contents within the created Dockerfile with the following

```Dockerfile
FROM cgr.dev/ORGANIZATION/dotnet-sdk:latest AS build

COPY --chown=nonroot:nonroot . /source

WORKDIR /source

RUN dotnet publish --use-current-runtime --self-contained false -o Release

# If you are running an ASPNET project, you can instead pull our ASPNET image cgr.dev/ORGANIZATION/aspnet-runtime:latest
FROM cgr.dev/ORGANIZATION/dotnet-runtime:latest AS final
WORKDIR /

COPY --from=build source .

ENTRYPOINT ["dotnet", "Release/dotnet.dll"]
```

Note that if your project resides in a sub directory, make sure you are pointing to that directory. For example, if your project resided in a directory called 'app', you would set the destination to `/source/app`.

This will build your application using the SDK image and then copy the built application over to the Runtime image which will then start.

You can run and publish a local image with the following command:

```shell
docker compose up -d --build
```

You can also remove the container using the following command:

```shell
docker compose down
```

## Documentation and Resources

* [Microsoft .NET documentation](https://learn.microsoft.com/en-us/dotnet/)
* [`microsoft/dotnet-sdk` Docker Hub entry](https://hub.docker.com/r/microsoft/dotnet-sdk)
* [`microsoft/dotnet-runtime` Docker Hub entry](https://hub.docker.com/r/microsoft/dotnet-runtime) 
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