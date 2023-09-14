package main

import (
	// nolint: depguard
	_ "crypto/sha256" // Recommended by go-digest.
	"fmt"

	"github.com/opencontainers/go-digest"
)

func main() {
	if err := digest.Canonical.Validate("36bc3535e93a712d148f2a2e3674236e1f8a5e3db935ed2e6d0320e369920c2c"); err != nil {
		panic(err)
	}
	fmt.Println("Hello World!")
}
