package commands

import (
	"bytes"
	"encoding/json"
	"os"
	"reflect"
	"testing"

	"github.com/chainguard-images/images/monopod/pkg/images"
)

func TestMatrix(t *testing.T) {
	tests := []struct {
		name    string
		matrix  *matrixImpl
		want    *matrixResponse
		wantErr bool
	}{
		{
			name: "affects single image",
			matrix: &matrixImpl{
				ModifiedFiles:  "images/apko/main.tf",
				Shard:          0,
				ShardingFactor: 1,
			},
			want: &matrixResponse{
				Include: []images.Image{{
					ImageName: "apko",
				}},
			},
			wantErr: false,
		},
		{
			name: ".github",
			matrix: &matrixImpl{
				ModifiedFiles:  ".github/workflows/digestabot.yaml",
				Shard:          0,
				ShardingFactor: 1,
			},
			want: &matrixResponse{
				Include: []images.Image{
					{ImageName: "apko"},
					{ImageName: "curl"},
					{ImageName: "etcd"},
				},
			},
			wantErr: false,
		},
		{
			name: ".github and image",
			matrix: &matrixImpl{
				ModifiedFiles:  "images/apko/main.tf,.github/workflows/digestabot.yaml",
				Shard:          0,
				ShardingFactor: 1,
			},
			want: &matrixResponse{
				Include: []images.Image{
					{ImageName: "apko"},
					{ImageName: "curl"},
					{ImageName: "etcd"},
				},
			},
			wantErr: false,
		},
		{
			name: "bypass disabled",
			matrix: &matrixImpl{
				ModifiedFiles:  "withdrawn-repos.txt,.github/workflows/digestabot.yaml",
				Shard:          0,
				ShardingFactor: 1,
			},
			want: &matrixResponse{
				Include: []images.Image{
					{ImageName: "apko"},
					{ImageName: "curl"},
					{ImageName: "etcd"},
				},
			},
			wantErr: false,
		},
		{
			name: "bypass withdrawn-repos",
			matrix: &matrixImpl{
				ModifiedFiles:  "withdrawn-repos.txt,withdrawn-images.txt",
				Shard:          0,
				ShardingFactor: 1,
			},
			want: &matrixResponse{
				Include: []images.Image{},
			},
			wantErr: false,
		},
	}

	// Navigate to the testdata folder so that the test has access to the images
	// folder.
	err := os.Chdir("testdata")
	if err != nil {
		panic(err)
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			var output bytes.Buffer
			tt.matrix.Output = &output

			if err := tt.matrix.Do(); (err != nil) != tt.wantErr {
				t.Errorf("Do() error = %v, wantErr %v", err, tt.wantErr)
			}

			var got matrixResponse
			if err := json.Unmarshal(output.Bytes(), &got); err != nil {
				t.Fatalf("Failed to unmarshall output: %v", err)
			}
			if !reflect.DeepEqual(&got, tt.want) {
				t.Errorf("got %s but wanted %s", got, tt.want)
			}
		})
	}
}
