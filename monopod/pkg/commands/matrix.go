package commands

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/spf13/cobra"
	"k8s.io/apimachinery/pkg/util/sets"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/images"
)

var (
	matrixBypassAllowlist = sets.New(
		constants.WithdrawImagesFileName,
		constants.WithdrawReposFileName,
	)
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
				Output:          os.Stdout,
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
	Output          io.Writer
	ModifiedFiles   string
	UniqueImages    bool
	Shard           uint
	ShardingFactor  uint
	DefaultRegistry string
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
		// Determine if this set of change can bypass the matrix and allow to return
		// an empty list.
		bypassAllowed := true
		includeImages := sets.New[string]()
		modifiedFiles := strings.Split(i.ModifiedFiles, ",")
		for _, filename := range modifiedFiles {
			if bypassAllowed && !matrixBypassAllowlist.Has(filename) {
				// Disable the CI bypass if any file is not explicitely in the bypass
				// allowlist.
				bypassAllowed = false
			}
			// If any changes detected in .github/ or monopod/, must build all
			if strings.HasPrefix(filename, constants.GithubActionsDirName+"/") ||
				strings.HasPrefix(filename, constants.MonopodDirName+"/") {
				bypassAllowed = false
				includeImages = sets.New[string]()
				break
			}
			if strings.HasPrefix(filename, fmt.Sprintf("%s/", constants.ImagesDirName)) {
				includeImages.Insert(strings.Split(filename, "/")[1])
			}
		}
		if bypassAllowed || len(includeImages) > 0 {
			allImagesNew := []images.Image{}
			for _, image := range allImages {
				if includeImages.Has(image.ImageName) {
					allImagesNew = append(allImagesNew, image)
				}
			}
			allImages = allImagesNew
		}
	}

	if i.ShardingFactor > 1 {
		shards := make([][]images.Image, i.ShardingFactor)
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
	fmt.Fprintln(i.Output, string(b))
	return nil
}
