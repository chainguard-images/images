"use strict";

const pulumi = require("@pulumi/pulumi");
const kubernetes = require("@pulumi/kubernetes");

let config = new pulumi.Config();
let name = config.require("name");
let image = config.require("image");

const pod = new kubernetes.core.v1.Pod("pod", {
    metadata: {
        name: name,
    },
    spec: {
        containers: [{
            image: image,
            name: name,
            ports: [{
                containerPort: 8080,
            }],
        }],
    },
});
