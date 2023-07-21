package main

import (
	"fmt"
	"github.com/google/go-containerregistry/pkg/name"
)

var _ = name.MustParseReference("cgr.dev/chainguard/go")

func main() {
	fmt.Println("Hello World!")
}
