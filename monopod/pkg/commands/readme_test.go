package commands

import (
	"bytes"
	"reflect"
	"testing"
)

// this isn't the most granular test since it chains things together
// but it does exercise the important methods and fails any invalid step
func TestReadme(t *testing.T) {
	readme := &renderReadmeImpl{
		Image:      "apko",
		Readme:     &completeReadme{},
		hclFile:    "metadata.hcl",
		mdFile:     "README.md",
		rawMD:      "",
		renderedMD: &bytes.Buffer{},
	}

	want := &completeReadme{
		ReadmeFile:     "README.md",
		ShortDesc:      "Container image for running [apko](https://github.com/chainguard-dev/apko) container builds.",
		ConsoleSummary: "",
		Image:          "cgr.dev/chainguard/apko",
		Name:           "apko",
		Logo:           "https://storage.googleapis.com/chainguard-academy/logos/apko/logo.svg",
		EndOfLife:      "",
		CompatNotes:    "",
		URL:            "https://github.com/chainguard-dev/apko",
		Body:           "\nTest body here.\n",
	}

	t.Run("render readme", func(t *testing.T) {
		r := newReadmeRenderer(readme.Image, nil)
		if err := r.decodeHcl(); err != nil {
			t.Fatalf("Error decoding %s: %s\n", r.hclFile, err)
		}
		if err := r.validate(); err != nil {
			t.Fatalf("Error validating %s: %s\n", r.hclFile, err)
		}
		if err := r.read(); err != nil {
			t.Fatalf("Error reading %s: %s\n", r.mdFile, err)
		}
		if err := r.scanForBody(); err != nil {
			t.Fatalf("Error finding <!--body...--> content: %s: %s\n", r.mdFile, err)
		}
		if err := r.render(); err != nil {
			t.Fatalf("Error rendering %s for comparison: %s\n", r.mdFile, err)
		}
		got := r.Readme
		if !reflect.DeepEqual(got, want) {
			t.Errorf("\ngot:\t%#v\nwant:\t%#v\n", got, want)
		}
	})

}
