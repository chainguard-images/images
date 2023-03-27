package commands

import (
	"encoding/json"
	"fmt"
	"sort"
	"strings"

	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/images"
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
			impl := &matrixImpl{
				TestTags:      mo.TestTags,
				ModifiedFiles: mo.ModifiedFiles,
				MelangeMode:   mo.MelangeMode,
				UniqueImages:  mo.UniqueImages,
			}
			return impl.Do()
		},
	}
	mo.AddFlags(cmd)
	return cmd
}

type matrixImpl struct {
	TestTags      string
	ModifiedFiles string
	MelangeMode   string
	UniqueImages  bool
}

type matrixResponse struct {
	Include []images.Image `json:"include"`
}

type imageSummaryTagDynamic struct {
	Package  string   `json:"package"`
	Prefix   string   `json:"prefix"`
	Suffix   string   `json:"suffix"`
	Exclude  []string `json:"exclude"`
	Resolved []string `json:"resolved"`
}

type imageSummaryTag struct {
	Primary string                 `json:"primary"`
	Static  []string               `json:"static"`
	Dynamic imageSummaryTagDynamic `json:"dynamic"`
}

type imageSummary struct {
	Ref    string            `json:"ref"`
	Status string            `json:"status"`
	Tags   []imageSummaryTag `json:"tags"`
}

func (i *matrixImpl) Do() error {
	testTags := []string{}
	if i.TestTags != "" {
		testTags = strings.Split(i.TestTags, "")
	}
	allImages, err := images.ListAll(images.WithTestTags(testTags))
	if err != nil {
		return err
	}

	// Filter for only images affected by this change
	if i.ModifiedFiles != "" {
		includeImages := map[string]bool{}
		modifiedFiles := strings.Split(i.ModifiedFiles, ",")
		for _, filename := range modifiedFiles {
			// If any changes detected in .github/ or monopod/, must build all
			if strings.HasPrefix(filename, fmt.Sprintf("%s/", constants.GithubActionsDirName)) ||
				strings.HasPrefix(filename, fmt.Sprintf("%s/", constants.MonopodDirName)) {
				break
			}
			if strings.HasPrefix(filename, fmt.Sprintf("%s/", constants.ImagesDirName)) {
				includeImages[strings.Split(filename, "/")[1]] = true
			}
		}
		if len(includeImages) > 0 {
			allImagesNew := []images.Image{}
			for _, image := range allImages {
				if _, ok := includeImages[image.ImageName]; ok {
					allImagesNew = append(allImagesNew, image)
				}
			}
			allImages = allImagesNew
		}
	}

	// Exclude ("none") or isolate ("only") custom melange builds
	if i.MelangeMode == "only" || i.MelangeMode == "none" {
		allImagesNew := []images.Image{}
		for _, image := range allImages {
			if (image.MelangeConfig != "" && i.MelangeMode == "only") ||
				(image.MelangeConfig == "" && i.MelangeMode == "none") {
				allImagesNew = append(allImagesNew, image)
			}
		}
		allImages = allImagesNew
	}

	// Return a different type of structure if --unique-images is provided,
	// designed specifically for getting dynamic list of tags later
	if i.UniqueImages {
		uniqueRef := map[string]string{}
		uniqueStatus := map[string]string{}
		uniqueTags := map[string][]imageSummaryTag{}
		for _, image := range allImages {
			if _, ok := uniqueTags[image.ImageName]; !ok {
				uniqueTags[image.ImageName] = []imageSummaryTag{}
			}
			static := []string{}
			if image.ApkoAdditionalTags != "" {
				static = strings.Split(image.ApkoAdditionalTags, ",")
			}
			exclude := []string{}
			for _, x := range strings.Split(image.ExcludeTags, ",") {
				t := image.ApkoPackageVersionTagPrefix + x + image.ApkoTargetTagSuffix
				if t != "" && t != image.ApkoTargetTagSuffix {
					exclude = append(exclude, t)
				}
			}
			uniqueTags[image.ImageName] = append(uniqueTags[image.ImageName], imageSummaryTag{
				Primary: image.ApkoTargetTag,
				Static:  static,
				Dynamic: imageSummaryTagDynamic{
					Package:  image.ApkoPackageVersionTag,
					Prefix:   image.ApkoPackageVersionTagPrefix,
					Suffix:   image.ApkoTargetTagSuffix,
					Exclude:  exclude,
					Resolved: []string{},
				},
			})
			uniqueRef[image.ImageName] = strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1)
			uniqueStatus[image.ImageName] = image.ImageStatus
		}
		keys := []string{}
		for k := range uniqueTags {
			keys = append(keys, k)
		}
		sort.Slice(keys, func(i, j int) bool {
			return keys[i] < keys[j]
		})
		tmp := []images.Image{}
		for _, k := range keys {
			summary := imageSummary{
				Status: uniqueStatus[k],
				Ref:    uniqueRef[k],
				Tags:   uniqueTags[k],
			}
			b, err := json.Marshal(&summary)
			if err != nil {
				return err
			}
			tmp = append(tmp, images.Image{
				ImageName:        k,
				ImageSummaryJson: string(b),
				ApkoBaseTag:      uniqueRef[k],
			})
		}
		allImages = tmp

		// Ensure no duplicate refs so images do not overwrite each other
		seen := map[string]bool{}
		for _, image := range allImages {
			ref := image.ApkoBaseTag
			if _, ok := seen[ref]; ok {
				return fmt.Errorf("duplicate entry for ref %s", ref)
			}
			seen[ref] = true
		}
	}

	response := matrixResponse{Include: allImages}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
