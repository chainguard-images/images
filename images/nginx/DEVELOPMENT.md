# cgr.dev/chainguard/nginx Development

This doc covers building the nginx image locally with Docker.

_Note: This doc is a WIP, and there likely is a better way to do this. Will aim to keep this doc updated._


## Building cgr.dev/chainguard/nginx Locally

First, build the local apk package with the [melange](https://github.com/chainguard-dev/melange) Docker image.
This will involve a few steps:
1. Generate a keypair for signing the package
1. Build the package with melange
1. Sign the package


First, set the desired architecture you want to build and generate the keypair:

```
ARCH=[set to desired arch to build]
docker run -it -v $(pwd):/w -w /w cgr.dev/chainguard/melange keygen
```

Then, build the apk package:

```
docker run -it -v $(pwd):/w -w /w -v $(pwd)/packages:/w/packages --privileged cgr.dev/chainguard/melange build melange.yaml --arch $ARCH --out-dir /w/packages --empty-workspace --repository-append /w/packages --keyring-append melange.rsa --template '{"Version":"1.20.2", "SHA": "958876757782190a1653e14dc26dfc7ba263de310e04c113e11e97d1bef45a42"}'
```

The apk package will be stored locally in `./packages`.

Run `apk index`:

```
$ APK_PACKAGE=$(ls ./packages/$ARCH)
$ docker run -it -v $(pwd):/w -w /w/packages/$ARCH -v $(pwd)/packages:/w/packages --entrypoint apk cgr.dev/chainguard/melange index -o APKINDEX.tar.gz $APK_PACKAGE

WARNING: No provider for dependency 'so:libexslt.so.0'
WARNING: No provider for dependency 'so:libGeoIP.so.1'
WARNING: No provider for dependency 'so:libcrypto.so.1.1'
WARNING: No provider for dependency 'so:libssl.so.1.1'
WARNING: No provider for dependency 'so:libxml2.so.2'
WARNING: No provider for dependency 'so:libz.so.1'
WARNING: No provider for dependency 'so:libpcre.so.1'
WARNING: No provider for dependency 'so:libxslt.so.1'
WARNING: No provider for dependency 'so:libgd.so.3'
WARNING: Too many unsatisfiable dependencies, not reporting the rest.
WARNING: Total of 10 unsatisfiable package names. Your repository may be broken.
Index has 1 packages (of which 1 are new)
```

Sign it by running:

```
$ docker run -it -v $(pwd):/w -w /w/packages/$ARCH -v $(pwd)/packages:/w/packages cgr.dev/chainguard/melange sign-index --signing-key=/w/melange.rsa APKINDEX.tar.gz

2022/07/08 14:33:47 signing index APKINDEX.tar.gz with key /w/melange.rsa
2022/07/08 14:33:47 appending signature to index APKINDEX.tar.gz
2022/07/08 14:33:47 writing signed index to APKINDEX.tar.gz
2022/07/08 14:33:47 signed index APKINDEX.tar.gz with key /w/melange.rsa
```

Now that we have the package, build the image and save it as a tarball called `nginx.tar`:

```
docker run -v $(pwd):/w  -v $(pwd)/packages:/github/workspace/packages -w /w ghcr.io/chainguard-dev/apko:canary build apko.yaml cgr.dev/chainguard/nginx:local nginx.tar --debug --build-arch arm64 --use-docker-mediatypes -k melange.rsa.pub

...
Jul  8 14:41:38.476 [INFO] [arch:aarch64] output Docker image file to nginx.tar
```

To run the image, load it from the tarball and run:

```
docker load < nginx.tar
docker run -p 8080:80 cgr.dev/chainguard/nginx:local
```

and navigate to `localhost:8080`. You should see the nginx welcome page!
