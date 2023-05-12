package images

import (
	"fmt"
	"io/fs"
	"io/ioutil"
	"os"
	"path"
	"path/filepath"
	"strings"

	"gopkg.in/yaml.v3"

	"github.com/chainguard-images/images/monopod/pkg/constants"
)

type Image struct {
	ImageName                   string `json:"imageName"`
	ImageStatus                 string `json:"imageStatus"`
	ImageSummaryJson            string `json:"imageSummaryJson"`
	MelangeConfig               string `json:"melangeConfig"`
	MelangeArchs                string `json:"melangeArchs"`
	MelangeTemplate             string `json:"melangeTemplate"`
	MelangeEmptyWorkspace       bool   `json:"melangeEmptyWorkspace"`
	MelangeWorkdir              string `json:"melangeWorkdir"`
	ApkoConfig                  string `json:"apkoConfig"`
	ApkoKeyringAppend           string `json:"apkoKeyringAppend"`
	ApkoRepositoryAppend        string `json:"apkoRepositoryAppend"`
	ApkoAdditionalTags          string `json:"apkoAdditionalTags"`
	ApkoBaseTag                 string `json:"apkoBaseTag"`
	ApkoTargetTag               string `json:"apkoTargetTag"`
	ApkoTargetTagSuffix         string `json:"apkoTargetTagSuffix"`
	ApkoPackageVersionTag       string `json:"apkoPackageVersionTag"`
	ApkoPackageVersionTagPrefix string `json:"apkoPackageVersionTagPrefix"`
	ApkoBuildOptions            string `json:"apkoBuildOptions"`
	TestCommandExe              string `json:"testCommandExe"`
	TestCommandDir              string `json:"testCommandDir"`
	ExcludeTags                 string `json:"excludeTags"`
	UseTerraform                bool   `json:"useTerraform"`
	ExcludeContact              bool   `json:"-"`
}

type ImageManifest struct {
	Ref            string                 `yaml:"ref"`
	Status         string                 `yaml:"status"`
	ExcludeContact bool                   `yaml:"excludeContact"`
	Terraform      bool                   `yaml:"terraform"`
	Variants       []ImageManifestVariant `yaml:"versions"`
}

type ImageManifestVariant struct {
	Apko    ImageManifestVariantApko    `yaml:"apko"`
	Melange ImageManifestVariantMelange `yaml:"melange"`
}

type ImageManifestVariantApko struct {
	Config          string                                  `yaml:"config"`
	Options         []string                                `yaml:"options"`
	ExtractTagsFrom ImageManifestVariantApkoExtractTagsFrom `yaml:"extractTagsFrom"`
	Tags            []string                                `yaml:"tags"`
	Subvariants     []ImageManifestVariantApkoSubvariant    `yaml:"subvariants"`
}

type ImageManifestVariantApkoSubvariant struct {
	Suffix  string   `yaml:"suffix"`
	Options []string `yaml:"options"`
}

type ImageManifestVariantMelange struct {
	Configs []string `yaml:"configs"`
	Mount   bool     `yaml:"mount"`
}

type ImageManifestVariantApkoExtractTagsFrom struct {
	Package string   `yaml:"package"`
	Prefix  string   `yaml:"prefix"`
	Exclude []string `yaml:"exclude"`
}

// Our miniature schema of the Apko manifest so we dont have to import it here
type ApkoManifest struct {
	Archs []string `yaml:"archs"`
}

type variantIterator struct {
	Variant    ImageManifestVariant
	Subvariant ImageManifestVariantApkoSubvariant
}

type (
	listConfig struct {
		TestTags []string
	}

	ListOption func(c *listConfig)
)

func WithTestTags(testTags []string) ListOption {
	return func(c *listConfig) {
		c.TestTags = testTags
	}
}

