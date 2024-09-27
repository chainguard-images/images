<!--monopod:start-->
# dive
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/dive` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/dive/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for dive

Minimal [dive](https://github.com/wagoodman/dive) container image.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/dive:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

```
This tool provides a way to discover and explore the contents of a docker image. Additionally the tool estimates
the amount of wasted space and identifies the offending files from the image.

Usage:
  dive [IMAGE] [flags]
  dive [command]

Available Commands:
  build       Builds and analyzes a docker image from a Dockerfile (this is a thin wrapper for the `docker build` command).
  help        Help about any command
  version     print the version number and exit (also --version)

Flags:
      --ci                                Skip the interactive TUI and validate against CI rules (same as env var CI=true)
      --ci-config string                  If CI=true in the environment, use the given yaml to drive validation rules. (default ".dive-ci")
      --config string                     config file (default is $HOME/.dive.yaml, ~/.config/dive/*.yaml, or $XDG_CONFIG_HOME/dive.yaml)
  -h, --help                              help for dive
      --highestUserWastedPercent string   (only valid with --ci given) highest allowable percentage of bytes wasted (as a ratio between 0-1), otherwise CI validation will fail. (default "0.1")
      --highestWastedBytes string         (only valid with --ci given) highest allowable bytes wasted, otherwise CI validation will fail. (default "disabled")
  -i, --ignore-errors                     ignore image parsing errors and run the analysis anyway
  -j, --json string                       Skip the interactive TUI and write the layer analysis statistics to a given file.
      --lowestEfficiency string           (only valid with --ci given) lowest allowable image efficiency (as a ratio between 0-1), otherwise CI validation will fail. (default "0.9")
      --source string                     The container engine to fetch the image from. Allowed values: docker, podman, docker-archive (default "docker")
  -v, --version                           display version number

Use "dive [command] --help" for more information about a command.
```
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