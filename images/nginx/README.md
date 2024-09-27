<!--monopod:start-->
# nginx
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nginx` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nginx/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for nginx

Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/nginx:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

<!--body:start-->
## Description

The `nginx` Chainguard Image provides a secure basis for serving static content, running a reverse proxy, or performing other common server tasks.

## Variants

We have two image variants available:

- A minimal runtime variant that removes shells and package managers for additional security.
- An `nginx:latest-dev` variant that contains the `apk` package manager and the `bash`, `ash`, and `sh` shells.

To pull the minimal runtime variant from `cgr.dev`:

```sh
docker pull cgr.dev/chainguard/nginx:latest
```
To pull the dev variant:


```sh
docker pull cgr.dev/chainguard/nginx:latest-dev
```

## Usage

To try out the image, run:

```sh
docker run -p 8080:8080 cgr.dev/chainguard/nginx:latest
```

After starting the container, navigate to `localhost:8080` in your web browser. You should find the default nginx welcome page.

You can also use the nginx Image to serve your own custom content. As an example, first create a folder to contain static HTML that will be served by nginx:

```sh
mkdir -p ~/html
```

Next, create a file called `index.html` in the `html` folder:

```sh
cat > ~/html/index.html <<EOF
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nginx</title>
</head>
<body>
  <h2>Hello World from Nginx!</h2>
</body>
</html>
EOF
```

You can then instruct the nginx Image to serve the `index.html` file:

```sh
docker run \
 -v $(pwd)/html:/usr/share/nginx/html \
 -p 8080:8080 \
 cgr.dev/chainguard/nginx:latest
```

If you navigate to `localhost:8080` in your web browser, it will return our custom HTML: `Hello World from Nginx!`.

## Adding a Custom Server Block

The default nginx configuration file checks for custom server blocks as files with a `.conf` extension within the `/etc/nginx/conf.d` folder. As an example, let's create a minimal server block that will serve the `index.html` file in the `html` folder created above from a new location (`/www/data`) and from a new port (`4000`).

Create a folder to hold our block configuration:

```sh
mkdir -p ~/conf.d
```

Create a new server block configuration file within this folder:

```sh
cat > ~/conf.d/static.conf <<EOF
server {
  listen        4000;

  location / {
    autoindex on;
    root  /www/data;
  } 
}
EOF
```

The above is a server block that will be loaded within the default nginx configuration file. Static files will be served from the `/www/data` location at port `4000`.

The following command runs an nginx container, adding our `html` folder and the `conf.d` configuration folder as volumes

```sh
docker run -p 4000:4000 \
 -v $(pwd)/html:/www/data \
 -v $(pwd)/conf.d:/etc/nginx/conf.d \
 cgr.dev/chainguard/nginx:latest
```

The above will serve our HTML from the `/www/data` folder on port `4000` using the additional settings defined in the default `nginx.conf` file.

## Replacing the Default nginx Configuration

To replace the main nginx configuration file, you can mount a folder containing a configuration file named `nginx.conf` at `/etc/nginx/` within the container.

First create a folder to contain our replacement configuration:

```sh
mkdir -p nginx-conf
```

Create a configuration file inside this folder:

```sh
cat > ~/nginx-conf/nginx.conf <<EOF
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    default_type  application/octet-stream;

    sendfile        on;

    server {
      listen        4000;

        location / {
            autoindex on;
            root  /www/data;
  } 
}

}
EOF
```

Start a container with our created `html` and `nginx-config` folders as volumes.


```sh
docker run -p 4000:4000 \
 -v $(pwd)/html:/www/data \
 -v $(pwd)/nginx-conf:/etc/nginx \
 cgr.dev/chainguard/nginx:latest
```

You should be able to view the contents of the `index.html` file in the `html` folder at `localhost:4000`. For more on nginx configuration, refer to the [documentation at nginx.org](https://nginx.org/en/docs/example.html).

## Run in a read-only File System

If you want to serve files using a read-only filesystem, you will need to mount the `/var/run` and `/var/lib/nginx/tmp` directories. You can do this with the `--tmpfs` option:

```sh
docker run \
 --read-only \
 --tmpfs /var/lib/nginx/tmp/ --tmpfs /var/run/ \
 --cap-drop=ALL \
 -p 8080:8080 \
 cgr.dev/chainguard/nginx
```

## User Directive Warning

Starting the container gives the following warning:

```sh
 [warn] 1#1: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
```

This warning tells us that the container is already running as the user `nginx`, meaning that the directive has no effect because the default user is already `nginx`. If the container is run as root, it would switch to the `nginx` user to run the `nginx` process. We've included this directive in the default configuration for those running the container with a different user using the `--user` flag or equivalent.

## Differences from [Official Docker Image](https://hub.docker.com/_/nginx)

Wherever possible, the Chainguard nginx Image tries to follow the same configuration as the official version hosted on Docker Hub. However, Chainguard Images are built to be as minimal as possible, requiring a specific set of changes. This section outlines the major differences between these images. 

### Users

The official Docker image starts as the root user and forks to a less privileged user. By contrast, the Chainguard nginx Image starts as a less privileged user named `nginx` and no forking is required. 

Also note that the default `nginx` configuration file includes a user directive that will run the `nginx` process as the `nginx` user. See the above section on custom server blocks for more information.

### Default port

The default port for the `nginx` Chainguard Image is `8080`, rather than `80`.

### IPv6 Support

The official Docker image checks for the existence of `/proc/net/if_inet6` and automatically listens on `[::]:80` if it exists. For simplicity, we only listen on IPv4, but you can add IPv6 support by mounting a configuration file with a section similar to the following:

```
server {
    listen       8080;
    listen  [::]:8080;
    ...

```

Note that the default configuration file in the Chainguard nginx Image includes the relevant section at `/etc/nginx/conf.d/default.conf`. 

### Environment Variable Substitution

The Docker official image has support for setting environment variables that get substituted into the config file. Currently we do not have support for this.
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