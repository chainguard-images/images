package commands

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"github.com/spf13/cobra"
	"gopkg.in/yaml.v3"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
)

const (
	ImagesDirName         = "images"
	ImageManifestFilename = "image.yaml"
)

func Matrix() *cobra.Command {
	mo := &options.MatrixOptions{}
	cmd := &cobra.Command{
		Use:   "matrix",
		Short: "Get the build matrix dynamically from the repo.",
		Example: `
monopod matrix
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &matrixImpl{}
			return impl.Do()
		},
	}
	mo.AddFlags(cmd)
	return cmd
}

type matrixImpl struct{}

type matrixResponse struct {
	Include []matrixResponseInclude `json:"include"`
}
type matrixResponseInclude struct {
	ImageName                   string `json:"imageName"`
	MelangeConfig               string `json:"melangeConfig"`
	MelangeArchs                string `json:"melangeArchs"`
	MelangeTemplate             string `json:"melangeTemplate"`
	ApkoConfig                  string `json:"apkoConfig"`
	ApkoKeyringAppend           string `json:"apkoKeyringAppend"`
	ApkoAdditionalTags          string `json:"apkoAdditionalTags"`
	ApkoTargetTag               string `json:"apkoTargetTag"`
	ApkoPackageVersionTag       string `json:"apkoPackageVersionTag"`
	ApkoPackageVersionTagPrefix string `json:"apkoPackageVersionTagPrefix"`
}

type imageManifest struct {
	Versions []imageManifestVersion `yaml:"versions"`
}

type imageManifestVersion struct {
	Apko imageManifestVersionApko `yaml:"apko"`
}

type imageManifestVersionApko struct {
	Config          string                                  `yaml:"config"`
	ExtractTagsFrom imageManifestVersionApkoExtractTagsFrom `yaml:"extractTagsFrom"`
	Tags            []string                                `yaml:"tags"`
}

type imageManifestVersionApkoExtractTagsFrom struct {
	Package string `yaml:"package"`
	Prefix  string `yaml:"prefix"`
}

func (i *matrixImpl) Do() error {
	combos := []matrixResponseInclude{}
	imageDirs, err := os.ReadDir(ImagesDirName)
	if err != nil {
		return err
	}
	for _, imageDir := range imageDirs {
		if !imageDir.IsDir() {
			continue
		}
		imageName := imageDir.Name()
		imageManifestFilename := filepath.Join(ImagesDirName, imageName, ImageManifestFilename)
		b, err := os.ReadFile(imageManifestFilename)
		if err != nil {
			return err
		}
		var m imageManifest
		if err := yaml.Unmarshal(b, &m); err != nil {
			return err
		}
		for _, version := range m.Versions {
			apkoConfig := filepath.Join(ImagesDirName, imageName, version.Apko.Config)
			apkoTargetTag := strings.Split(filepath.Base(apkoConfig), ".")[0]
			apkoAdditionalTags := strings.Join(version.Apko.Tags, ",")
			i := matrixResponseInclude{
				ImageName:                   imageName,
				MelangeConfig:               "", // TODO
				MelangeArchs:                "", // TODO
				MelangeTemplate:             "", // TODO
				ApkoConfig:                  apkoConfig,
				ApkoKeyringAppend:           "", // TODO
				ApkoTargetTag:               apkoTargetTag,
				ApkoAdditionalTags:          apkoAdditionalTags,
				ApkoPackageVersionTag:       version.Apko.ExtractTagsFrom.Package,
				ApkoPackageVersionTagPrefix: version.Apko.ExtractTagsFrom.Prefix,
			}
			combos = append(combos, i)
		}
	}
	response := matrixResponse{Include: combos}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
