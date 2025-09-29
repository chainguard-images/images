<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimal container image for .NET and the .NET Tools.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's .NET Images are comparable to the .NET images available from Microsoft.  Like most Chainguard images, the .NET images come with only the minimum dependencies needed to function and do not include things like a shell or package manager.

The Chainguard .NET images are available on `cgr.dev` as two variants: `dotnet-sdk` and `dotnet-runtime`. The SDK variant contains additional tooling to facilitate development and building, while the runtime variant contains only the runtime to execute .NET applications. Both the SDK and Runtime images also have `latest-dev` versions that contain a shell and various other tools for development.

To download the SDK image, you would run a command like the following:
 
```shell
docker pull cgr.dev/$ORGANIZATION/dotnet-sdk:latest
```

And to download the Runtime image, you would run the following:

```shell
docker pull cgr.dev/$ORGANIZATION/dotnet-runtime:latest
```

For simple cases, you can use the SDK image directly, or with a multi-stage build using the SDK image as the builder and the Runtime image as the final target container.

### Supported SDK Feature Bands

TL;DR: Chainguard's .NET SDK images provide `1xx` feature bands exclusively. We are looking into providing tags for our SDK images with other feature bands, but due to technical limitations, we aren't doing so today.

Each release of the .NET project is versioned according to the runtime (i.e `9.0.8`) and each release includes one or more 'feature bands' of the SDK (i.e `9.0.109`, `9.0.304`). [The download page for .NET 9.0 illustrates this](https://dotnet.microsoft.com/en-us/download/dotnet/9.0).

The SDK images provided by Microsoft are tagged such that the SDK is tagged with the version of the most recent feature band (i.e `mcr.microsoft.com/dotnet/sdk:9.0.304`).

It has been difficult for Chainguard to reliably provide additional feature bands for various technical reasons. And Microsoft has, in some cases, changed how they tag their source code repositories, disrupting how our packages are versioned and, resultantly, how our images are tagged.

We are working on changes to provide additional feature bands with our .NET SDK image (i.e `9.0.109`, `9.0.304`). However, until those changes are implemented, our `dotnet-sdk` image will include, and will be tagged exclusively, with the version of the `1xx` feature band (i.e `9.0.109`).

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

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._