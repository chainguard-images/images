package generator

import (
	"github.com/jdolitsky/tq/pkg/tq"
)

type Generator interface {
	Generate(dir string, skip, only []string, data *tq.TerraformFile) error
}
