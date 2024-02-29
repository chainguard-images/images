
## STEPS:
1. Create a kind cluster

## 1. Create kind cluster

kind create cluster --name helm --config kind-config.yaml

- set the context
kind export kubeconfig --name helm --kubeconfig $HOME/.kube/kind-config

//TODO