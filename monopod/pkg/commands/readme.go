package commands

import (
	"bytes"
	"fmt"
	"path"
	"path/filepath"
	"runtime"
	"sort"
	"text/template"

	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/images"
)

type completeReadme struct {
	ReadmeFile     string `tfsdk:"readme_file" hcl:"readme_file"`
	ShortDesc      string `tfsdk:"short_description" hcl:"short_description"`
	ConsoleSummary string `tfsdk:"console_summary" hcl:"console_summary"`
	Image          string `tfsdk:"image" hcl:"image"`
	Name           string `tfsdk:"name" hcl:"name"`
	Logo           string `tfsdk:"logo" hcl:"logo"`
	EndOfLife      string `tfsdk:"endoflife" hcl:"endoflife"`
	CompatNotes    string `tfsdk:"compatibility_notes" hcl:"compatibility_notes"`
	URL            string `tfsdk:"upstream_url" hcl:"upstream_url"`
	Body           string `tfsdk:"body"` // anything read from ReadmeFile between <!--body:*--> markers
}

type templateData struct {
	Readme *completeReadme
}

var templates *template.Template

func init() {
	// Get current filename and path
	_, filename, _, ok := runtime.Caller(0)
	if !ok {
		panic("Failed to get current file path")
	}

	// Use templates directory relative to the current file
	templatesDir := filepath.Join(filepath.Dir(filename), "templates/*.tpl")

	templates = template.Must(
		template.New("").
			Funcs(template.FuncMap{}).
			ParseGlob(templatesDir),
	)
}

func Readme() *cobra.Command {
	ro := &options.ReadmeOptions{}
	cmd := &cobra.Command{
		Use:   "readme",
		Short: "Generate all README.md files dynamically from the repo.",
		Example: `
monopod readme
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &readmeImpl{
				SummaryRootUrl:     ro.SummaryRootUrl,
				RootReadmeToStdout: ro.RootReadmeToStdout,
				Check:              ro.Check,
				DefaultRegistry:    ro.DefaultRegistry,
				New:                ro.New,
				Render:             ro.Render,
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)

	cmd.AddCommand(NewReadme(), Render())
	return cmd
}

type readmeImpl struct {
	SummaryRootUrl     string
	RootReadmeToStdout bool
	Check              bool
	DefaultRegistry    string
	New                bool
	Render             bool
}

func (i *readmeImpl) Do() error {
	if i.Check {
		return i.check()
	}
	return i.fixAllReadmes()
}

func (i *readmeImpl) check() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}

	numIssues := 0

	sort.Slice(allImages, func(i, j int) bool {
		return allImages[i].ImageName < allImages[j].ImageName
	})
	for _, i := range allImages {
		img := i.ImageName

		// readme := renderReadmeImpl{Image: img}
		r := NewReadmeRenderer(img)

		if err := r.decodeHcl(); err != nil {
			fmt.Printf("Error decoding %s: %s", r.hclFile, err)
			numIssues++
			continue
		}
		if err := r.validate(); err != nil {
			fmt.Printf("Error validating %s: %s", r.hclFile, err)
			numIssues++
			continue
		}
		if err := r.read(); err != nil {
			fmt.Printf("Error reading %s: %s", r.mdFile, err)
			numIssues++
			continue
		}
		if err := r.scanForBody(); err != nil {
			fmt.Printf("Error finding <!--body...--> content: %s: %s", r.mdFile, err)
			numIssues++
			continue
		}
		if err := r.render(); err != nil {
			fmt.Printf("Error rendering %s for comparison: %s", r.mdFile, err)
			numIssues++
			continue
		}

		//finally compare if the on disk versus rendered versions match
		if r.rawMD != r.renderedMD.String() {
			fmt.Printf("%s exists but does not match the monopod generated version.\n", r.mdFile)
			numIssues++
			continue
		}

	}

	if numIssues > 0 {
		fmt.Printf("Found a total of %d issue(s). Please run the following at the root of this repo to fix: \"monopod readme\"\n", numIssues)
		return fmt.Errorf("check failed")
	}

	fmt.Println("Check passed. All README.md files are up-to-date.")
	return nil
}

func (i *readmeImpl) fixAllReadmes() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}

	// Individual image README.hcl files
	sort.Slice(allImages, func(i, j int) bool {
		return allImages[i].ImageName < allImages[j].ImageName
	})
	for _, i := range allImages {
		impl := &renderReadmeImpl{
			Image:      i.ImageName,
			hclFile:    path.Join(constants.ImagesDirName, i.ImageName, "README.hcl"),
			mdFile:     path.Join(constants.ImagesDirName, i.ImageName, "README.md"),
			Readme:     &completeReadme{},
			renderedMD: new(bytes.Buffer),
		}
		if err := impl.Do(); err != nil {
			return err
		}
	}
	return nil
}