func ListAll(opts ...ListOption) ([]Image, error) {
	config := &listConfig{
		TestTags: []string{},
	}
	for _, opt := range opts {
		opt(config)
	}
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
		imageStatus := m.Status
		if imageStatus == "" {
			imageStatus = constants.DefaultImageStatus
		}
		imageExcludeContact := m.ExcludeContact
		variants := []variantIterator{}
		for _, variant := range m.Variants {
			variants = append(variants, variantIterator{
				Variant: variant,
			})
			for _, subvariant := range variant.Apko.Subvariants {
				variants = append(variants, variantIterator{
					Variant:    variant,
					Subvariant: subvariant,
				})
			}
		}
		for _, iterator := range variants {
			variant := iterator.Variant
			subvariant := iterator.Subvariant
			apkoConfig := filepath.Join(constants.ImagesDirName, imageName, variant.Apko.Config)
			apkoTargetTag := strings.Replace(filepath.Base(apkoConfig), constants.ApkoYamlFileExtension, "", 1)
			apkoAdditionalTags := strings.Join(variant.Apko.Tags, ",")
			apkoTargetTagSuffix := ""
			apkoBuildOptions := strings.Join(iterator.Variant.Apko.Options, ",")
			if subvariant.Suffix != "" {
				apkoTargetTag = apkoTargetTag + subvariant.Suffix
				apkoTargetTagSuffix = subvariant.Suffix
				if apkoBuildOptions != "" {
					apkoBuildOptions = strings.Join([]string{apkoBuildOptions, strings.Join(subvariant.Options, ",")}, ",")
				} else {
					apkoBuildOptions = strings.Join(subvariant.Options, ",")
				}
			}

			// Ensure that we dont have duplicate entries for any image/variant combo
			seenKey := fmt.Sprintf("%s--%s", imageName, apkoTargetTag)
			if _, ok := seen[seenKey]; ok {
				return nil, fmt.Errorf("more than one variant with image=%s tag=%s", imageName, apkoTargetTag)
			}
			seen[seenKey] = true

			testCommandExe := ""
			testCommandDir := ""
			testScriptFilename := filepath.Join(constants.ImagesDirName, imageName, constants.DefaultTestScriptFilename)
			testScriptsDirname := filepath.Join(constants.ImagesDirName, imageName, constants.DefaultTestDirname)
			runScripts := []string{}
			if _, err := os.Stat(testScriptsDirname); err == nil {
				// For loop to run all the .sh files found in the tests/ directory
				testCommandDir = filepath.Join(constants.ImagesDirName, imageName)
				err := filepath.WalkDir(filepath.Join(testCommandDir, constants.DefaultTestDirname), func(path string, d fs.DirEntry, err error) error {
					if d.IsDir() {
						return nil
					}
					entry := fmt.Sprintf("./%s", filepath.Join(constants.DefaultTestDirname, filepath.Base(path)))
					runScripts = append(runScripts, entry)
					return nil
				})
				if err != nil {
					return nil, err
				}
			} else if _, err := os.Stat(testScriptFilename); err == nil {
				testCommandDir = filepath.Join(constants.ImagesDirName, imageName)
				runScripts = []string{fmt.Sprintf("./%s", constants.DefaultTestScriptFilename)}
			}

			tmp := []string{}
			for _, runScript := range runScripts {
				path := filepath.Join(testCommandDir, runScript)
				b, err := ioutil.ReadFile(path)
				if err != nil {
					return nil, err
				}
				s := string(b)
				if len(config.TestTags) > 0 {
					for _, tag := range config.TestTags {
						if strings.Contains(s, fmt.Sprintf("monopod:tag:%s", tag)) {
							tmp = append(tmp, runScript)
							break
						}
					}
					// If no test tags set, but this test has one, exclude it
				} else if !strings.Contains(s, "monopod:tag:") {
					tmp = append(tmp, runScript)
				}
			}
			runScripts = tmp
			if len(runScripts) == 0 {
				// If no test files match tags, skip this variant
				continue
			}
			testCommandExe = fmt.Sprintf("(set -ex; %s)", strings.Join(runScripts, " && "))

			var apkoBaseTag string
			if m.Ref != "" {
				apkoBaseTag = m.Ref
			} else {
				apkoBaseTag = path.Join(constants.DefaultRegistry, imageName)
			}

			melangeConfig := ""
			melangeArchs := ""
			apkoKeyringAppend := ""
			apkoRepositoryAppend := ""

			// If non-empty workspace for melange build, specify
			// the image dir as the workdir for melange build
			melangeWorkdir := ""
			melangeEmptyWorkspace := true
			if variant.Melange.Mount {
				melangeEmptyWorkspace = false
				melangeWorkdir = filepath.Join(constants.ImagesDirName, imageName)
			}

			melangeConfigs := variant.Melange.Configs
			if len(melangeConfigs) > 0 {
				apkoKeyringAppend = constants.DefaultApkoKeyringAppend
				apkoRepositoryAppend = constants.DefaultApkoRepositoryAppend
				var a ApkoManifest
				b, err := os.ReadFile(apkoConfig)
				if err != nil {
					return nil, err
				}
				if err := yaml.Unmarshal(b, &a); err != nil {
					return nil, err
				}
				melangeArchs = strings.Join(a.Archs, ",")
				tmp := []string{}
				for _, config := range melangeConfigs {
					if melangeEmptyWorkspace {
						tmp = append(tmp, filepath.Join(constants.ImagesDirName, imageName, config))
					} else {
						tmp = append(tmp, config)
					}
				}
				melangeConfig = strings.Join(tmp, ",")
			}

			useTerraform := m.Terraform

			i := Image{
				ImageName:                   imageName,
				ImageStatus:                 imageStatus,
				ImageSummaryJson:            "",
				MelangeConfig:               melangeConfig, // TODO
				MelangeArchs:                melangeArchs,  // TODO
				MelangeTemplate:             "",            // TODO
				MelangeEmptyWorkspace:       melangeEmptyWorkspace,
				MelangeWorkdir:              melangeWorkdir,
				ApkoConfig:                  apkoConfig,
				ApkoKeyringAppend:           apkoKeyringAppend,
				ApkoRepositoryAppend:        apkoRepositoryAppend,
				ApkoBaseTag:                 apkoBaseTag,
				ApkoTargetTag:               apkoTargetTag,
				ApkoTargetTagSuffix:         apkoTargetTagSuffix,
				ApkoAdditionalTags:          apkoAdditionalTags,
				ApkoPackageVersionTag:       variant.Apko.ExtractTagsFrom.Package,
				ApkoPackageVersionTagPrefix: variant.Apko.ExtractTagsFrom.Prefix,
				ApkoBuildOptions:            apkoBuildOptions,
				TestCommandExe:              testCommandExe,
				TestCommandDir:              testCommandDir,
				ExcludeTags:                 strings.Join(variant.Apko.ExtractTagsFrom.Exclude, ","),
				UseTerraform:                useTerraform,
				ExcludeContact:              imageExcludeContact,
			}
			allImages = append(allImages, i)
		}
	}
	return allImages, nil
}
