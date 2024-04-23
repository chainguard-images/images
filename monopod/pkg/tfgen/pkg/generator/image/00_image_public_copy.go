package image

import (
	"path"
	"path/filepath"
	"slices"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
	"github.com/jdolitsky/tq/pkg/tq"
)

// GeneratorImage00PublicCopy makes a copy of
// public image contents, with paths fixed
type GeneratorImage00PublicCopy struct {
	SourcePathPrefix string
}

func (g *GeneratorImage00PublicCopy) Generate(dir string, skip, only []string, data *tq.TerraformFile) error {
	submoduleName := filepath.Base(dir)
	if slices.Contains(skip, submoduleName) {
		return nil
	}
	if len(only) > 0 && !slices.Contains(only, submoduleName) {
		return nil
	}

	tfFiles, err := util.LoadAllTerraformFilesInDirNoGenerated(dir)
	if err != nil {
		return err
	}
	combined := util.CombineNoGenerated(tfFiles)
	publicImageToCopy := ""
	for _, block := range combined.Body.Blocks {
		if util.IsPublicCopyBlock(block) {
			publicImageToCopy = util.UnquoteTQString(block.Attributes[constants.AttributeImage])
			break
		}
	}

	if publicImageToCopy == "" {
		return nil
	}

	publicImageDir := filepath.Join(constants.PublicImagesRoot, publicImageToCopy)
	tfFiles, err = util.LoadAllTerraformFilesInDir(publicImageDir)
	if err != nil {
		return err
	}
	combined = util.Combine(tfFiles)
	for _, block := range combined.Body.Blocks {
		// Adjust the source paths appropriately
		v := block.Attributes[constants.AttributeSource]
		if block.Type == constants.TfTypeModule && !strings.Contains(v, constants.DetectTfLib) {
			source := util.QuoteTQString(path.Join(g.SourcePathPrefix, publicImageToCopy, util.UnquoteTQString(v)))
			block.Attributes[constants.AttributeSource] = source
		}
		// Copy over every block from the public image to copy
		data.Body.Blocks = append(data.Body.Blocks, block)
	}

	return nil
}
