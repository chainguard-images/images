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
Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nginx:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

On May 3, 2023 the Chainguard nginx Image was rebuilt with several improvements, including breaking changes. You may need to take action to update your application.

Specifically, the config file was changed to bring the default configuration closer to that of the official nginx image. If you override the config with a custom configuration, you should not be affected.

The changes included:

 - Moving the default port from `80` to `8080`. This is required to run on Kubernetes as a non-privileged user.
 - Setting nginx to automatically determine the number of worker processes
 - Moving the HTML directory to `/usr/share/nginx/html`

If you are unable to update currently, you can use the last build of the previous image:

```sh
docker pull cgr.dev/chainguard/nginx@sha256:bcc6b0d052298112e4644b258de0fa4dc1509e3df8f7c0fba09e8c92987825e7
```

This digest corresponds to nginx version 1.24.0. This image is not updated and you should migrate to the new configuration as soon as possible.

<!--compatibility:end-->

<!--body:start-->
## Usage

To try out the image, run:

```sh
docker run -p 8080:8080 cgr.dev/chainguard/nginx
```

Following that, navigate to `localhost:8080` in your web browser. There, you will find the default nginx welcome page.

You can also use the nginx Image to serve your own custom content. As an example, create a file named `index.html` with the following command:

```sh
cat > index.html <<EOF
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

Then can instruct the the nginx Image to serve the `index.html` file:

```sh
docker run -v $(pwd):/usr/share/nginx/html -p 8080:8080 cgr.dev/chainguard/nginx
```

If you navigate to `localhost:8080` in your web browser, it will return `Hello World from Nginx!`.

To use a custom `nginx.conf` you can mount the file into the container, being sure to edit the `-p 8080:8080` published port(s) to match your configuration's `listen` directive:

```sh
docker run -v $(pwd)/$CUSTOM_NGINX_CONF_DIRECTORY/nginx.conf:/etc/nginx/nginx.conf -p 8080:8080 cgr.dev/chainguard/nginx
```

## Run in a read-only File System

If you want to run with read-only filesystem, you will need to mount the `/var/run` and `/var/lib/nginx/tmp` directories. The easiest way to do this is with `--tmpfs` e.g:

```sh
docker run \
  --read-only \
  --tmpfs /var/lib/nginx/tmp/ --tmpfs /var/run/ \
  --cap-drop=ALL \
  -p 8080:8080
  cgr.dev/chainguard/nginx
```

### User Directive Warning

Starting the container gives the following warning:

```sh
nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
```

The warning is telling us container is already running as the named user, so it doesn't have anything to do. If the container is run as root, it would switch to the named user. We decided to leave this configuration in despite the warning for anyone that runs with `--user` switch in Docker or an equivalent.


## Differences from [Official Docker Image](https://hub.docker.com/_/nginx)

Wherever possible, the Chainguard nginx Image tries to follow the same configuration as the official Docker version. However, Chainguard designs Images with minimalism in mind; many Chainguard Images, by default, don't include a shell or package manager. This means that it's often impossible to achieve an identical configuration as the upstream version, as is the case between Chainguard's nginx Image and the official image from Docker Hub. This section outlines the major differences between these images. 

### Users

The official Docker image starts as the root user and forks to a less privileged user. By contrast, the Chainguard nginx Image starts up as a less privileged user and no forking is required. For most users this shouldn't make a difference, but note the "User Directive Warning" outlined previously.

### Default port

To support the change to an unprivileged user, the default port was moved to `8080`, contrasting with port `80` used by the official image.

### IPv6 Support

The official Docker image checks for the existence of `/proc/net/if_inet6` and automatically listens on `[::]:80` if it exists. For simplicity, we only listen on IPv4, but you can add IPv6 support by mounting a configuration file with a section like the following:

```
server {
    listen       8080;
    listen  [::]:8080;
    ...

```

Note that the default configuration file in the Chainguard nginx Image has the relevant section at `/etc/nginx/conf.d/default.conf`

### Environment Variable Substitution

The Docker official image has support for setting environment variables that get substituted into the
config file. Currently we do not have support for this, but are [looking into options](https://github.com/chainguard-images/images/issues/435).
<!--body:end-->
