package mutate

import (
	"path"
	"strings"

	"github.com/jdolitsky/tq/pkg/tq"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
)

// GeneratorMutate02PrefixSourcePaths prepends any
// top-level attributes called "source" with the
// provided path prefix (e.g. "../../public/images/<name>")
type GeneratorMutate02PrefixSourcePaths struct {
	SourcePathPrefix string
}

func (g *GeneratorMutate02PrefixSourcePaths) Generate(_ string, _, _ []string, data *tq.TerraformFile) error {
	for _, block := range data.Body.Blocks {
		v := block.Attributes[constants.AttributeSource]
		if v == "" {
			continue
		}
		// Do not modify the source for tflib invocations
		if strings.Contains(v, constants.DetectTfLib) {
			continue
		}
		source := util.QuoteTQString(path.Join(g.SourcePathPrefix, util.UnquoteTQString(v)))
		block.Attributes[constants.AttributeSource] = source
	}
	return nil
}
