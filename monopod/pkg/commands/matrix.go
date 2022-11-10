package commands

import (
	"encoding/json"
	"fmt"

	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
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
			impl := &matrixImpl{}
			return impl.Do()
		},
	}
	mo.AddFlags(cmd)
	return cmd
}

type matrixImpl struct{}

type matrixResponse struct {
	Include []images.Image `json:"include"`
}

func (i *matrixImpl) Do() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}
	response := matrixResponse{Include: allImages}
	b, err := json.Marshal(&response)
	if err != nil {
		return err
	}
	fmt.Println(string(b))
	return nil
}
