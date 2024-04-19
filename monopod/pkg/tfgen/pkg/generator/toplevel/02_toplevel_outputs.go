package toplevel

import (
	"fmt"
	"os"
	"path"
	"slices"
	"sort"

	"github.com/jdolitsky/tq/pkg/tq"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
)

// GeneratorToplevel02Outputs adds a "summary_<name>" output for each
// image with a "summary" output at the toplevel
type GeneratorToplevel02Outputs struct{}

func (g *GeneratorToplevel02Outputs) Generate(dir string, skip, only []string, data *tq.TerraformFile) error {
	imagesDirname := path.Join(dir, constants.ImagesDirname)
	entries, err := os.ReadDir(imagesDirname)
	if err != nil {
		return err
	}

	// Get list of all submodule invocation names
	submoduleNames := []string{}

	for _, entry := range entries {
		submoduleName := entry.Name()
		if !entry.IsDir() || submoduleName == constants.TemplateDirname {
			continue
		}

		if slices.Contains(skip, submoduleName) {
			continue
		}
		if len(only) > 0 && !slices.Contains(only, submoduleName) {
			continue
		}

		subdir := path.Join(dir, constants.ImagesDirname, submoduleName)
		submodTfFiles, err := util.LoadAllTerraformFilesInDir(subdir)
		if err != nil {
			return nil
		}
		if len(submodTfFiles) == 0 {
			return fmt.Errorf("unexpectedly found no .tf files in %s", subdir)
		}

		if summaryOutputExists(submodTfFiles) {
			submoduleNames = append(submoduleNames, submoduleName)
		}
	}

	// Sort them to ensure deterministic output
	sort.Strings(submoduleNames)

	// Unexepcted if we do not find multiple submodules in the top-level
	if num := len(submoduleNames); num <= 1 {
		return fmt.Errorf("expected at least 2 submodules, instead got %d", num)
	}

	// Add an output for each submodule with the name in form "summary_<name>"
	for _, n := range submoduleNames {
		output := fmt.Sprintf("%s_%s", constants.OutputNameSummary, n)
		value := fmt.Sprintf("%s.%s.%s", constants.TfTypeModule, n, constants.OutputNameSummary)
		data.Body.Blocks = append(data.Body.Blocks, tq.TerraformFileBlock{
			Type:   constants.TfTypeOutput,
			Labels: []string{output},
			Attributes: map[string]string{
				constants.AttributeValue: value,
			},
		})
	}

	return nil
}

// Make sure that a "summary" output is present in the submodule
// before appending this submodule to the list
func summaryOutputExists(submoduleTfFiles map[string]*tq.TerraformFile) bool {
	for _, tfFile := range submoduleTfFiles {
		for _, b := range tfFile.Body.Blocks {
			if b.Type == constants.TfTypeOutput && len(b.Labels) > 0 && b.Labels[0] == constants.OutputNameSummary {
				return true
			}
		}
	}
	return false
}
