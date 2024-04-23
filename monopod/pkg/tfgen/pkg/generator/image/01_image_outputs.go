package image

import (
	"encoding/json"
	"fmt"
	"path/filepath"
	"slices"
	"sort"
	"strings"

	"github.com/jdolitsky/tq/pkg/tq"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
)

type publisher struct {
	NameAttr    string
	ForEachAttr string
	Tags        []string
}

// GeneratorImage01Outputs and GeneratorImage01OutputsVersioned
// add the "summary" output in each image
// (excluding ones that do not use publisher)
type GeneratorImage01Outputs struct{}
type GeneratorImage01OutputsVersioned struct{}

func (g *GeneratorImage01Outputs) Generate(dir string, skip, only []string, data *tq.TerraformFile) error {
	return generate(false, dir, skip, only, data)
}

func (g *GeneratorImage01OutputsVersioned) Generate(dir string, skip, only []string, data *tq.TerraformFile) error {
	return generate(true, dir, skip, only, data)
}

func generate(versioned bool, dir string, skip, only []string, data *tq.TerraformFile) error {
	submoduleName := filepath.Base(dir)
	if slices.Contains(skip, submoduleName) {
		return nil
	}
	if len(only) > 0 && !slices.Contains(only, submoduleName) {
		return nil
	}

	tfFiles, err := util.LoadAllTerraformFilesInDirNoGenerated(dir)
	if err != nil {
		return nil
	}

	publish := map[string]publisher{}
	publisherNames := []string{}

	// Get all invocations of the "publisher" tflib
	for _, tfFile := range tfFiles {
		for _, block := range tfFile.Body.Blocks {
			if !util.IsPublisherBlock(block) {
				continue
			}
			n := block.Labels[0]
			tags := []string{}
			if !versioned {
				tags = getTagsPushedByPublisher(tfFiles, n)
			}
			publish[n] = publisher{
				NameAttr:    block.Attributes[constants.AttributeName],
				ForEachAttr: block.Attributes[constants.AttributeForEach],
				Tags:        tags,
			}
			publisherNames = append(publisherNames, n)
		}
	}

	numPublishers := len(publisherNames)
	if numPublishers == 0 {
		return nil
	}

	// Ensure generated output is deterministic
	sort.Strings(publisherNames)

	parts := []string{}
	for _, n := range publisherNames {
		p := publish[n]
		if p.ForEachAttr != "" {
			parts = append(parts, foreachSummary(n, p.Tags))
		} else {
			parts = append(parts, singleSummary(p.NameAttr, n, p.Tags))
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

// If we are not versioning the image,
// lookup all instances of "oci_tag", and get a combined
// list of everything using image_ref output from publisher
func getTagsPushedByPublisher(tfFiles map[string]*tq.TerraformFile, n string) []string {
	tags := []string{}
	for _, tfFile := range tfFiles {
		for _, block := range tfFile.Body.Blocks {
			if !util.IsOciTagBlock(block) {
				continue
			}
			ref, hasDigestRefAttr := block.Attributes[constants.AttributeDigestRef]
			if !hasDigestRefAttr {
				continue
			}

			// Ensure that the tag value is a string (starts with double quote)
			tag := block.Attributes[constants.AttributeTag]
			if !strings.HasPrefix(tag, `"`) {
				continue
			}

			match := fmt.Sprintf("%s.%s.%s", constants.TfTypeModule, n, constants.OutputNameImageRef)
			matchForEach := fmt.Sprintf("%s.%s[%s].%s", constants.TfTypeModule, n, constants.TfEachKey, constants.OutputNameImageRef)

			// In some instances, the for_each on the "oci_tag" invocation is
			// a hardcoded map. So we just check if the module might be part of that map
			customForEachMapHasMatch := strings.Contains(block.Attributes[constants.AttributeForEach], match)

			if ref == match || ref == matchForEach || customForEachMapHasMatch {
				tags = append(tags, util.UnquoteTQString(tag))
			}
		}
	}
	sort.Strings(tags)
	return tags
}

func foreachSummary(publisherName string, tags []string) string {
	t := tagsVal(tags, fmt.Sprintf("v.%s", constants.OutputNameTagList))
	return fmt.Sprintf(`
	{
		for k, v in %[1]s.%[2]s : k => {
			"ref" = v.image_ref
			"config" = v.config
			"tags" = %[3]s
		}
	}`, constants.TfTypeModule, publisherName, t)
}

func singleSummary(nameAttr string, publisherName string, tags []string) string {
	t := tagsVal(tags, fmt.Sprintf("%s.%s.%s", constants.TfTypeModule, publisherName, constants.OutputNameTagList))
	return fmt.Sprintf(`
	{
		%[1]s = {
			"ref" = %[2]s.%[3]s.image_ref
			"config" = %[2]s.%[3]s.config
			"tags" = %[4]s
		}
	}`, nameAttr, constants.TfTypeModule, publisherName, t)
}

func tagsVal(tags []string, defaultVal string) string {
	if len(tags) > 0 {
		v, _ := json.Marshal(tags)
		return string(v)
	}
	return defaultVal
}
