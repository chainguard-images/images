<!--monopod:start-->
# kube-vip
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/kube-vip` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/kube-vip/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Kubernetes Control Plane Virtual IP and Load-Balancer
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/kube-vip:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

You can test the kube-vip in several ways. Here is an example of how to deploy the kube-vip controller into KinD (Kubernetes in Docker) cluster:

Find Address Pool for kube-vip:

```bash
docker network inspect kind -f '{{ range $i, $a := .IPAM.Config }}{{ println .Subnet }}{{ end }}'
```

This will return a CIDR range such as `172.18.0.0/16` which you can use as the `range-global` for the kube-vip ConfigMap.

Deploy the kube-vip Cloud Controller:

```bash
kubectl apply -f https://raw.githubusercontent.com/kube-vip/kube-vip-cloud-provider/main/manifest/kube-vip-cloud-controller.yaml
```

Create RBAC settings:

```bash
kubectl apply -f https://kube-vip.io/manifests/rbac.yaml
```

Deploy kube-vip as a DaemonSet:

alias kube-vip="docker run --network host --rm cgr.dev/chainguard/kube-vip:latest"

> Note: We noticed that there must be a bug in this command since it didn't create the DaemonSet from the image what we expected so we recommend to use the following command instead:

```bash
kube-vip manifest daemonset --services --inCluster --arp --interface eth0 | kubectl apply -f -

# change the DaemonSet image to the one you want to test
kubectl set image -n kube-system daemonset/kube-vip-ds kube-vip="cgr.dev/chainguard/kube-vip:latest"
```

Check the kube-vip DaemonSet:

```bash
kubectl get daemonset kube-vip-ds -n kube-system
```

Once the DaemonSet is running, now you can test the kube-vip by creating a LoadBalancer service:

```bash
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer --name=nginx
```

Then you should be able to see the LoadBalancer service IP address:

```bash
kubectl get svc
NAME         TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
kubernetes   ClusterIP      10.96.0.1       <none>          443/TCP        74m
nginx        LoadBalancer   10.96.196.235   172.18.100.11   80:31236/TCP   6s
```

That's it. You have kube-vip running and managing the LoadBalancer service on your cluster.

To verify that you could acess the LoadBalancer service, you can use the following command:

```bash
$ docker run -it --net container:kind-control-plane nicolaka/netshoot
# kind-control-plane  ~  curl 172.18.100.11:80
# <!DOCTYPE html>
# <html>
# <head>
# <title>Welcome to nginx!</title>
# <style>
#     body {
#         width: 35em;
#         margin: 0 auto;
#         font-family: Tahoma, Verdana, Arial, sans-serif;
#     }
# </style>
# </head>
# <body>
# <h1>Welcome to nginx!</h1>
# <p>If you see this page, the nginx web server is successfully installed and
# working. Further configuration is required.</p>
# 
# <p>For online documentation and support please refer to
# <a href="http://nginx.org/">nginx.org</a>.<br/>
# Commercial support is available at
# <a href="http://nginx.com/">nginx.com</a>.</p>
# 
# <p><em>Thank you for using nginx.</em></p>
# </body>
# </html>
```
Great! You have kube-vip running and managing the LoadBalancer service on your cluster.

<!--body:end-->
