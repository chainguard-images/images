package mutate

import (
	"fmt"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
	"github.com/jdolitsky/tq/pkg/tq"
)

// GeneratorConvert01VersionedPublisher mutate
// invocations of the "publisher" tflib to pass along
// a "main_package" attribute
type GeneratorMutate01VersionedPublisher struct {
	MainPackage string
}

func (g *GeneratorMutate01VersionedPublisher) Generate(dir string, _, _ []string, data *tq.TerraformFile) error {
	for _, block := range data.Body.Blocks {
		if strings.HasSuffix(util.UnquoteTQString(block.Attributes[constants.AttributeSource]), fmt.Sprintf("/%s", constants.AttributePublisher)) {
			block.Attributes[constants.AttributeMainPackage] = util.QuoteTQString(g.MainPackage)
		}
	}
	return nil
}
