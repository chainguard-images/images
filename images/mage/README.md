<!--monopod:start-->
# mage
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/mage` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/mage/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Mage](https://magefile.org) is a Makefile alternative written in Go.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/mage:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

First, build or pull the Mage image.

The Mage image can be used in multiple ways:
1. Mount a directory containing a Magefile, and run the target
2. Directly run Mage against code inside of a Dockerfile

### Mounting a directory

Create a a `magefile` with these contents in:
```go
//go:build mage

package main

import (
	"fmt"
)

func Hello() {
	fmt.Println("Hello World!")
}
```

> The file name can be `main.go`, `magefile.go`, or anything else as long as the `//go:build mage` directive is present

Then use `docker run` pointed to the Mage target:
```
❯ docker run --rm -v $(pwd):/mage -w /mage cccc022ebf57 hello
Hello Chainguard!
```

### Running within Dockerfile

Create a Dockerfile with these contents:
```Dockerfile
FROM cgr.dev/chainguard/mage

WORKDIR /mage

COPY <<EOF main.go
//go:build mage

package main

import (
	"fmt"
)

func Hello() {
	fmt.Println("Hello World!")
}
EOF

CMD ["hello"]
```

Then use `docker run`
```
❯ docker run --rm 84d11b27e39b
Hello World!
```

> Additional files or directories can be add to the Dockerfile which Mage can then target (e.g. copying a directory containing existing Mage targets).

<!--body:end-->
