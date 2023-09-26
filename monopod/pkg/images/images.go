package images

import (
	"os"

	"github.com/chainguard-images/images/monopod/pkg/constants"
)

func ListAll() ([]string, error) {
	allImages := []string{}
	imageDirs, err := os.ReadDir(constants.ImagesDirName)
	if err != nil {
		return nil, err
	}

	for _, imageDir := range imageDirs {
		if !imageDir.IsDir() {
			continue
		}
		if imageDir.Name() == "TEMPLATE" { // Ignore the template repo.
			continue
		}
		imageName := imageDir.Name()
		allImages = append(allImages, imageName)
	}
	return allImages, nil
}
