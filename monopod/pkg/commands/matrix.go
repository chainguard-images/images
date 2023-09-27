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
				ModifiedFiles:   mo.ModifiedFiles,
				UniqueImages:    mo.UniqueImages,
				Shard:           mo.Shard,
				ShardingFactor:  mo.ShardingFactor,
				DefaultRegistry: mo.DefaultRegistry,
			}
			return impl.Do()
		},
	}
	mo.AddFlags(cmd)
	return cmd
}

type matrixImpl struct {
	ModifiedFiles   string
	UniqueImages    bool
	Shard           uint
	ShardingFactor  uint
	DefaultRegistry string
}

type matrixResponse struct {
	Include []string `json:"include"`
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
			allImagesNew := []string{}
			for _, image := range allImages {
				if _, ok := includeImages[image]; ok {
					allImagesNew = append(allImagesNew, image)
				}
			}
			allImages = allImagesNew
		}
	}

	if i.ShardingFactor > 1 {
		shards := make([][]string, i.ShardingFactor)
		for idx, img := range allImages {
			idx = idx % int(i.ShardingFactor)
			shards[idx] = append(shards[idx], img)
		}
		// Return the shard the user has selected.
		allImages = shards[i.Shard]
	}

	if len(allImages) > 256 {
		return fmt.Errorf("matrix exceeds the limits of github actions (%d > 256), use sharding flags or increase sharding factor", len(allImages))
	}

	response := matrixResponse{Include: allImages}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
