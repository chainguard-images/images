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
A minimal, [Wolfi](https://github.com/wolfi-dev)-based image for MLflow, an open source platform for the machine learning lifecycle.

<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mlflow:latest
```
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
