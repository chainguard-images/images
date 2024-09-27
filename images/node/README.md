<!--monopod:start-->
# node
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/node` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/node/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for node

Minimal container image for running NodeJS apps

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/node:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Node Application Example

This brief example is derived from our [Getting Started with Node](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-node/) guide which is itself based on the [Docker Node example](https://docs.docker.com/language/nodejs/containerize/). It involves setting up an example Node application, building the application into a container image using the Chainguard Node Image, and then testing the newly-built image.

### Setting up an example application

You can set up our example Node application by cloning [the `node` directory](https://github.com/chainguard-dev/edu-images-demos/tree/main/node) from our [`edu-images-demos` repository](https://github.com/chainguard-dev/edu-images-demos).

```sh
git clone --sparse https://github.com/chainguard-dev/edu-images-demos.git
```

Because the Node demo application code is stored in a repository with other examples, we don’t need to pull down every file from this repository. For this reason, this command includes the `--sparse` option. This will initialize a sparse-checkout file, causing the working directory to contain only the files in the root of the repository until the sparse-checkout configuration is modified.

Navigate into the new directory.

```sh
cd edu-images-demos
```

To retrieve the files you need for this sample application, run the following `git` command.

```sh
git sparse-checkout set node
```

This modifies the sparse-checkout configuration initialized in the previous `git clone` command so that the checkout only consists of the repo’s `node` directory.

Navigate into the new `node` directory.

```sh
cd node/
```

From within this directory, run the following command to create a new `package.json` file:

```sh
npm init -y
```

Next, install the application dependencies. Specifically, you'll need `ronin-server` and `ronin-mocks`. These will create a "mock" server that saves JSON data in memory and returns it in subsequent GET requests to the same endpoint.

```sh
npm install ronin-server ronin-mocks
```

### Building the application image

After setting up the application, it can be built into a container image using the Dockerfile included in the example repository.

This Dockerfile will perform the following actions:

1. Start a new image based on the `cgr.dev/chainguard/node:latest` image;
2. Set the work dir to `/app` inside the container;
3. Copy application files from the current directory to the `/app` location in the container;
4. Run `npm install` to install production-only dependencies;
5. Set up additional arguments to the default entrypoint (`node`), specifying which script to run.

Build the application image with the following command:

```sh
docker build . -t wolfi-node-server
```

### Testing the application

Once the build is finished, run the image:

```sh
docker run --rm -it -p 8000:8000 wolfi-node-server
```

Although the application is running from within a container, this command will cause it to block your terminal we set up a port redirect to receive requests on `localhost:8000` as the application waits for connections on port `8000`.

From a new terminal window, run the following command. This will make a POST request to your application sending a JSON payload:

```sh
curl --request POST \
  --url http://localhost:8000/test \
  --header 'content-type: application/json' \
  --data '{"msg": "testing node wolfi image" }'
```

If the connection is successful, you will receive output like this in the terminal where the application is running:

```sh
2023-02-07T15:48:54:2450  INFO: POST /test
```

You can now query the same endpoint to receive the data that was stored in memory when you run the previous command:

```sh
curl http://localhost:8000/test
```
```sh
{"code":"success","meta":{"total":1,"count":1},"payload":[{"msg":"testing node wolfi image","id":"6011f987-b9f8-4442-8253-d54166df5966","createDate":"2023-02-07T15:57:23.520Z"}]}
```

When you're finished, you can close the application by pressing `CTRL+C` (`CMD+C` if you're using macOS).

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