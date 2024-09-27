<!--monopod:start-->
# mlflow
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mlflow` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/mlflow/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for mlflow

A minimal, [Wolfi](https://github.com/wolfi-dev)-based image for MLflow, an open source platform for the machine learning lifecycle.


Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/mlflow:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
### MLflow Usage

MLflow's default entrypoint is Python, enabling us to run experiments directly:

```bash
docker run -it cgr.dev/chainguard/mlflow:latest <your experiment>.py
```

Otherwise, we can override the entrypoint and interact with MLflow:

```bash
docker run -it --entrypoint mlflow cgr.dev/chainguard/mlflow:latest <options>
```

### MLflow Tracking Usage

MLflow provides a UI, MLflow Tracking, that allows the user to track 'runs' (the execution of data science code) via visualizations of metrics, parameters, and artifacts.

To start the UI, open a terminal and run:

```bash
docker run -it -p 5000:5000 --entrypoint mlflow cgr.dev/chainguard/mlflow:latest ui
```

While the UI defaults to running on port 5000, you can use a different port via passing `-p <PORT>` as a command line option. Ensure Docker also maps to the correct port.

You should now be able to access the UI at [localhost:5000](http://localhost:5000).

The Tracking API can now be leveraged to record metrics, parameters, and artifacts:

```python
import mlflow

# Set the MLflow tracking URI
mlflow.set_tracking_uri("http://localhost:5000")

# Start an experiment
mlflow.set_experiment("my_experiment")

with mlflow.start_run():
    # Log parameters, metrics, and artifacts
    mlflow.log_param("param1", value1)
    mlflow.log_metric("metric1", value2)
    mlflow.log_artifact("path/to/artifact")
    # Train and log model
    mlflow.sklearn.log_model(model, "model")
```

Ensure that the tracking URI correctly reflects where the MLflow server is running.

For additional documentation covering MLflow Tracking, see the [official docs](https://mlflow.org/docs/latest/tracking.html).

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