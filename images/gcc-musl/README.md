# c-build

## How to use

```
apko build .apko.yaml c-build c-build.tar
```

```
docker load < c-build.tar
```

```
docker run --rm -v $(pwd):/workspace -w /workspace c-build gcc hello.c -o hello
```

```
docker run --rm -v $(pwd):/workspace -w /workspace c-build ./hello
```
