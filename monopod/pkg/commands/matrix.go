package commands

import (
	"encoding/json"
	"fmt"
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

	response := matrixResponse{Include: allImages}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
