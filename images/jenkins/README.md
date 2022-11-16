## Using Jenkins

To test out the Chainguard Jenkins image you can run
```sh
docker run --rm -v $PWD/data:/var/jenkins_home -p 8080:8080 -ti cgr.dev/chainguard/jenkins:experimental
```

And visit Jenkins in your brower http://localhost:8080

And if you want to backup your Jenkins data, mount the  volume
```sh
docker run --rm -v $PWD/data:/var/jenkins_home -p 8080:8080 -ti cgr.dev/chainguard/jenkins:experimental
```