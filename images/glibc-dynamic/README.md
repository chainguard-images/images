# glibc-dynamic

Base image with just enough to run arbitrary glibc binaries.

This image is meant to be used as just a base image only.  It does not contain
any programs that can be run, other than `/sbin/ldconfig`.

You must bring your own artifacts to use this image, e.g. with a Docker multi-stage
build.  If you want locale support other than `C.UTF-8`, you must bring your own
locale data as well.  This may change in the future based on user feedback.

See also [musl-dynamic](https://github.com/distroless/musl-dynamic) which is an
equivalent image for running dynamically-linked musl binaries.

This image is regenerated nightly.
