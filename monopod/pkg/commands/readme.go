package commands

import (
	"bytes"
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
				BadgeRootUrl:       ro.BadgeRootUrl,
				SummaryRootUrl:     ro.SummaryRootUrl,
				RootReadmeToStdout: ro.RootReadmeToStdout,
				Check:              ro.Check,
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)
	return cmd
}

type readmeImpl struct {
	BadgeRootUrl       string
	SummaryRootUrl     string
	RootReadmeToStdout bool
	Check              bool
}

func (i *readmeImpl) Do() error {
	if i.RootReadmeToStdout {
		return i.rootReadmeToStdout()
	}
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

	// Top-level README.md
	expectedRootReadmeContents, err := getRootReadmeContents(allImages, i.BadgeRootUrl)
	if err != nil {
		fmt.Println(err.Error())
		numIssues++
	} else {
		actualRootReadmeContents, err := os.ReadFile("README.md")
		if err != nil {
			fmt.Println(err.Error())
			numIssues++
		} else if !bytes.Equal(actualRootReadmeContents, expectedRootReadmeContents) {
			fmt.Println("README.md is out-of-date.")
			numIssues++
		}
	}

	imageToStatusMap := map[string]string{}
	imageToReferenceMap := map[string]string{}
	imageToVariantMap := map[string][]string{}
	for _, image := range allImages {
		imageToStatusMap[image.ImageName] = image.ImageStatus
		imageToReferenceMap[image.ImageName] = fmt.Sprintf("`%s`", strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1))
		variant := fmt.Sprintf("`%s`", image.ApkoTargetTag)
		if image.ApkoAdditionalTags != "" {
			tmp := []string{}
			for _, tag := range strings.Split(image.ApkoAdditionalTags, ",") {
				tmp = append(tmp, fmt.Sprintf("`%s`", tag))
			}
			variant = fmt.Sprintf("%s (%s)", variant, strings.Join(tmp, " / "))
		}
		imageToVariantMap[image.ImageName] = append(imageToVariantMap[image.ImageName], variant)
	}
	keys := []string{}
	for k := range imageToVariantMap {
		keys = append(keys, k)
	}
	sort.Slice(keys, func(i, j int) bool {
		return keys[i] < keys[j]
	})
	for _, k := range keys {
		// Generate the section to prepend to beginning of file
		readmeInsert := fmt.Sprintf("# %s\n| | |\n| - | - |\n", k)
		readmeInsert += fmt.Sprintf("| **Status** | %s |\n", imageToStatusMap[k])
		readmeInsert += fmt.Sprintf("| **OCI Reference** | %s |\n", imageToReferenceMap[k])
		readmeInsert += fmt.Sprintf("| **Variants/Tags** | %s |\n", fmt.Sprintf("![](%s/%s.svg)", i.SummaryRootUrl, k))
		readmeInsert += "---"

		filename := path.Join(constants.ImagesDirName, k, "README.md")
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

	// Top-level README.md
	rootReadmeContents, err := getRootReadmeContents(allImages, i.BadgeRootUrl)
	if err != nil {
		return err
	}
	if err := os.WriteFile("README.md", rootReadmeContents, 0644); err != nil {
		return err
	}

	// Individual image README.md files
	imageToStatusMap := map[string]string{}
	imageToReferenceMap := map[string]string{}
	imageToVariantMap := map[string][]string{}
	for _, image := range allImages {
		imageToStatusMap[image.ImageName] = image.ImageStatus
		imageToReferenceMap[image.ImageName] = fmt.Sprintf("`%s`", strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1))
		variant := fmt.Sprintf("`%s`", image.ApkoTargetTag)
		if image.ApkoAdditionalTags != "" {
			tmp := []string{}
			for _, tag := range strings.Split(image.ApkoAdditionalTags, ",") {
				tmp = append(tmp, fmt.Sprintf("`%s`", tag))
			}
			variant = fmt.Sprintf("%s (%s)", variant, strings.Join(tmp, " / "))
		}
		imageToVariantMap[image.ImageName] = append(imageToVariantMap[image.ImageName], variant)
	}
	keys := []string{}
	for k := range imageToVariantMap {
		keys = append(keys, k)
	}
	sort.Slice(keys, func(i, j int) bool {
		return keys[i] < keys[j]
	})
	for _, k := range keys {
		// Generate the section to prepend to beginning of file
		readmeInsert := fmt.Sprintf("# %s\n| | |\n| - | - |\n", k)
		readmeInsert += fmt.Sprintf("| **Status** | %s |\n", imageToStatusMap[k])
		readmeInsert += fmt.Sprintf("| **OCI Reference** | %s |\n", imageToReferenceMap[k])
		readmeInsert += fmt.Sprintf("| **Variants/Tags** | %s |\n", fmt.Sprintf("![](%s/%s.svg)", i.SummaryRootUrl, k))
		readmeInsert += "---"
		padded := fmt.Sprintf("%s\n%s\n%s\n", constants.ImageReadmeGenStartComment, readmeInsert, constants.ImageReadmeGenEndComment)

		filename := path.Join(constants.ImagesDirName, k, "README.md")
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

func (i *readmeImpl) rootReadmeToStdout() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}
	b, err := getRootReadmeContents(allImages, i.BadgeRootUrl)
	if err != nil {
		return err
	}
	fmt.Print(string(b))
	return nil
}

