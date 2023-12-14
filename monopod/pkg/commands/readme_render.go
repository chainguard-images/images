package commands

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"path"
	"regexp"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/hashicorp/hcl/v2/hclsimple"
	"github.com/spf13/cobra"
)

type renderReadmeImpl struct {
	Image      string
	Readme     *completeReadme
	hclFile    string
	mdFile     string
	rawMD      string
	renderedMD *bytes.Buffer
}

func newReadmeRenderer(image string, cr *completeReadme) *renderReadmeImpl {
	r := &renderReadmeImpl{
		Image:      image,
		hclFile:    path.Join(constants.ImagesDirName, image, "metadata.hcl"),
		mdFile:     path.Join(constants.ImagesDirName, image, "README.md"),
		renderedMD: new(bytes.Buffer),
	}
	if cr == nil {
		cr = &completeReadme{Name: image}
	}
	r.Readme = cr
	return r
}

func Render() *cobra.Command {
	ro := &options.RenderReadmeOptions{}
	cmd := &cobra.Command{
		Use:   "render",
		Short: "Render a README.md for an image from a metadata.hcl file.",
		Example: `
monopod readme render --image postgresql
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := newReadmeRenderer(ro.Image, nil)
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)

	return cmd
}

func (r *renderReadmeImpl) Do() error {
	var err error

	if r.Image == "" {
		err = fmt.Errorf("missing --image argument")
		return err
	}
	if err = r.decodeHcl(); err != nil {
		return err
	}
	if err = r.validate(); err != nil {
		return err
	}
	if r.Readme.ReadmeFile != "README.md" {
		r.mdFile = path.Join(constants.ImagesDirName, r.Image, r.Readme.ReadmeFile)
	}

	switch r.stat() {
	case false:
		log.Printf("Empty %s. Add some details to the <!--body:start--><!--body:end--> section!", r.mdFile)
	case true:
		if err := r.read(); err != nil {
			return err
		}
		if err := r.scanForBody(); err != nil {
			return err
		}
	}

	if err := r.render(); err != nil {
		return err
	}
	if err := r.write(); err != nil {
		return err
	}

	return nil
}

func (r *renderReadmeImpl) render() error {
	return templates.ExecuteTemplate(
		r.renderedMD,
		"README.md.tpl",
		r.Readme,
	)
}

func (r *renderReadmeImpl) stat() bool {
	f, err := os.Stat(r.mdFile)
	if err != nil {
		return false
	}

	if f.Size() > 0 {
		return true
	}

	return false
}

func (r *renderReadmeImpl) read() error {
	b, err := os.ReadFile(r.mdFile)
	if err != nil {
		return err
	}

	r.rawMD = string(b)
	return nil
}

func (r *renderReadmeImpl) write() error {
	return os.WriteFile(r.mdFile, r.renderedMD.Bytes(), 0o644)
}

func (r *renderReadmeImpl) validate() error {
	switch {
	case r.Readme.Name == "":
		return fmt.Errorf("missing name field in %s", r.hclFile)
	case r.Readme.Image == "":
		return fmt.Errorf("missing image field in %s", r.hclFile)
	case r.Readme.ShortDesc == "":
		return fmt.Errorf("missing short description field in %s", r.hclFile)
	case r.Readme.ReadmeFile == "":
		return fmt.Errorf("missing readme file location in %s", r.hclFile)
	case r.Readme.ReadmeFile == "":
		return fmt.Errorf("missing upstream project URL in %s", r.hclFile)
	}
	return nil
}

func (r *renderReadmeImpl) decodeHcl() error {
	return hclsimple.DecodeFile(r.hclFile, nil, r.Readme)
}

func (r *renderReadmeImpl) scanForBody() error {
	re := regexp.MustCompile(`<!--body:start-->([\s\S]*)<!--body:end-->`)
	match := re.FindString(r.rawMD)
	if match == "" {
		return fmt.Errorf("missing or incomplete <!--body:start-->...<!--body:end--> section in %s\n", r.mdFile)
	}
	match = strings.Replace(match, "<!--body:start-->", "", -1)
	match = strings.Replace(match, "<!--body:end-->", "", -1)
	r.Readme.Body = match
	return nil
}
