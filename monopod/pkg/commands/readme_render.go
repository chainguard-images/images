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

var readmeSections = []string{"monopod", "logo", "overview", "getting", "body"}

// should these be broken up?
// need to test render, scanForBody and validate
type readmeRenderer interface {
	Do() error
	decodeHcl() error
	read() error
	render() error
	scanForBody() error
	stat() bool
	validate() error
	write() error
}

// implements readmeRenderer
type renderReadmeImpl struct {
	Image      string
	Readme     *completeReadme
	hclFile    string
	mdFile     string
	rawMD      string
	renderedMD *bytes.Buffer
}

func NewReadmeRenderer(image string) readmeRenderer {
	return &renderReadmeImpl{
		Image:      image,
		hclFile:    path.Join(constants.ImagesDirName, image, "README.hcl"),
		mdFile:     path.Join(constants.ImagesDirName, image, "README.md"),
		Readme:     &completeReadme{},
		renderedMD: new(bytes.Buffer),
	}
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
			impl := NewReadmeRenderer(ro.Image)
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
		log.Printf("Missing %s, rendering a new copy", r.mdFile)
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
		templateData{
			Readme: r.Readme,
		},
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
		return fmt.Errorf("Missing name field")
	case r.Readme.Image == "":
		return fmt.Errorf("Missing image field")
	case r.Readme.ShortDesc == "":
		return fmt.Errorf("Missing short description field")
	case r.Readme.ConsoleSummary == "" && r.Readme.ShortDesc == "":
		return fmt.Errorf("Missing console summary field")
	case r.Readme.ReadmeFile == "":
		return fmt.Errorf("Missing readme file location")
	case r.Readme.ReadmeFile == "":
		return fmt.Errorf("Missing upstream project URL")
	// use short description if console summary is not set
	case r.Readme.ConsoleSummary == "" && r.Readme.ShortDesc != "":
		log.Println("Using short description for console summary field")
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
