package images

import (
	"os"

	"github.com/chainguard-images/images/monopod/pkg/constants"
)

type Image struct {
	ImageName string `json:"imageName"`
}

func ListAll() ([]Image, error) {
	allImages := []Image{}
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
		allImages = append(allImages, Image{ImageName: imageName})
	}
	return allImages, nil
}
