package toplevel

import (
	"fmt"
	"os"
	"path"
	"slices"
	"strings"

	"github.com/jdolitsky/tq/pkg/tq"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
)

// GeneratorToplevel01Modules adds a module invocation
// for each image at the toplevel (excluding custom images, TODO)
type GeneratorToplevel01Modules struct{}

func (g *GeneratorToplevel01Modules) Generate(dir string, skip, only []string, data *tq.TerraformFile) error {
	imagesDirname := path.Join(dir, constants.ImagesDirname)
	entries, err := os.ReadDir(imagesDirname)
	if err != nil {
		return err
	}
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

		// TODO: support custom images
		if strings.HasPrefix(submoduleName, constants.CustomImagePrefix) {
			continue
		}

		attributes := map[string]string{
			constants.AttributeSource:           util.QuoteTQString(fmt.Sprintf("./%s/%s", constants.ImagesDirname, submoduleName)),
			constants.AttributeTargetRepository: util.QuoteTQString(fmt.Sprintf("${var.target_repository}/%s", submoduleName)),
		}

		// If the image is a New Relic one, pass in license key
		if strings.HasPrefix(submoduleName, constants.NewRelicImagePrefix) {
			attributes[constants.AttributeLicenseKey] = "var.newrelic_license_key"
		}

		// Scanner test needs providers
		if submoduleName == constants.ScannerTestImageName {
			attributes[constants.AttributeProviders] = `{
				apko.wolfi-baselayout-only-for-scanner-test = apko.wolfi-baselayout-only-for-scanner-test
			}`
		}

		data.Body.Blocks = append(data.Body.Blocks, tq.TerraformFileBlock{
			Type:       constants.TfTypeModule,
			Labels:     []string{submoduleName},
			Attributes: attributes,
		})
	}
	return nil
}
