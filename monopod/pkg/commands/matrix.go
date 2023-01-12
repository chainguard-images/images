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
	ModifiedFiles string
	MelangeMode   string
	UniqueImages  bool
}

type matrixResponse struct {
	Include []images.Image `json:"include"`
}

func (i *matrixImpl) Do() error {
	allImages, err := images.ListAll()
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
		uniqueKeys := map[string][]string{}
		for _, image := range allImages {
			if _, ok := uniqueKeys[image.ImageName]; !ok {
				uniqueKeys[image.ImageName] = []string{}
			}
			additionalTags := []string{}
			if image.ApkoAdditionalTags != "" {
				additionalTags = strings.Split(image.ApkoAdditionalTags, ",")
			}
			if image.ApkoPackageVersionTag != "" {
				additionalTags = append(additionalTags, fmt.Sprintf("EXTRACT_%s_%s", image.ApkoPackageVersionTagPrefix, image.ApkoPackageVersionTag))
			}
			uniqueKeys[image.ImageName] = append(uniqueKeys[image.ImageName],
				fmt.Sprintf("%s[%s]", image.ApkoTargetTag, strings.Join(additionalTags, ",")))
			uniqueRef[image.ImageName] = strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1)
			uniqueStatus[image.ImageName] = image.Status
		}
		keys := []string{}
		for k := range uniqueKeys {
			keys = append(keys, k)
		}
		sort.Slice(keys, func(i, j int) bool {
			return keys[i] < keys[j]
		})
		tmp := []images.Image{}
		for _, k := range keys {
			tmp = append(tmp, images.Image{
				ImageName:          k,
				ApkoBaseTag:        uniqueRef[k],
				ApkoAdditionalTags: strings.Join(uniqueKeys[k], ","),
				Status:             uniqueStatus[k],
			})
		}
		allImages = tmp
	}

	response := matrixResponse{Include: allImages}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
