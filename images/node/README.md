<!--monopod:start-->
# node
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/node` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/node/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for node

Minimal container image for running NodeJS apps

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/node:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Where possible, the Node Chainguard Image is built for compatibility with the [Docker official image for Node](https://hub.docker.com/_/node/).

The Node Chainguard Image runs as a nonroot user (`node`) by default. A `USER root` statement may be required before performing tasks requiring elevated permissions.

## Getting Started

### Example: Distroless CLI Application

In this example, we'll write a `.js` script that prints a message, then prints the message reversed. The script will use one dependency, the [`text-reverse`](https://www.npmjs.com/package/text-reverse) package. The script will optionally take one positional argument—if no argument is passed, a default message will be printed and reversed, otherwise the passed argument will be printed and reversed.

First, let's create a project structure for our example:

```sh
mkdir -p ~/node-reverse/bin && cd ~/node-reverse
```

This creates the following folder structure and sets our working directory to the root `node-reverse`folder:

```
node-reverse
└── bin
```

Now let's create a `package.json` file, which provides metadata about the project, including dependencies:

```sh
cat << 'EOF' > package.json
{
    "name": "linky_hello",
    "version": "1.0.0",
    "description": "Say hello to Linky",
    "main": "bin",
    "bin": {
        "linky_hello": "./bin/index.js"
    },
    "keywords": [],
    "author": "",
    "license": "ISC",
    "dependencies": {
        "text-reverse": "^1.0.0"
    }
}
EOF
```

The above defines a package, `linky_hello`, that depends on `text-reverse`, and which whill run the code in `bin/index.js` on `npm run start`.

Let's create our application code now:

```sh
cat << 'EOF' > bin/index.js
#!/usr/bin/env node

const reverse=require('text-reverse');

const run_argument=process.argv[2]

if (run_argument) {
    console.log(run_argument)
    console.log(reverse(run_argument))    
} else {
    const message="Hello, Linky!"
    const reversed=reverse(message)
    console.log(message  + "🐙")
    console.log("🐙" + reversed)
}
EOF
```

This application code first looks at any arguments passed to the script. If a positional argument is passed when the script is run, it will print that argument, then print its reverse. If no argument is passed, a default message will be printed and reversed.

Finally, let's create a `Dockerfile` for our image build:

```sh
cat << 'EOF' > Dockerfile
FROM cgr.dev/chainguard/node:latest
ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node package.json .
ADD ./bin ./bin
RUN npm install

ENTRYPOINT ["node", "bin/index.js"]
EOF
```

This `Dockerfile` sets the `file NODE_ENV` environment variable to `production`, copies our `package.json` and `bin` directory, installs our dependency with `npm install`, and runs our `.js` script.

Build the image, tagging it `node-reverse`:

```sh
docker build . -t node-reverse
```

Finally, run the container:

```sh
docker run node-reverse
```

You should see the following output:

```
Hello, Linky!🐙
🐙!ykniL ,olleH
```

You can also pass an argument to the `docker run node-reverse` command to change the output:

```sh
docker run node-reverse "Hello, Chainguard User\!"
```

This should produce the following output:

```
Hello, Chainguard User!
!resU draugniahC ,olleH
```

## Example: Express.js Server

In this example, we'll create an [Express.js](https://expressjs.com/) server that allows retrieval of a JSON-formatted list of animals and the addition of new animals via POST request.

First, create a folder for our example:

```sh
mkdir -p ~/node-express && cd $_
```

Create a `package.json` file, which provides metadata about the project, including dependencies:

```sh
cat << 'EOF' > package.json
{
  "name": "Express Server",
  "version": "1.0.0",
  "description": "A server that allows getting and posting dummy data in JSON format",
  "main": "server.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node server.js"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "body-parser": "^1.14.1",
    "express": "^4.13.3"
  }
}
EOF
```

Next, add our server application code:

```sh
cat << 'EOF' > server.js
var express = require('express');
var bodyParser = require('body-parser');
var app = express();

//Allow all requests from all domains
app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With, Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var animals = [
    {
        "id": "234kjw",
        "text": "octopus"
    },
    {
        "id": "as82w",
        "text": "penguin"
    },
    {
        "id": "234sk1",
        "text": "whale"
    }
];


app.get('/animals', function(req, res) {
    console.log("GET From SERVER");
    res.send(animals);
});

app.post('/animals', function(req, res) {
    var animal = req.body;
    console.log(req.body);
    animals.push(animal);
    res.status(200).send("Successfully posted animal\n");
});

console.log("🐙🐧🐋 Server running. Retreive animals from http://localhost:6069/animals")
app.listen(6069);
EOF
```

Finally, create a `Dockerfile` for our image build:

```sh
cat << 'EOF' > Dockerfile
FROM cgr.dev/chainguard/node
ENV NODE_ENV=production

WORKDIR /app

COPY --chown=node:node ["package.json", "server.js", "./"]

RUN npm install --omit-dev

CMD [ "server.js" ]
EOF
```

Build the image:

```sh
docker build . -t node-express
```

Finally, run the server container:

```sh
 docker run --rm -p 6069:6069 node-express
```

You should see the following message:

```
🐙🐧🐋 Server running. Retreive animals from http://localhost:6069/animals
```

Visit [http://localhost:6069/animals](http://localhost:6069/animals) to view the served JSON data.

You can post new data to the running application:

```sh
 curl -H 'Content-Type: application/json' \
 -d '{ "id":9001,"text":"gnu"}' \
 -X POST \
 http://localhost:6069/animals
```

After posting, refresh the page on [http://localhost:6069/animals](http://localhost:6069/animals) to view the additional data.

## Documentation and Resources

- [Chainguard Academy: Getting Started with the Node Chainguard Image](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/node/)
- [Chainguard Academy: How to Port a Sample Application to Chainguard Images](https://edu.chainguard.dev/chainguard/migration/porting-apps-to-chainguard/?utm_source=blog&utm_medium=website&utm_campaign=FY25-EC-Blog_sourced)
- [Learning Lab: Chainguard's Node Image](https://www.chainguard.dev/events/chainguards-node-image)
- [Blog: Migrating a Node.js application to Chainguard Images](https://www.chainguard.dev/unchained/migrating-a-node-js-application-to-chainguard-images)

<!--body:end-->

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._