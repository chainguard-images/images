package commands

import (
	"fmt"
	"os"
	"path"
	"sort"
	"strings"

	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/images"
)

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
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)
	return cmd
}

type readmeImpl struct {
	SummaryRootUrl     string
	RootReadmeToStdout bool
	Check              bool
	DefaultRegistry    string
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

	// Individual image README.md files
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
		padded := fmt.Sprintf("%s\n%s\n%s\n", constants.ImageReadmeGenStartComment, readmeInsert, constants.ImageReadmeGenEndComment)
		filename := path.Join(constants.ImagesDirName, img, "README.md")
		existingContent, err := os.ReadFile(filename)
		if err != nil {
			// does not yet exist, create it!
			fmt.Printf("Error opening %s: %s", filename, err.Error())
			if err := os.WriteFile(filename, []byte(padded), 0644); err != nil {
				return err
			}
		} else {
			// replace existing insert if exists
			existingContentStr := string(existingContent)
			tmp1 := strings.Split(existingContentStr, constants.ImageReadmeGenStartComment)
			if len(tmp1) < 2 {
				if strings.HasPrefix(existingContentStr, "# ") {
					// fix for there already being an h1 header (just remove it)
					existingContentStr = strings.Join(strings.Split(existingContentStr, "\n")[1:], "\n")
				}
				if err := os.WriteFile(filename, []byte(padded+existingContentStr), 0644); err != nil {
					return err
				}
			} else {
				tmp2 := strings.Split(tmp1[1], constants.ImageReadmeGenEndComment)
				padded := fmt.Sprintf("%s\n%s\n%s\n\n", constants.ImageReadmeGenStartComment, readmeInsert, constants.ImageReadmeGenEndComment)
				final := strings.TrimRight(padded+strings.TrimLeft(tmp2[1], "\n")+"\n", "\n") + "\n"
				if err := os.WriteFile(filename, []byte(final), 0644); err != nil {
					return err
				}
			}
		}
	}
	return nil
}
