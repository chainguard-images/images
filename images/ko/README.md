# ko

This is an image that contains ko, go, and build-base.

This image is designed for use in situations where you would like
to use `ko` with codebases that have C dependencies where `cgo`
must be used.  In these cases, staticly linking against musl
instead of glibc results in smaller binaries.

This image is also regenerated nightly.
