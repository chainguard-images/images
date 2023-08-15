# Ingress-nginx upstream e2e tests 


1. Create a kind cluster or any kubernetes cluster 
2. Create ingress-nginx image with terraform 
3. Load images onto the cluster 
4. Run e2e tests

## 1. Create a kind cluster or any kubernetes cluster 

kind create cluster --name kind --config images/ingress-nginx-controller/tests/kind.yaml 

e2e tests expect the kubeconfig to be in a seperate file 

kind export kubeconfig --name kind --kubeconfig $HOME/.kube/kind-config-kind

## 2. Create ingress-nginx image with terraform 

terraform plan -target module.ingress-nginx-controller -var='extra_repositories=["/Users/strongjz/Documents/code/go/src/github.com/wolfi-dev/os/packages"]' -var='extra_keyring=["/Users/strongjz/Documents/code/go/src/github.com/wolfi-dev/os/local-melange.rsa.pub"]' -out plan.out -var=target_repository=ttl.sh/strongjz -var='archs=["arm64"]' && terraform apply plan.out 

## 3. Load images onto the cluster 

The ingres-nginx controller images need to be loaded onto the kind cluster since they are not pulling from a real registry 

export IMAGE=ttl.sh/strongjz/ingress-nginx-controller@sha256:c8fc4c1444f418c251450a021db00caaf2454601b674f66c541dcf01f40f454d

docker pull $IMAGE

docker tag $IMAGE ingress-controller/controller:1.0.0-dev

KIND_WORKERS=$(kind get nodes --name="${KIND_CLUSTER_NAME}" | grep worker | awk '{printf (NR>1?",":"") $1}')

kind load docker-image --name=kind --nodes="${KIND_WORKERS}" ingress-controller/controller:1.0.0-dev


## 4. Run e2e tests

DEBUG=true KIND_CLUSTER_NAME=kind SKIP_INGRESS_IMAGE_CREATION=true SKIP_CLUSTER_CREATION=true make kind-e2e-test



[FAILED] 
        Error Trace:    /go/src/k8s.io/ingress-nginx/test/e2e/framework/k8s.go:87
                                                /go/src/k8s.io/ingress-nginx/test/e2e/framework/framework.go:421
                                                /go/src/k8s.io/ingress-nginx/test/e2e/framework/k8s.go:90
                                                /go/src/k8s.io/ingress-nginx/test/e2e/annotations/proxy.go:147
                                                /go/src/k8s.io/ingress-nginx/.modcache/github.com/onsi/ginkgo/v2@v2.9.5/internal/node.go:463
                                                /go/src/k8s.io/ingress-nginx/.modcache/github.com/onsi/ginkgo/v2@v2.9.5/internal/suite.go:863
                                                /usr/local/go/src/runtime/asm_arm64.s:1172
        Error:          Expected nil, but got: &errors.errorString{s:"timed out waiting for the condition"}
        Test:           [Annotations] proxy-* should not set invalid proxy timeouts
        Messages:       creating ingress
  
  In [It] at: /go/src/k8s.io/ingress-nginx/test/e2e/framework/k8s.go:87 @ 08/15/23 16:44:45.555

  There were additional failures detected.  To view them in detail run ginkgo -vv