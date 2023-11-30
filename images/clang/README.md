<!--monopod:start-->
# clang
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/clang` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/clang/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Clang](https://clang.llvm.org) is a compiler front end for the C, C++, Objective-C, and Objective-C++ programming languages, as well as the OpenMP, OpenCL, RenderScript, CUDA, SYCL, and HIP frameworks.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/clang:latest
```
<!--getting:end-->

<!--body:start-->


## Use It!

To illustrate working with the Clang Chainguard Image, this section outlines how you can use it to compile a "Hello World!" program written in C. 

To begin, run the following command to create a file named `hello.c` to hold the C code.

```shell
cat > /tmp/hello.c <<EOF
#include <stdio.h>

int main() {
    printf("Hello World!\n");
    return 0;
}
EOF
```

To simplify cleanup, this command places the file in the `/tmp` temporary directory. 

Next, run the following `docker` command. This will mount the contents of your local `/tmp` directory (including the `hello.c` file) into the container's `work` directory. Once there, Clang will compile the C code into an executable program named `hello`.

```shell
docker run --rm -v /tmp:/work cgr.dev/chainguard/clang:latest hello.c -o hello
```

The `hello` program will be stored back in your local `/tmp` directory. You can test that everything worked correctly by executing this program.

```shell
/tmp/hello
```
```
Hello World!
```
<!--body:end-->