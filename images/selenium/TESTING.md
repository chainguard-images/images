# Testing docker-selenium

This describes how to test our `docker-selenium` image.

Testing the `docker-selenium` is a bit tricky so we need to deep dive into the package itself first.

## 1. Testing the Package

### 1.1. Build

Checkout to `enterprise-packages` repository and build the package:

```shell
ARCH=amd64 make package/docker-selenium
```

> [!WARNING]
> This package doesn't support `arm64` architecture, yet.

### 1.2. Install

To install the package, you need to spin up a container first:

```shell
docker container run --entrypoint="" -p 4444:4444 -p 7900:7900 --shm-size="2g" --platform linux/x86_64 --rm -it --pull always -v "$PWD":/work --workdir="/work" cgr.dev/chainguard/wolfi-base:latest sh
```

* `4444`: Selenium port
* `7900`: VNC port

1. Install the transitive dependencies

```shell
apk add --allow-untrusted \
  packages/x86_64/bouncycastle-tls-fips-1.0.18-r0.apk \
  packages/x86_64/bouncycastle-pkix-fips-1.0.7-r0.apk \
  packages/x86_64/bouncycastle-fips-1.0.2.4-r0.apk \
  packages/x86_64/openjdk-11-jre-base-bcfips-11.0.22-r3.apk \
  packages/x86_64/openjdk-11-jre-bcfips-11.0.22-r3.apk \
  packages/x86_64/openjdk-11-default-jvm-bcfips-11.0.22-r3.apk \
  packages/x86_64/openjdk-11-bcfips-11.0.22-r3.apk \
  packages/x86_64/chromium-122.0.6250.1-r0.apk \
  packages/x86_64/selenium-server-jre-bcfips-4.17.0-r1.apk \
  packages/x86_64/selenium-server-jre-bcfips-compat-4.17.0-r1.apk
```

* Change the version of the packages to the version you have fetched.

> [!TIP]
> Use `gsutil -m cp -n "gs://chainguard-enterprise-registry-destination/os/x86_64/<PACKAGE>" ./packages/x86_64/` to download the packages from the GCS bucket.

2. Install the package

```shell
apk add --allow-untrusted \
  packages/x86_64/docker-selenium-$VERSION.apk \
  packages/x86_64/docker-selenium-supervisor-config-$VERSION.apk
```

Set the `VERSION` to the version of the package you have built.

3. Set the required environment variables

```shell
export TZ=UTC LANG_WHICH=en LANG_WHERE=US ENCODING=UTF-8 LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 SEL_USER=seluser SEL_UID=65532 SEL_GID=65532 HOME=/home/seluser SEL_DOWNLOAD_DIR=/home/Downloads SE_BIND_HOST=false SE_SCREEN_WIDTH=1360 SE_SCREEN_HEIGHT=1020 SE_SCREEN_DEPTH=24 SE_SCREEN_DPI=96 SE_START_XVFB=true SE_START_VNC=true SE_START_NO_VNC=true SE_NO_VNC_PORT=7900 SE_VNC_PORT=5900 DISPLAY=:99.0 DISPLAY_NUM=99 CONFIG_FILE=/opt/selenium/config.toml GENERATE_CONFIG=true SE_DRAIN_AFTER_SESSION_COUNT=0 SE_OFFLINE=true SE_NODE_MAX_SESSIONS=1 SE_NODE_SESSION_TIMEOUT=300 SE_NODE_OVERRIDE_MAX_SESSIONS=false DBUS_SESSION_BUS_ADDRESS=/dev/null SE_RELAX_CHECKS=true LC_CTYPE=en_US FONTCONFIG_PATH=/etc/fonts
```

### Test

1. Run the entrypoint:

```shell
/opt/bin/entry_point.sh
```

* Expect the process to be running after a while.
* Expect the following core processes should not exit with a non-zero status code:
  * `xvfb`
  * `vnc`
  * `novnc`
  * `selenium-standalone`

```
2024-02-05 08:59:35,911 INFO success: xvfb entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2024-02-05 08:59:35,914 INFO success: vnc entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2024-02-05 08:59:35,914 INFO success: novnc entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
2024-02-05 08:59:35,915 INFO success: selenium-standalone entered RUNNING state, process has stayed up for > than 0 seconds (startsecs)
```

2. Interrupt the process with <kbd>Ctrl</kbd>+<kbd>C</kbd> and check the logs:

```shell
cat /var/log/supervisor/*.log
```

* Expect no critical errors in the logs.

> [!NOTE]
> `Failed to read: session.NAME` logs are expected, you can ignore them.

3. Check the Selenium server on `http://localhost:4444`:

* Selenium UI should be accessible.
* `curl -sL http://localhost:4444/status` expects a `200` status code, and the response body should contain `{"value":{"ready":true}}` with 1 `availability: UP` node.

4. Check the VNC server on `http://localhost:7900/vnc.html`:

* VNC UI should be accessible.
* Login with the password `secret`.

## 2. Testing the Image

In order to use the image, you'll need to install [Docker](https://docs.docker.com/get-docker/). Following Docker's installation, getting up and running with Docker Selenium is as easy as opening a terminal and running:

```
docker container run -p 4444:4444 -p 7900:7900 --shm-size="2g" --platform linux/x86_64 --name CONTAINER_NAME --rm -it cgr.dev/images-private/docker-selenium:latest
```

Substitute `CONTAINER_NAME` with the name you'd like to assign to the container.

### 2.1 Retrieving Logs

Docker provides a built in way to retrieve logs from a running container:

```
docker logs CONTAINER_NAME
```

Additionally, we can pass `--follow` as an argument to monitor output in real time or `--details` to print additional information that may be helpful.

Furthermore, we can leverage `docker exec` to even more detail than what's available via the standard output of our entrypoint:

```
docker exec CONTAINER_NAME bash -c "cat /var/log/supervisor/*.log"
```

This will output the details of every log captured by `supervisor`. We can even choose to be more specific and only print information from error logs:

```
docker exec CONTAINER_NAME bash -c "cat /var/log/supervisor/*stderr*.log"
```

### 2.2 Testing Functionality

Like testing the package above, we are utilizing the same ports:

* `4444`: Selenium port
* `7900`: VNC port

To verify Selenium is operational, check its status:

```
curl -sL http://localhost:4444/status
```

Then access it by going to `localhost:4444`.

To verify VNC is operational, go to `localhost:7900` and login with the password `secret`.
