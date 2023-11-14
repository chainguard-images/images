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

type renderReadmeImpl struct {
	Image      string
	Readme     *completeReadme
	hclFile    string
	mdFile     string
	rawMD      string
	renderedMD *bytes.Buffer
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
				Image:      ro.Image,
				hclFile:    path.Join(constants.ImagesDirName, ro.Image, "README.hcl"),
				mdFile:     path.Join(constants.ImagesDirName, ro.Image, "README.md"),
				Readme:     &completeReadme{},
				renderedMD: new(bytes.Buffer),
			}
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
	if err = r.loadReadmeHcl(); err != nil {
		return err
	}
	if err = r.checkFields(); err != nil {
		return err
	}

	switch r.checkExists() {
	case false:
		log.Printf("Missing %s, rendering a new copy", r.mdFile)
	case true:
		if err := r.readReadme(); err != nil {
			return err
		}
		if err := r.scanForBody(); err != nil {
			return err
		}
	}

	if err := r.renderReadme(); err != nil {
		return err
	}
	if err := r.writeReadme(); err != nil {
		return err
	}

	return nil
}

func (r *renderReadmeImpl) renderReadme() error {
	return templates.ExecuteTemplate(
		r.renderedMD,
		"README.md.tpl",
		templateData{
			Readme: r.Readme,
		},
	)
}

func (r *renderReadmeImpl) checkExists() bool {
	f, err := os.Stat(r.mdFile)
	if err != nil {
		return false
	}

	if f.Size() > 0 {
		return true
	}

	return false
}

func (r *renderReadmeImpl) readReadme() error {
	b, err := os.ReadFile(r.mdFile)
	if err != nil {
		return err
	}

	r.rawMD = string(b)
	return nil
}

func (r *renderReadmeImpl) writeReadme() error {
	return os.WriteFile(r.mdFile, r.renderedMD.Bytes(), 0o644)
}

func (r *renderReadmeImpl) checkFields() error {
	switch {
	case r.Readme.Name == "":
		return fmt.Errorf("Missing name field")
	case r.Readme.Image == "":
		return fmt.Errorf("Missing image field")
	case r.Readme.ConsoleSummary == "":
		return fmt.Errorf("Missing console summary field")
	case r.Readme.AcademyOverview == "":
		return fmt.Errorf("Missing academy overview field")
	case r.Readme.ReadmeFile == "":
		return fmt.Errorf("Missing readme file location")
	}
	return nil
}

func (r *renderReadmeImpl) loadReadmeHcl() error {
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
