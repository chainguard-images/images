# distroless.dev/python

This repository contains the source files for the Python distroless image `distroless.dev/python`. 

This is a minimal PHP image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).

## Python Version

While this image is being developed, we'll stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Usage

To try out the image, run:

```shell
docker run -iv --rm distroless.dev/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run distroless.dev/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```
