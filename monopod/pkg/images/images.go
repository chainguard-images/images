package images

import (
	"fmt"
	"os"
	"path"
	"path/filepath"
	"strings"

	"gopkg.in/yaml.v3"

	"github.com/chainguard-images/images/monopod/pkg/constants"
)

type Image struct {
	ImageName                   string `json:"imageName"`
	MelangeConfig               string `json:"melangeConfig"`
	MelangeArchs                string `json:"melangeArchs"`
	MelangeTemplate             string `json:"melangeTemplate"`
	ApkoConfig                  string `json:"apkoConfig"`
	ApkoKeyringAppend           string `json:"apkoKeyringAppend"`
	ApkoAdditionalTags          string `json:"apkoAdditionalTags"`
	ApkoBaseTag                 string `json:"apkoBaseTag"`
	ApkoTargetTag               string `json:"apkoTargetTag"`
	ApkoPackageVersionTag       string `json:"apkoPackageVersionTag"`
	ApkoPackageVersionTagPrefix string `json:"apkoPackageVersionTagPrefix"`
	TestCommand                 string `json:"testCommand"`
}

type ImageManifest struct {
	Registry string                 `yaml:"registry"`
	Variants []ImageManifestVariant `yaml:"versions"`
}

type ImageManifestVariant struct {
	Apko ImageManifestVariantApko `yaml:"apko"`
}

type ImageManifestVariantApko struct {
	Config          string                                  `yaml:"config"`
	ExtractTagsFrom ImageManifestVariantApkoExtractTagsFrom `yaml:"extractTagsFrom"`
	Tags            []string                                `yaml:"tags"`
}

type ImageManifestVariantApkoExtractTagsFrom struct {
	Package string `yaml:"package"`
	Prefix  string `yaml:"prefix"`
}

func ListAll() ([]Image, error) {
	allImages := []Image{}
	imageDirs, err := os.ReadDir(constants.ImagesDirName)
	if err != nil {
		return nil, err
	}
	seen := map[string]bool{}
	for _, imageDir := range imageDirs {
		if !imageDir.IsDir() {
			continue
		}
		imageName := imageDir.Name()
		imageManifestFilename := filepath.Join(constants.ImagesDirName, imageName, constants.ImageManifestFilename)
		b, err := os.ReadFile(imageManifestFilename)
		if err != nil {
			return nil, err
		}
		var m ImageManifest
		if err := yaml.Unmarshal(b, &m); err != nil {
			return nil, err
		}
		for _, variant := range m.Variants {
			apkoConfig := filepath.Join(constants.ImagesDirName, imageName, variant.Apko.Config)
			apkoTargetTag := strings.Split(filepath.Base(apkoConfig), ".")[0]
			apkoAdditionalTags := strings.Join(variant.Apko.Tags, ",")

			// Ensure that we dont have duplicate entries for any image/variant combo
			seenKey := fmt.Sprintf("%s--%s", imageName, apkoTargetTag)
			if _, ok := seen[seenKey]; ok {
				return nil, fmt.Errorf("more than one variant with image=%s tag=%s", imageName, apkoTargetTag)
			}
			seen[seenKey] = true

			testCommand := ""
			testScriptFilename := filepath.Join(constants.ImagesDirName, imageName, constants.DefaultTestScriptFilename)
			if _, err := os.Stat(testScriptFilename); err == nil {
				testCommand = testScriptFilename
			}

			var apkoBaseTag string
			if m.Registry != "" {
				apkoBaseTag = path.Join(m.Registry, imageName)
			} else {
				apkoBaseTag = path.Join(constants.DefaultRegistry, imageName)
			}

			i := Image{
				ImageName:                   imageName,
				MelangeConfig:               "", // TODO
				MelangeArchs:                "", // TODO
				MelangeTemplate:             "", // TODO
				ApkoConfig:                  apkoConfig,
				ApkoKeyringAppend:           "", // TODO
				ApkoBaseTag:                 apkoBaseTag,
				ApkoTargetTag:               apkoTargetTag,
				ApkoAdditionalTags:          apkoAdditionalTags,
				ApkoPackageVersionTag:       variant.Apko.ExtractTagsFrom.Package,
				ApkoPackageVersionTagPrefix: variant.Apko.ExtractTagsFrom.Prefix,
				TestCommand:                 testCommand,
			}
			allImages = append(allImages, i)
		}
	}
	return allImages, nil
}
