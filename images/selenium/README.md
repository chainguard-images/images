<!--monopod:start-->
# docker-selenium
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/docker-selenium` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/docker-selenium/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for docker-selenium

Minimal [docker-selenium](https://github.com/SeleniumHQ/docker-selenium) container image with Chromium.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/docker-selenium:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->

## Usage

Run the container with the following command:

```bash
docker run --shm-size="2g" -p 4444:4444 -p 7900:7900 cgr.dev/chainguard/docker-selenium:latest
```

Verify Selenium is running:

```bash
curl -sL http://localhost:4444/status` should return a `200` status code, and the response body should contain `{"value":{"ready":true}}` with 1 `availability: UP` node.
```

Access Selenium:

```bash
http://localhost:4444
```

Access noVNC:

```bash
http://localhost:7900/vnc.html`:
```

- Login with the password `secret`.

Any WebDriver tests should point to Selenium on on port 4444.

The following is an example ChromeDriver test using Selenium to retrieve Chainguard's homepage:

```python
from selenium import webdriver
from time import sleep

print("Testing ChromeDriver...")

options = webdriver.ChromeOptions()

driver = webdriver.Remote(
  command_executor='http://localhost:4444/wd/hub',
  options=options
)

'''Maximize window'''
driver.maximize_window()
sleep(5)

'''Retrieve Chainguards homepage'''
driver.get("https://www.chainguard.dev/")
sleep(5)

'''Exit'''
driver.close()
driver.quit()
print("ChromeDriver test successful!")
```

Please note that Chromium is ran in a headless state with the sandbox with GPU access disabled with the flags:

```
--headless --no-sandbox --disable-gpu
```

Chromium is ran headless with GPU access disabled as the container does not have GPU access.

Chromium's sandbox has been disabled as the container is sandboxed from the host environment, and because the
container is running as the root user.

This can be overriden via the environment variable `CHROMIUM_USER_FLAGS` though this is unsupported.

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