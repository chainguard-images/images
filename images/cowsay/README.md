<!--monopod:start-->
# cowsay
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/cowsay` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/cowsay/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal image with the `cowsay` utility for speaking animals, disaster recovery, remote access, and/or fun.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/cowsay:latest
```

## Usage

To run `cowsay`:

```
$ docker run cgr.dev/chainguard/cowsay
cow{say,think} version 3.03, (c) 1999 Tony Monroe
Usage: cowsay [-bdgpstwy] [-h] [-e eyes] [-f cowfile]
          [-l] [-n] [-T tongue] [-W wrapcolumn] [message]
```

```
$ docker run cgr.dev/chainguard/cowsay moo
 _____
< moo >
 -----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```


## Helm/Kubernetes Usage

There are no helm charts for cowsay.
If you need to deploy it in a Kubernetes cluster, first stop and ask what you're doing.

## CUDA Support

This image does not include CUDA support yet.
Stay tuned for GPU-accelerated cows in the future! (just kidding)

## FIPS

Just stop.
