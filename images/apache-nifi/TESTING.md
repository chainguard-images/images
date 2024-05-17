# Testing Apache NiFi

To begin testing Chainguard's NiFi image, run it via Docker:

```bash
docker run \
  -it --rm \
  -p <YOUR PORT>:<YOUR PORT> \
  -e NIFI_WEB_HTTP_HOST="0.0.0.0" \
  -e NIFI_WEB_HTTP_PORT="<YOUR PORT>" \
  -e SINGLE_USER_CREDENTIALS_USERNAME="<YOUR USERNAME>" \
  -e SINGLE_USER_CREDENTIALS_PASSWORD="<YOUR PASSWORD>" \
  --name <CONTAINER NAME> \
  "${IMAGE_NAME}"
```

Where `<YOUR PORT>` is a free port on your system.

NiFi will take a moment to start up. Once it has successfully started, you'll see a message stating the Web UI is available:

```
NiFi has started. The UI is available at the following URLs
```

At this point, you can access the Web UI at `localhost:<YOUR PORT>`.

You will be greeted with a blank canvas, called a process group.

### Testing NiFi's API

NiFi provides various API endpoints that we can use. For the purposes of this test, we'll create a processor and validate it was created successfully.

The first thing we'll do is acquire info about the root process group (the first canvas you see when accessing NiFi's Web UI):

```bash
curl -s -X GET "http://localhost:<YOUR PORT>/nifi-api/flow/process-groups/root"
```

Take note of the ID. It will look like this:

```json
"id": "885e58ea-018f-1000-7ce8-f57d0578e375",
```

We'll need this for a creating a processor within the root process group.

Now that we have the ID of the root process group, we can create a processor:

```bash
curl -s -X POST "http://localhost:<YOUR PORT>/nifi-api/process-groups/<ROOT PROCESS GROUP ID>/processors" \
        -H "Content-Type: application/json" \
        -d '{
                "revision": {
                    "clientId": "test-client",
                    "version": 0
                },
                "component": {
                    "type": "org.apache.nifi.processors.standard.GenerateFlowFile",
                    "name": "GenerateFlowFile"
                }
            }'
```


To validate the processor was successfully created, we can retrieve the processor details:

```bash
curl -s -X GET "http://localhost:44317/nifi-api/processors/<PROCESSOR ID>"
```

The processor's component name should be set to `GenerateFlowFile`.

Alternatively, you may access the Web UI over `localhost:<YOUR PORT>`. The processor will be viewable on the canvas.

For more info on NiFi's API, see the [upstream API documentation](https://nifi.apache.org/docs/nifi-docs/rest-api/index.html).

An introductory user guide may be found [here](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html).

### What about Helm?

Unfortunately, while a chart exists, it is not longer maintained. It can be found [here](https://github.com/cetic/helm-nifi).
