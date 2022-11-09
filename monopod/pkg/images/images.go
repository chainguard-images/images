package images

import (
	"os"
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
	ApkoTargetTag               string `json:"apkoTargetTag"`
	ApkoPackageVersionTag       string `json:"apkoPackageVersionTag"`
	ApkoPackageVersionTagPrefix string `json:"apkoPackageVersionTagPrefix"`
}

type ImageManifest struct {
	Versions []ImageManifestVersion `yaml:"versions"`
}

type ImageManifestVersion struct {
	Apko ImageManifestVersionApko `yaml:"apko"`
}

type ImageManifestVersionApko struct {
	Config          string                                  `yaml:"config"`
	ExtractTagsFrom ImageManifestVersionApkoExtractTagsFrom `yaml:"extractTagsFrom"`
	Tags            []string                                `yaml:"tags"`
}

type ImageManifestVersionApkoExtractTagsFrom struct {
	Package string `yaml:"package"`
	Prefix  string `yaml:"prefix"`
}

func ListAll() ([]Image, error) {
	allImages := []Image{}
	imageDirs, err := os.ReadDir(constants.ImagesDirName)
	if err != nil {
		return nil, err
	}
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
		for _, version := range m.Versions {
			apkoConfig := filepath.Join(constants.ImagesDirName, imageName, version.Apko.Config)
			apkoTargetTag := strings.Split(filepath.Base(apkoConfig), ".")[0]
			apkoAdditionalTags := strings.Join(version.Apko.Tags, ",")
			i := Image{
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
			allImages = append(allImages, i)
		}
	}
	return allImages, nil
}
