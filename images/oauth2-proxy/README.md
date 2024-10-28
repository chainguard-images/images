<!--monopod:start-->
# oauth2-proxy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/oauth2-proxy` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/oauth2-proxy/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for oauth2-proxy

[OAuth2 Proxy](https://oauth2-proxy.github.io/oauth2-proxy/) is a reverse proxy that provides authentication with Google, Azure, OpenID Connect and many more identity providers.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/oauth2-proxy:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Use It!

This section provides a brief overview of how you can use Chainguard's `oauth2-proxy` Image to set up a proxy that can intercept a call to a specified endpoint. A complete end-to-end test would require a GitHub account (or an account with another OIDC Auth provider), a trusted domain, and an OAuth application; this example will be useful to test that the image works but it will not be able to verify authentication or properly redirect users.

Run the following command.

```shell
docker run --detach --name oidc-test -p 8080:8080 cgr.dev/chainguard/oauth2-proxy:latest \
  --cookie-secure=false \
  --cookie-secret=RYC2VBUYWQ6aenOkoN6jELQsrjtmwb23a7NdtrLI0ao= \
  --upstream=file:///dev/null \
  --http-address=0.0.0.0:8080 \
  --redirect-url=http://localhost:8080/oauth2/callback \
  --client-id=sample-id \
  --client-secret=sample-secret \
  --email-domain="*" \
  --provider=github \
  --scope=user:email
```

This `docker` command runs the `oauth2-proxy` Image while passing a number of configuration options to it. Most of these are sample values intended to get a working example proxy up and running. One particularly important option you should be aware of is the `--redirect-url`, which points to the OAuth application's callback URL. In order to set up an example locally, this example uses `http://localhost:8080` here.

Note that you can alternatively define these options in a configuration file or through environment variables. You can check out the [OAuth2 Proxy Overview](https://oauth2-proxy.github.io/oauth2-proxy/configuration/overview) for more details on these options.

After running this command, navigate to [`http://localhost:8080`](http://localhost:8080) in your web browser. There, you'll be presented with the OAuth2 Proxy sign-in screen.

Please refer to [the official documentation](https://oauth2-proxy.github.io/oauth2-proxy/) for more information on how to work with OAuth2 Proxy.

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