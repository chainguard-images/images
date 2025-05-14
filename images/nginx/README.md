<!--monopod:start-->
# nginx
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nginx` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/nginx/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for nginx

Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/nginx:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's `nginx` container image is comparable to both the `latest` and `alpine` versions of the [official nginx image](https://hub.docker.com/_/nginx) and, wherever possible, the Chainguard Container's configuration will align with the official image. However, Chainguard Images are built to be as minimal as possible, requiring a specific set of changes, which are outlined here.

### Users

The official Docker image starts as the root user and forks to a less privileged user. By contrast, the Chainguard `nginx` Container starts as a less privileged user named `nginx` and no forking is required. 

Also note that the default `nginx` configuration file includes a user directive that will run the `nginx` process as the `nginx` user. See the following section on custom server blocks for more information.

### Default port

The default port for the `nginx` Chainguard Container is `8080`, rather than `80`.

### IPv6 Support

The official nginx image checks for the existence of `/proc/net/if_inet6` and automatically listens on `[::]:80` if it exists. For simplicity, Chainguard's `nginx` container image only listens on IPv4, but you can add IPv6 support by mounting a configuration file with a section similar to the following:

```
server {
    listen       8080;
    listen  [::]:8080;
    ...

```

Note that the default configuration file in the Chainguard `nginx` Container includes the relevant section at `/etc/nginx/conf.d/default.conf`. 

### Environment Variable Substitution

The official nginx image has support for setting environment variables that get substituted into the config file. Currently we do not have support for this.

### User Directive Warning

Starting the container gives the following warning:

```shell
 [warn] 1#1: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
```

This warning tells us that the container is already running as the user `nginx`, meaning that the directive has no effect because the default user is already `nginx`. If the container is run as root, it would switch to the `nginx` user to run the `nginx` process. We've included this directive in the default configuration for those running the container with a different user using the `--user` flag or equivalent.

### Entrypoint

The entrypoint for the `nginx` Chainguard Container is `/usr/sbin/nginx`. Commands run as part of `docker run` or a `CMD` statement in a Dockerfile will be passed as arguments to `nginx`.


## Getting Started

> [!NOTE]
> For a hands-on example of how to use the `nginx` container image, we encourage you to check out our guide on [Getting Started with the nginx Chainguard Container](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/nginx/).

The `nginx` Chainguard Container provides a secure basis for serving static content, running a reverse proxy, or performing other common server tasks. To try out the image, run:

```shell
docker run -p 8080:8080 cgr.dev/chainguard/nginx:latest
```

After starting the container, navigate to `localhost:8080` in your web browser. You should find the default nginx welcome page.

You can also use the `nginx` Container to serve your own custom content. As an example, first create a folder to contain static HTML that will be served by nginx:

```shell
mkdir -p ~/html
```

Next, create a file called `index.html` in the `html` folder:

```shell
cat > ~/html/index.html <<EOF
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>nginx</title>
</head>
<body>
  <h2>Hello World from nginx!</h2>
</body>
</html>
EOF
```

You can then instruct the nginx Image to serve the `index.html` file:

```shell
docker run \
 -v $(pwd)/html:/usr/share/nginx/html \
 -p 8080:8080 \
 cgr.dev/chainguard/nginx:latest
```

If you navigate to `localhost:8080` in your web browser, it will return our custom HTML: `Hello World from nginx!`.

## Adding a Custom Server Block

The default nginx configuration file checks for custom server blocks as files with a `.conf` extension within the `/etc/nginx/conf.d` folder. As an example, let's create a minimal server block that will serve the `index.html` file in the `html` folder created above from a new location (`/www/data`) and from a new port (`4000`).

Create a folder to hold our block configuration:

```shell
mkdir -p ~/conf.d
```

Create a new server block configuration file within this folder:

```shell
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

```shell
docker run -p 4000:4000 \
 -v $(pwd)/html:/www/data \
 -v $(pwd)/conf.d:/etc/nginx/conf.d \
 cgr.dev/chainguard/nginx:latest
```

The above will serve our HTML from the `/www/data` folder on port `4000` using the additional settings defined in the default `nginx.conf` file.

## Replacing the Default nginx Configuration

To replace the main nginx configuration file, you can mount a folder containing a configuration file named `nginx.conf` at `/etc/nginx/` within the container.

First create a folder to contain our replacement configuration:

```shell
mkdir -p nginx-conf
```

Create a configuration file inside this folder:

```shell
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


```shell
docker run -p 4000:4000 \
 -v $(pwd)/html:/www/data \
 -v $(pwd)/nginx-conf:/etc/nginx \
 cgr.dev/chainguard/nginx:latest
```

You should be able to view the contents of the `index.html` file in the `html` folder at `localhost:4000`. For more on nginx configuration, refer to the [documentation at nginx.org](https://nginx.org/en/docs/example.html).

## Run in a read-only File System

If you want to serve files using a read-only filesystem, you will need to mount the `/var/run` and `/var/lib/nginx/tmp` directories. You can do this with the `--tmpfs` option:

```shell
docker run \
 --read-only \
 --tmpfs /var/lib/nginx/tmp/ --tmpfs /var/run/ \
 --cap-drop=ALL \
 -p 8080:8080 \
 cgr.dev/chainguard/nginx
```

You can also run the `nginx` container image in a read-only filesystem using Kubernetes. To do so, you could use a manifest like the following example:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
spec:
  replicas: 1
  selector:
	matchLabels:
  	app: nginx
  template:
	metadata:
  	labels:
    	app: nginx
	spec:
  	containers:
  	- name: nginx
    	image: cgr.dev/chainguard/nginx:latest
    	ports:
    	- containerPort: 8080
    	securityContext:
      	readOnlyRootFilesystem: true
    	volumeMounts:
    	- name: run
      	mountPath: /var/run/
    	- name: tmp
      	mountPath: /var/lib/nginx/tmp/
  	volumes:
  	- name: run
    	emptyDir: {}
  	- name: tmp
    	emptyDir: {}
  	- name: conf
    	configMap:
      	name: nginx-conf
```


## Documentation and Resources

* [Official nginx Documentation](https://nginx.org/en/docs/)
* [Docker Hub: Official nginx Image](https://hub.docker.com/_/nginx)
* [Chainguard Academy: Getting Started with the nginx Chainguard Container](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/nginx/)
* [Video: Getting Started with the nginx Chainguard Container](https://www.youtube.com/watch?v=KirTeDMzzxk)
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