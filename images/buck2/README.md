<!--monopod:start-->
# buck2
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/buck2` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/buck2/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for buck2

Minimal image with [buck2](https://buck2.build) build system binaries and toolchain.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/buck2:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Usage

The default entrypoint is set to the `buck` binary, and a default C/C++ toolchain is installed in the image.

```
docker run cgr.dev/chainguard/buck2:latest
buck2 8cb388050e28f9386ccc2458d6dcf55137e2f3b13008b2a13000994b38c496db <local>
A build system

Documentation: https://buck2.build/docs/

USAGE:
    buck2 [OPTIONS] <SUBCOMMAND>

OPTIONS:
    -h, --help
            Print help information

        --isolation-dir <ISOLATION_DIR>
            Instances of Buck2 share a daemon if and only if their isolation directory is identical.
            The isolation directory also influences the output paths provided by Buck2, and as a
            result using a non-default isolation dir will cause cache misses (and slower builds)

            [env: BUCK_ISOLATION_DIR=]
            [default: v2]

    -v, --verbose <NUMBER>
            How verbose buck should be while logging. Values: 0 = Quiet, errors only; 1 = default; 2
            = more info about errors; 3 = more info about everything

            [default: 1]

    -V, --version
            Print version information

SUBCOMMANDS:
    aquery
            Perform queries on the action graph (experimental)
    audit
            Perform lower level queries
    build
            Build the specified targets
    bxl
            Run BXL scripts
    clean
            Delete generated files and caches
    cquery
            Perform queries on the configured target graph
    ctargets
            Resolve target patterns to configured targets
    docs
            Print documentation of specified symbols
    help
            Print this message or the help of the given subcommand(s)
    init
            Initialize a buck2 project
    install
            Build and install an application
    kill
            Kill the buck daemon
    killall
            Kill all buck2 processes on the machine
    log
            Commands for interacting with buck2 logs
    lsp
            Start an LSP server for starlark files
    profile
            Profiling mechanisms
    query
            Alias for `uquery`
    rage
            Record information about the previous failed buck2 command
    root
            Find buck cell, project or package root
    run
            Build and run the selected target
    server
            Start, query, and control the http server
    starlark
            Run Starlark operations
    status
            Buckd status
    subscribe
            Subscribe to updates from the Buck2 daemon
    targets
            Show details about the specified targets
    test
            Build and test the specified targets
    uquery
            Perform queries on the unconfigured target graph
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