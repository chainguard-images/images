package mutate

import (
	"fmt"
	"path"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
	"github.com/jdolitsky/tq/pkg/tq"
)

// GeneratorMutate03OciTagToTagger removes all usage of "oci_tag"
// and replaces with calls to tagger tflib
type GeneratorMutate03OciTagToTagger struct{}

func (g *GeneratorMutate03OciTagToTagger) Generate(_ string, _, _ []string, data *tq.TerraformFile) error {
	// Do nothing if there is a call to "versions" tflib, use "public-copy" instead
	if util.HasVersionsBlock(data) {
		return nil
	}

	dependsOn := ""
	publisherModuleName := ""
	tmp := []tq.TerraformFileBlock{}
	for _, block := range data.Body.Blocks {
		if !util.IsOciTagBlock(block) {
			tmp = append(tmp, block)
			continue
		}
		parts := strings.Split(block.Attributes[constants.AttributeDigestRef], ".")
		if len(parts) != 3 || parts[0] != constants.TfTypeModule || parts[2] != constants.OutputNameImageRef {
			continue
		}
		publisherModuleName = parts[1]
		dependsOn = block.Attributes[constants.AttributeDependsOn]
	}
	if dependsOn == "" || publisherModuleName == "" {
		return fmt.Errorf("unable to extract the correct publisher invocation")
	}
	tmp = append(tmp, tq.TerraformFileBlock{
		Type:   constants.TfTypeModule,
		Labels: []string{path.Base(constants.TfLibTagger)},
		Attributes: map[string]string{
			constants.AttributeDependsOn: dependsOn,
			constants.AttributeSource:    util.QuoteTQString(constants.TfLibTagger),
			constants.AttributeTags:      fmt.Sprintf("%s.%s.%s", constants.TfTypeModule, publisherModuleName, constants.OutputNameLatestTagMap),
		},
	})
	data.Body.Blocks = tmp
	return nil
}
