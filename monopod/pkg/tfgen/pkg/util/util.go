package util

import (
	"fmt"
	"os"
	"path"
	"strconv"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/google/go-cmp/cmp"
	"github.com/jdolitsky/tq/pkg/tq"
)

func EmptyTerraformFile() *tq.TerraformFile {
	return &tq.TerraformFile{
		Body: tq.TerraformFileBody{
			Blocks: []tq.TerraformFileBlock{},
		},
	}
}

func CombineNoGenerated(tfFiles map[string]*tq.TerraformFile) *tq.TerraformFile {
	data := EmptyTerraformFile()
	// If main.tf exists, use first
	if tfFile, ok := tfFiles[constants.MainTfFilename]; ok {
		data.Body.Blocks = append(data.Body.Blocks, tfFile.Body.Blocks...)
	}
	for k, tfFile := range tfFiles {
		// Skip main.tf and generated.tf in this loop
		if k == constants.MainTfFilename || k == constants.GeneratedTfFilename {
			continue
		}
		data.Body.Blocks = append(data.Body.Blocks, tfFile.Body.Blocks...)
	}
	return data
}

func LoadAllTerraformFilesInDir(dir string) (map[string]*tq.TerraformFile, error) {
	result := map[string]*tq.TerraformFile{}
	entries, err := os.ReadDir(dir)
	if err != nil {
		return nil, err
	}
	for _, entry := range entries {
		if entry.IsDir() {
			continue
		}
		name := entry.Name()
		if strings.HasSuffix(name, constants.TfFileExtension) || strings.HasSuffix(name, constants.TfTemplateFileExtention) {
			b, err := os.ReadFile(path.Join(dir, name))
			if err != nil {
				return nil, err
			}
			tfFile, err := tq.ParseTerraform(b)
			if err != nil {
				return nil, err
			}
			result[name] = tfFile
		}
	}
	return result, nil
}

func ShouldOverwrite(origFilename string, newContent []byte) bool {
	origContent, _ := os.ReadFile(origFilename)
	diff := cmp.Diff(origContent, newContent)
	return diff != ""
}

func TerraformFileToBytes(tfFile *tq.TerraformFile) []byte {
	return []byte(fmt.Sprintf("%s\n\n%s\n", constants.GeneratedTfHeader, tfFile))
}

// tq values are double-quoted due to serialization format
func UnquoteTQString(s string) string {
	return strings.Trim(s, `"`)
}

func QuoteTQString(s string) string {
	return strconv.Quote(s)
}

// These come the form: source = "../../tflib/publisher"
// Just check source ends with "/publisher"
func IsPublisherBlock(block tq.TerraformFileBlock) bool {
	return strings.HasSuffix(UnquoteTQString(block.Attributes[constants.AttributeSource]), fmt.Sprintf("/%s", constants.AttributePublisher))
}

// Checking for resouce "oci_tag"
func IsOciTagBlock(block tq.TerraformFileBlock) bool {
	return block.Type == constants.TfTypeResource && len(block.Labels) > 0 && block.Labels[0] == constants.ResourceOciTag
}
