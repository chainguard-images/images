package commands

import (
	"bytes"
	"fmt"
	"os"
	"path"
	"path/filepath"
	"runtime"
	"sort"
	"strings"
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
		// Generate the section to prepend to beginning of file
		readmeInsert := fmt.Sprintf("# %s\n| | |\n| - | - |\n", img)
		readmeInsert += fmt.Sprintf("| **OCI Reference** | `cgr.dev/chainguard/%s` |\n", img)

		readmeInsert += "\n\n"
		readmeInsert += fmt.Sprintf("* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/%s/overview/)\n", img)
		readmeInsert += "* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.\n"
		readmeInsert += "* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*\n\n"
		readmeInsert += "---"

		filename := path.Join(constants.ImagesDirName, img, "README.md")
		existingContent, err := os.ReadFile(filename)
		if err != nil {
			fmt.Printf("Error opening %s: %s", filename, err.Error())
			numIssues++
		} else {
			existingContentStr := string(existingContent)
			tmp1 := strings.Split(existingContentStr, constants.ImageReadmeGenStartComment)
			if len(tmp1) < 2 {
				fmt.Printf("%s exists but has not yet been modified by monopod.\n", filename)
				numIssues++
			} else {
				padded := fmt.Sprintf("%s\n%s\n%s\n", constants.ImageReadmeGenStartComment, readmeInsert, constants.ImageReadmeGenEndComment)
				if !strings.HasPrefix(existingContentStr, padded) {
					fmt.Printf("%s is out-of-date.\n", filename)
					numIssues++
				}
			}
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
