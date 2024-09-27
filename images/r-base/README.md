<!--monopod:start-->
# r-base
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/r-base` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/r-base/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for r-base

This image contains the R programming language and environment.It can be used for statistical analysis, machine learning and data visualization.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/r-base:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Use It!

The image can be run directly and sets the R wrapper as the entrypoint:

```shell
docker run cgr.dev/chainguard/r-base:latest

Usage: R [options] [< infile] [> outfile]
   or: R CMD command [arguments]

Start R, a system for statistical computation and graphics, with the
specified options, or invoke an R tool via the 'R CMD' interface.

Options:
  -h, --help            Print short help message and exit
  --version             Print version info and exit
  --encoding=ENC        Specify encoding to be used for stdin
  --encoding ENC
  RHOME                 Print path to R home directory and exit
```

The binary also contains the Rscript wrapper:

```shell
docker run --entrypoint=/usr/bin/Rscript cgr.dev/chainguard/r-base:latest

Usage: Rscript [options] file [args]
   or: Rscript [options] -e expr [-e expr2 ...] [args]
A binary front-end to R, for use in scripting applications.

Options:
  --help              Print usage and exit
  --version           Print version and exit
  --verbose           Print information on progress
  --default-packages=LIST  Attach these packages on startup;
                        a comma-separated LIST of package names, or 'NULL'
and options to R (in addition to --no-echo --no-restore), for example:
  --save              Do save workspace at the end of the session
  --no-environ        Don't read the site and user environment files
  --no-site-file      Don't read the site-wide Rprofile
  --no-init-file      Don't read the user R profile
  --restore           Do restore previously saved objects at startup
  --vanilla           Combine --no-save, --no-restore, --no-site-file,
                        --no-init-file and --no-environ

Expressions (one or more '-e <expr>') may be used *instead* of 'file'.
Any additional 'args' can be accessed from R via 'commandArgs(TRUE)'.
See also  ?Rscript  from within R.
```

Note that the standard version of this image requires a shell because R is typically
invoked through built-in shell wrappers.
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