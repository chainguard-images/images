# dotnet
We have two images regarding dotnet. We have a dotnet-sdk and a dotnet-runtime image. Public images are restricted to the latest available LTS dotnet version.

<!--monopod:start-->
# dotnet sdk
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dotnet-sdk` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/dotnet-sdk/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image for .NET and the .NET Tools.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dotnet-sdk:latest
```
<!--getting:end-->

<!--body:start-->
## Variants

We have two images available: a `dotnet-sdk:latest-dev` variant that contains `dotnet` and a shell.

These images are available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dotnet-sdk:latest
docker pull cgr.dev/chainguard/dotnet-sdk:latest-dev
```
<!--body:end-->


<!--monopod:start-->
# dotnet runtime
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dotnet-runtime` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/dotne-runtime/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image for .NET runtime environment.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dotnet:latest
```
<!--getting:end-->

<!--body:start-->
## Variants

We have two images available: a `dotnet-runtime:latest-dev` variant that contains the dotnet runtime environment and a shell.

These images are available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/dotnet-runtime:latest
docker pull cgr.dev/chainguard/dotnet-runtime:latest-dev
```

## Usage

The dotnet-sdk image can be used directly for simple cases, or with a multi-stage build using the dotnet-sdk as the builder and dotnet-runtime as the final target container.

To get started, go to your current dotnet application directory (or where you house your dotnet applications) and execute the following command. This command should be able to detect the dotnet project in your directory and create a base for the docker initialization.

```docker init```

This command should create the following files.

```
Dockerfile
compose.yaml
README.Docker.md
.dockerignore
```

After the files have been created, replace the contents within the created Dockerfile with the following

```Dockerfile
FROM cgr.dev/chainguard/dotnet-sdk:latest AS build

COPY --chown=nonroot:nonroot . /source

# If your project resides in a sub directory, make sure you are pointing to that directory. ex: If your project resided in a directory called 'app', you would set the destination to /source/app
WORKDIR /source

RUN dotnet publish --use-current-runtime --self-contained false -o Release

# If you are running an ASPNET project, you can instead pull our 
FROM cgr.dev/chainguard/dotnet-runtime:latest AS final
WORKDIR /

# Copy everything needed to run the app from the "build" stage.
COPY --from=build source .

ENTRYPOINT ["dotnet", "Release/dotnet.dll"]
```

This will build your application using the SDK image and then copy the built application over to the Runtime image which will then start.
<!--body:end-->
