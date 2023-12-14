package commands

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"path"

	"github.com/rivo/tview"
	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
)

type newReadmeImpl struct {
	Readme      completeReadme
	renderedHCl *bytes.Buffer
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
				Readme:      completeReadme{Name: ro.Image},
				renderedHCl: new(bytes.Buffer),
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)

	return cmd
}

func (n *newReadmeImpl) Do() error {
	if n.Readme.Name == "" {
		return fmt.Errorf("missing --image argument")
	}
	if err := n.checkExistingHCL(); err != nil {
		return fmt.Errorf("%v", err)
	}
	if err := n.collectFormInput(""); err != nil {
		return fmt.Errorf("%v", err)
	}
	if err := n.render(); err != nil {
		return fmt.Errorf("%v", err)
	}
	if err := n.write(); err != nil {
		return fmt.Errorf("%v", err)
	}
	return nil
}

func (n *newReadmeImpl) checkExistingHCL() error {
	img := n.Readme.Name
	imagePath := fmt.Sprintf("images/%s/metadata.hcl", img)
	f, _ := os.Stat(imagePath)
	if f != nil {
		return fmt.Errorf("%s already exists, edit it and run `monopod readme render --image %s`", imagePath, img)
	}
	return nil
}

func (n *newReadmeImpl) render() error {
	return templates.ExecuteTemplate(
		n.renderedHCl,
		"metadata.hcl.tpl",
		n.Readme,
	)
}

func (n *newReadmeImpl) write() error {
	filename := path.Join(constants.ImagesDirName, n.Readme.Name, "metadata.hcl")
	log.Println("writing file", filename)
	err := os.WriteFile(filename, n.renderedHCl.Bytes(), 0o644)
	if err != nil {
		return err
	}
	return nil
}

func (n *newReadmeImpl) collectFormInput(title string) error {
	img := n.Readme.Name
	if title == "" {
		title = fmt.Sprintf("Add metadata for %s", img)
	}

	app := tview.NewApplication()
	form := tview.NewForm()
	form.AddTextView("Image name:", fmt.Sprintf("cgr.dev/chainguard/%s", img), 0, 1, false, false)
	form.AddTextArea("Short description:", "", 0, 2, 0, nil)
	form.AddTextView("", "Enter a short description to be used on images.chainguard.dev and edu.chainguard.dev.", 0, 2, true, false)
	form.AddInputField("Project/upstream URL:", "", 0, nil, nil)
	form.AddTextView("", "Add the project's upstream GitHub or project site", 0, 2, true, false)

	form.AddButton("Accept and Save", func() {
		app.Stop()
	})
	form.AddButton("Cancel and Quit", func() {
		app.Stop()
		os.Exit(0)
	})

	form.SetBorder(true).SetTitle(title).SetTitleAlign(tview.AlignLeft)
	if err := app.SetRoot(form, true).EnableMouse(true).Run(); err != nil {
		return err
	}

	n.Readme.ShortDesc = form.GetFormItemByLabel("Short description:").(*tview.TextArea).GetText()
	n.Readme.URL = form.GetFormItemByLabel("Project/upstream URL:").(*tview.InputField).GetText()

	// invalid input, so call the form again
	if n.Readme.ShortDesc == "" || n.Readme.URL == "" {
		return n.collectFormInput("Missing short description or URL")
	}
	return nil
}
