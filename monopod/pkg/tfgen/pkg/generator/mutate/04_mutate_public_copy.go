package mutate

import (
	"path/filepath"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
	"github.com/jdolitsky/tq/pkg/tq"
)

// GeneratorMutate04PublicCopy makes a copy of
// public image contents, with paths fixed
type GeneratorMutate04PublicCopy struct{}

func (g *GeneratorMutate04PublicCopy) Generate(dir string, _, _ []string, data *tq.TerraformFile) error {
	// Do NOT run if there isn't a call to "versions" tflib
	if !util.HasVersionsBlock(data) {
		return nil
	}

	// Completely reset the blocks with a single call to "public-copy"
	data.Body.Blocks = []tq.TerraformFileBlock{
		{
			Type:   constants.TfTypeModule,
			Labels: []string{constants.AttributePublicCopy},
			Attributes: map[string]string{
				constants.AttributeSource: util.QuoteTQString(constants.TfLibPublicCopy),
				constants.AttributeImage:  util.QuoteTQString(filepath.Base(dir)),
			},
		},
	}
	return nil
}
