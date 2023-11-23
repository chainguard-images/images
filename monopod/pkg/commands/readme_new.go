package commands

import (
	"bytes"
	"fmt"
	"os"
	"path"

	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
)

type newReadmeImpl struct {
	Image string
}

func NewReadme() *cobra.Command {
	ro := &options.NewReadmeOptions{}
	cmd := &cobra.Command{
		Use:   "new",
		Short: "Create a metadata.hcl template for an image's readme.",
		Example: `
monopod readme new --image postgresql
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &newReadmeImpl{
				Image: ro.Image,
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)

	return cmd
}

func (n *newReadmeImpl) Do() error {
	if n.Image == "" {
		return fmt.Errorf("missing --image argument")
	}
	if err := n.checkExistingHCL(); err != nil {
		return fmt.Errorf("%v", err)
	}
	return n.createReadmeHCL()
}

func (n *newReadmeImpl) checkExistingHCL() error {
	img := n.Image
	imagePath := fmt.Sprintf("images/%s/metadata.hcl", img)
	f, _ := os.Stat(imagePath)
	if f != nil {
		return fmt.Errorf("%s already exists, edit it and run `monopod readme render --image %s`", imagePath, img)
	}
	return nil
}

func (n *newReadmeImpl) createReadmeHCL() error {
	readme := completeReadme{
		Name: n.Image,
	}

	doc := new(bytes.Buffer)
	err := templates.ExecuteTemplate(doc, "metadata.hcl.tpl", templateData{
		Readme: &readme,
	})
	if err != nil {
		return err
	}

	filename := path.Join(constants.ImagesDirName, n.Image, "metadata.hcl")
	err = os.WriteFile(filename, doc.Bytes(), 0o644)
	if err != nil {
		return err
	}
	return nil
}
