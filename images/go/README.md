# go-build

## How to use

```
apko build .apko.yaml go-build go-build.tar
```

```
docker load < go-build.tar
```

```
docker run --rm -v $(pwd):/workspace -w /workspace go-build go build -o hello hello.go
```

```
docker run --rm -v $(pwd):/workspace -w /workspace go-build ./hello
```
