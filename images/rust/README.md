<!--monopod:start-->
# rust
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/rust` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/rust/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for rust

Minimal Wolfi-based Rust image for building Rust applications.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/rust:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/rust)
- [Provenance Information](https://edu.chainguard.dev/chainguard/chainguard-images/reference/rust/provenance_info/)

This image contains the tools needed to build Rust code.
This includes:

* `rustc`
* `cargo`
* `cargo-auditable` wrapper
* `rustdoc`
* `rustlldb`
* `rust-audit-info`
* And more!

This image also includes a shell for compatibility with most `cargo` package installations.
This image **is not** intended to be used as a runtime image, only as a build tool.

### Rust Version
This will automatically pull the image to your local system and execute the command `rustc --version`:

```shell
docker run --rm cgr.dev/chainguard/rust --version
```

You should get output similar to this:

```
rustc 1.67.1 (d5a82bbd2 2023-02-07) (built from a source tarball)
```

### Cargo Auditable

By default `/usr/local/bin/cargo` contains a wrapper to always call `cargo auditable` which generates and embeds build time crate information in the compiled binaries. This enables inspecting compiled rust binaries with `rust-audit-info` which is also included in this image. Many security scanners also know how to parse this information for the purpose of detecting security vulnerabilities. For more information see [Cargo Auditable](https://github.com/rust-secure-code/cargo-auditable?tab=readme-ov-file#cargo-auditable) project.

Building without audit information is possible by invoking `/usr/bin/cargo` directly, however doing that will evade scanner support in the resulting binaries.

## Application Setup for End Users

For runtime, you can use a multi-stage Dockerfile or similar technique to run your compiled binaries on
an even more slimmed down image.
The exact image will depend on your application, but `static` or `glibc-dynamic` should work.

This sample Dockerfile shows how to get a basic build up and running on `glibc-dynamic`.
There's one build argument, `PACKAGE`, that needs to be replaced with the name of your rust package.

```Dockerfile
ARG PACKAGE=myapp

FROM cgr.dev/chainguard/rust as build
WORKDIR /app
COPY . .
RUN cargo build --release

FROM cgr.dev/chainguard/glibc-dynamic
COPY --from=build --chown=nonroot:nonroot /app/target/release/${PACKAGE} /usr/local/bin/${PACKAGE}
CMD ["/usr/local/bin/${PACKAGE}"]
```

```shell
$ docker build -t foo --build-arg PACKAGE=shop .
[+] Building 74.4s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                         0.0s
 => => transferring dockerfile: 291B                                                                                                                                                                                                         0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                                                                                              0.0s
 => [internal] load metadata for cgr.dev/chainguard/glibc-dynamic:latest                                                                                                                                                                                0.0s
 => [internal] load metadata for cgr.dev/chainguard/rust:latest                                                                                                                                                                              0.0s
 => [internal] load build context                                                                                                                                                                                                            0.0s
 => => transferring context: 6.21kB                                                                                                                                                                                                          0.0s
 => [stage-1 1/2] FROM cgr.dev/chainguard/glibc-dynamic                                                                                                                                                                                                 0.0s
 => [build 1/4] FROM cgr.dev/chainguard/rust                                                                                                                                                                                                 0.0s
 => CACHED [build 2/4] WORKDIR /app                                                                                                                                                                                                          0.0s
 => [build 3/4] COPY . .                                                                                                                                                                                                                     0.0s
 => [build 4/4] RUN cargo build --release                                                                                                                                                                                                   73.9s
 => [stage-1 2/2] COPY --from=build --chown=nonroot:nonroot /app/target/release/shop /usr/local/bin/shop                                                                                                                                     0.1s
 => exporting to image                                                                                                                                                                                                                       0.1s
 => => exporting layers                                                                                                                                                                                                                      0.0s
 => => writing image sha256:cf84a39643bc196611fa01819a91d31e34da74128499db74b75e1da3faa77bae                                                                                                                                                 0.0s
 => => naming to docker.io/library/foo                                                                                                                                                                                                       0.0s
dlorenc@DANIELs-MacBook-Air rust-web-app % docker run foo /usr/local/bin/shop
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"shop::api","@m":"starting up"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"🔧 Configured for release."}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"address: \u001b[1;49;39m127.0.0.1\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"port: \u001b[1;49;39m8000\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"workers: \u001b[1;49;39m8\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"ident: \u001b[1;49;39mRocket\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"limits: \u001b[1;49;39mbytes = 8KiB, data-form = 2MiB, file = 1MiB, form = 32KiB, json = 1MiB, msgpack = 1MiB, string = 8KiB\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"temp dir: \u001b[1;49;39m/tmp\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"http/2: \u001b[1;49;39mtrue\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"keep-alive: \u001b[1;49;39m5\u001b[0m\u001b[1;49;39ms\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"tls: \u001b[1;49;39mdisabled\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"shutdown: \u001b[1;49;39mctrlc = true, force = true, signals = [SIGTERM], grace = 2s, mercy = 3s\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"log level: \u001b[1;49;39mcritical\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"cli colors: \u001b[1;49;39mtrue\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::rocket","@m":"📬 \u001b[35mRoutes\u001b[0m:"}
```

If you're interested in enterprise support, SLAs, and access to older tags, [get in touch](https://www.chainguard.dev/chainguard-images).
<!--body:end-->

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._