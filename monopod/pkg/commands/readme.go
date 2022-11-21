package commands

import (
	"fmt"
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
		Short: "Generate README.md dynamically from the repo.",
		Example: `
monopod readme
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &readmeImpl{
				BadgeRootUrl: ro.BadgeRootUrl,
			}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)
	return cmd
}

type readmeImpl struct {
	BadgeRootUrl string
}

func (i *readmeImpl) Do() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}
	fmt.Println("# Chainguard Images")
	fmt.Println("")
	fmt.Printf("| Name | OCI Reference |")
	if i.BadgeRootUrl != "" {
		fmt.Printf(" Variants/Tags |")
	}
	fmt.Printf("\n")
	fmt.Printf("| ----- | ----- |")
	if i.BadgeRootUrl != "" {
		fmt.Printf("  -------- |")
	}
	fmt.Printf("\n")
	imageToReferenceMap := map[string]string{}
	imageToBadgeMap := map[string][]string{}
	imageToHasLatestMap := map[string]bool{}
	if i.BadgeRootUrl != "" {
		for _, image := range allImages {
			if _, ok := imageToBadgeMap[image.ImageName]; !ok {
				imageToBadgeMap[image.ImageName] = []string{}
			}
			s := fmt.Sprintf("[![](%s/%s.build.status.%s.svg)](%s)", i.BadgeRootUrl, image.ImageName, image.ApkoTargetTag, image.ApkoConfig)
			imageToBadgeMap[image.ImageName] = append(imageToBadgeMap[image.ImageName], s)
			imageToReferenceMap[image.ImageName] = strings.Replace(image.ApkoBaseTag, constants.DefaultRegistry, constants.DefaultRegistryFrontend, 1)
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
		fmt.Printf("| [%s](./%s/%s) | `%s` |", k, constants.ImagesDirName, k, reference)
		if i.BadgeRootUrl != "" {
			fmt.Printf(" %s |", strings.Join(v, "<br/>"))
		}
		fmt.Printf("\n")
	}
	return nil
}