func getRootReadmeContents(allImages []images.Image, badgeRootUrl string) ([]byte, error) {
	buf := new(bytes.Buffer)
	buf.WriteString("# Chainguard Images\n")
	buf.WriteString("\n")
	buf.WriteString("| Name | OCI Reference | Status |")
	if badgeRootUrl != "" {
		buf.WriteString(" Variants/Tags |")
	}
	buf.WriteString("\n")
	buf.WriteString("| ----- | ----- | ----- |")
	if badgeRootUrl != "" {
		buf.WriteString("  -------- |")
	}
	buf.WriteString("\n")
	imageToReferenceMap := map[string]string{}
	imageToStatusMap := map[string]string{}
	imageToBadgeMap := map[string][]string{}
	imageToHasLatestMap := map[string]bool{}
	if badgeRootUrl != "" {
		for _, image := range allImages {
			if _, ok := imageToBadgeMap[image.ImageName]; !ok {
				imageToBadgeMap[image.ImageName] = []string{}
			}
			link := image.ApkoConfig
			ref := strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1)
			if strings.HasPrefix(ref, fmt.Sprintf("%s/", constants.DefaultRegistryFrontend)) {
				// Only point to Registry UI for public images
				link = fmt.Sprintf("%s/?image=%s:%s", constants.RegistryUI, ref, image.ApkoTargetTag)
			}
			s := fmt.Sprintf("[![](%s/%s.build.status.%s.svg)](%s)", badgeRootUrl, image.ImageName, image.ApkoTargetTag, link)
			imageToBadgeMap[image.ImageName] = append(imageToBadgeMap[image.ImageName], s)
			imageToReferenceMap[image.ImageName] = ref
			imageToStatusMap[image.ImageName] = image.ImageStatus
			for _, tag := range strings.Split(image.ApkoAdditionalTags, ",") {
				// TODO: support images with multiple extra tags (not just latest)
				if tag == "latest" {
					imageToHasLatestMap[image.ImageName] = true
					break
				}
			}
		}
	}
	keys := []string{}
	for k := range imageToBadgeMap {
		keys = append(keys, k)
	}
	sort.Slice(keys, func(i, j int) bool {
		return keys[i] < keys[j]
	})
	for _, k := range keys {
		v := imageToBadgeMap[k]
		sort.Slice(v, func(i, j int) bool {
			return v[i] < v[j]
		})
		reference := imageToReferenceMap[k]
		status := imageToStatusMap[k]
		buf.WriteString(fmt.Sprintf("| [%s](./%s/%s) | `%s` | %s |", k, constants.ImagesDirName, k, reference, status))
		if badgeRootUrl != "" {
			buf.WriteString(fmt.Sprintf(" %s |", strings.Join(v, "<br/>")))
		}
		buf.WriteString("\n")
	}
	return buf.Bytes(), nil
}
