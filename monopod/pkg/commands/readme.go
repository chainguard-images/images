package commands

import (
	"fmt"
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
			impl := &readmeImpl{}
			return impl.Do()
		},
	}
	ro.AddFlags(cmd)
	return cmd
}

type readmeImpl struct{}

func (i *readmeImpl) Do() error {
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}
	fmt.Println("# Chainguard Images")
	fmt.Println("")
	fmt.Println("| Image | Ref | Variants |")
	fmt.Println("| ----- | ----| -------- |")
	imageToTagMap := map[string][]string{}
	for _, image := range allImages {
		if _, ok := imageToTagMap[image.ImageName]; !ok {
			imageToTagMap[image.ImageName] = []string{}
		}
		s := fmt.Sprintf("[%s](./%s)", image.ApkoTargetTag, image.ApkoConfig)
		if image.ApkoAdditionalTags != "" {
			tmp := []string{}
			for _, tag := range strings.Split(image.ApkoAdditionalTags, ",") {
				tmp = append(tmp, fmt.Sprintf("`%s`", tag))
			}
			s = fmt.Sprintf("%s (%s)", s, strings.Join(tmp, " / "))
		}
		imageToTagMap[image.ImageName] = append(imageToTagMap[image.ImageName], s)
	}
	for k, v := range imageToTagMap {
		fmt.Printf("| [%s](./%s/%s) | `cgr.dev/chainguard/%s` | %s |\n",
			k, constants.ImagesDirName, k, k, strings.Join(v, ", "))
	}
	return nil
}
