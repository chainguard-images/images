//go:build mage

package main

import (
	"fmt"

	"github.com/chainguard-dev/images/mage/greeting"
)

func Hello() {
	fmt.Println(greeting.Say())
}
