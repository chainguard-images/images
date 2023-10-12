package commands

import (
	"bytes"
	"fmt"
	"os"
	"path"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/hashicorp/hcl/v2/hclsimple"
	"github.com/spf13/cobra"
)

type renderReadmeImpl struct {
	Image string
}

func Render() *cobra.Command {
	ro := &options.RenderReadmeOptions{}
	cmd := &cobra.Command{
		Use:   "render",
		Short: "Render a README.md for an image from a README.hcl file.",
		Example: `
monopod readme render --image postgresql
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &renderReadmeImpl{
				Image: ro.Image,
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)

	return cmd
}

func (r *renderReadmeImpl) Do() error {
	if r.Image == "" {
		return fmt.Errorf("missing --image argument")
	}
	return r.renderReadme()
}

func (r *renderReadmeImpl) renderReadme() error {
	filename := path.Join(constants.ImagesDirName, r.Image, "README.hcl")
	var readme completeReadme

	err := hclsimple.DecodeFile(filename, nil, &readme)
	if err != nil {
		return err
	}

	switch {
	case readme.Name == "":
		return fmt.Errorf("Missing name field")
	case readme.Image == "":
		return fmt.Errorf("Missing image field")
	case readme.Overview == "":
		return fmt.Errorf("Missing overview field")
	case readme.Body == "":
		return fmt.Errorf("Missing body field")
	}

	doc := new(bytes.Buffer)
	err = templates.ExecuteTemplate(doc, "README.md.tpl", templateData{
		Readme: &readme,
	})
	if err != nil {
		return err
	}

	err = os.WriteFile(filename, doc.Bytes(), 0o644)
	if err != nil {
		return err
	}
	return nil
}
