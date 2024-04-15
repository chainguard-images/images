package image

import (
	"fmt"
	"log"
	"path/filepath"
	"sort"
	"strings"

	"github.com/jdolitsky/tq/pkg/tq"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
)

// GeneratorImage01Outputs adds the "summary" output in each image
// (excluding ones that do not use publisher)
type GeneratorImage01Outputs struct{}

type publisher struct {
	PublisherName string
	ForEach       string
}

func (g *GeneratorImage01Outputs) Generate(dir string, _, _ []string, data *tq.TerraformFile) error {
	tfFiles, err := util.LoadAllTerraformFilesInDir(dir)
	if err != nil {
		return nil
	}

	publish := map[string]publisher{}
	publisherNames := []string{}

	// Get all invocations of the "publisher" tflib
	for _, tfFile := range tfFiles {
		for _, block := range tfFile.Body.Blocks {
			if block.Type != constants.TfTypeModule {
				continue
			}

			if len(block.Labels) == 0 {
				continue
			}
			n := block.Labels[0]

			source, hasSourceAttr := block.Attributes[constants.AttributeSource]
			if !hasSourceAttr {
				continue
			}

			// These come the form: source = "../../tflib/publisher"
			// Just check source ends with "/publisher"
			if !strings.HasSuffix(util.UnquoteTQString(source), fmt.Sprintf("/%s", constants.AttributePublisher)) {
				continue
			}

			publisherName, hasNameAttr := block.Attributes[constants.AttributeName]
			if !hasNameAttr {
				log.Printf("WARN [image:%s] no %s attribute on publisher %s, skipping\n", filepath.Base(dir), constants.AttributeName, n)
				continue
			}

			publish[n] = publisher{
				PublisherName: publisherName,
				ForEach:       block.Attributes[constants.AttributeForEach],
			}
			publisherNames = append(publisherNames, n)
		}
	}

	numPublishers := len(publisherNames)
	if numPublishers == 0 {
		log.Printf("WARN [image:%s] no usage of publisher, skipping\n", filepath.Base(dir))
		return nil
	}

	// Ensure generated output is deterministic
	sort.Strings(publisherNames)

	parts := []string{}
	for _, n := range publisherNames {
		p := publish[n]
		if p.ForEach != "" {
			parts = append(parts, fmt.Sprintf(`
			{
				for k, v in %s.%s : k => {
					"ref" = v.image_ref
					"config" = v.config
					"tags" = v.tag_list
				}
			}`, constants.TfTypeModule, n))
		} else {
			parts = append(parts, fmt.Sprintf(`
			{
				%[1]s = {
					"ref" = %[2]s.%[3]s.image_ref
					"config" = %[2]s.%[3]s.config
					"tags" = %[2]s.%[3]s.tag_list
				}
			}`, p.PublisherName, constants.TfTypeModule, n))
		}
	}

	// This merges every publisher output block into a single block based on its
	// keys, which should be unique for each publisher block
	val := fmt.Sprintf("merge(%s)", strings.Join(parts, ", "))

	data.Body.Blocks = append(data.Body.Blocks, tq.TerraformFileBlock{
		Type:   constants.TfTypeOutput,
		Labels: []string{constants.OutputNameSummary},
		Attributes: map[string]string{
			constants.AttributeValue: val,
		},
	})

	return nil
}
