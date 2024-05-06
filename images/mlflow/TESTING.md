# Testing MLflow

Start off by pulling down the image:

```bash
docker pull cgr.dev/chainguard/mlflow:latest
```

Now we'll run a quick test to ensure MLflow is detected by Python:

```bash
docker run -it --rm cgr.dev/chainguard/mlflow:latest -m mlflow
```

This also validates that we are using the version of Python provided in the virtual environment and not the main Python installation. Because everything is installed within a virtual environment, this is important to verify.

Now we can start MLflow Tracker:

```bash
docker run -it --rm -w $(pwd) -v $(pwd):$(pwd) -p 5000:5000 --entrypoint mlflow --name mlflow cgr.dev/chainguard/mlflow:latest ui --host 0.0.0.0
```

By default, this will start on port 5000. We can override this by running the following:

```bash
docker run -it --rm -w $(pwd) -v $(pwd):$(pwd) -p <PORT>:<PORT> --entrypoint mlflow --name mlflow cgr.dev/chainguard/mlflow:latest ui --host 0.0.0.0 -p <PORT>
```

Logs aren't all too verbose. The important thing you should see is `Listening on: 0.0.0.0:<PORT>`.

Now let's do a quick health check:

```bash
curl -vsL localhost:5000/health
```

The status code should be 200. If all is well, you should be able to access the UI at [localhost:5000](http://localhost:5000).

Now we can test basic functionality of MLflow Tracker. Save this code snippet:

```python
import mlflow

with mlflow.start_run():
    for epoch in range(0, 3):
        mlflow.log_metric(key="quality", value=2 * epoch, step=epoch)
```

And then execute it:

```bash
docker exec mlflow python ./test.py
```

This will create a run with a random name that should now be viewable in MLflow's UI.
