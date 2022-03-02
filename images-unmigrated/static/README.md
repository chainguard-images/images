# static

Base image with just enough files to run static binaries!

This image is meant to be used as a base image only, and is
otherwise useless.  It contains the `alpine-baselayout-data`
package from Alpine, which is just a set of data files needed
to support glibc and musl static binaries at runtime.

This image can be used with `ko build`, `docker`, etc, but
is only suitable for running static binaries.

This image is also regenerated nightly.
