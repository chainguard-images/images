package lint

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"gopkg.in/yaml.v3"

	"chainguard.dev/apko/pkg/build/types"
)

type Config struct {
	Config   types.ImageConfiguration
	Filename string
	Dir      string
	NoLint   []string
	Hash     string
}

type ConfigCheck struct {
	Contents types.ImageContents `yaml:"contents"`
}

func (c ConfigCheck) isApkoConfig() bool {
	return len(c.Contents.Packages) != 0
}

// ReadConfigs read the apko config(s) from the target directory.
func ReadConfigs(paths []string, dir string) ([]Config, error) {
	var p []Config

	// if paths were passed as CLI parameters load those configs.
	if len(paths) > 0 {
		for _, path := range paths {
			fullPath := filepath.Join(dir, path)
			config, err := ReadConfig(fullPath)
			if err != nil {
				return p, fmt.Errorf("failed to read apko config %s: %w", fullPath, err)
			}

			nolint, err := findNoLint(fullPath)
			if err != nil {
				return p, fmt.Errorf("failed to read apko config %s: %w", fullPath, err)
			}

			p = append(p, Config{
				Config:   *config,
				Filename: fullPath,
				Dir:      dir,
				NoLint:   nolint,
			})
		}
		return p, nil
	}
	// get all configs in the provided directory
	return ReadAllConfigs(dir)
}

func findNoLint(filename string) ([]string, error) {
	b, err := os.ReadFile(filename)
	if err != nil {
		return nil, err
	}
	lines := strings.Split(string(b), "\n")
	for _, line := range lines {
		if strings.HasPrefix(line, "#nolint:") {
			return strings.Split(strings.TrimPrefix(line, "#nolint:"), ","), nil
		}
	}
	return nil, nil
}

func ReadAllConfigs(dir string) ([]Config, error) {
	var p []Config

	var fileList []string
	if err := filepath.Walk(dir, func(path string, fi os.FileInfo, err error) error {
		if filepath.Ext(path) == ".yaml" {
			fileList = append(fileList, path)
		}
		return nil
	}); err != nil {
		return nil, fmt.Errorf("failed walking files in cloned directory %s: %w", dir, err)
	}

	for _, fi := range fileList {
		data, err := os.ReadFile(fi)
		if err != nil {
			return nil, fmt.Errorf("failed to read file %s: %w", fi, err)
		}
		check := &ConfigCheck{}
		if err := yaml.Unmarshal(data, check); err != nil {
			// we need certain keys to unmarshal so we can identify this as an apko config, if it doesn't pass, assume it is not an apko config
			continue
		}

		// skip if this file is not an apko config
		if !check.isApkoConfig() {
			continue
		}

		cfg, err := ReadConfig(fi)
		if err != nil {
			return nil, fmt.Errorf("failed to read apko config %s: %w", fi, err)
		}
		relativeFilename, err := filepath.Rel(dir, fi)
		if err != nil {
			return nil, fmt.Errorf("failed to get relative path from dir %s and file %s: %w", dir, fi, err)
		}

		nolint, err := findNoLint(fi)
		if err != nil {
			return nil, fmt.Errorf("failed to read apko config %s: %w", fi, err)
		}

		p = append(p, Config{
			Config:   *cfg,
			Filename: relativeFilename,
			Dir:      dir,
			NoLint:   nolint,
		})
	}
	fmt.Printf("found %[1]d configs\n", len(p))
	return p, nil
}

// ReadConfig reads a single apko config from the provided filename.
func ReadConfig(filename string) (*types.ImageConfiguration, error) {
	var ic types.ImageConfiguration
	if err := ic.Load(filename, nil); err != nil {
		return nil, err
	}
	return &ic, nil
}
