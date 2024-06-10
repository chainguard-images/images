## A Guide for Testing the Teleport image

### Step 1: Navigate to your preferred Kubernetes Cluster & install Teleport
Most organizations usually have more than one Kubernetes cluster, so the assumption is that you have a certain Kubernetes cluster you want to try using Teleport on. Navigate to the context of that Kubernetes cluster using your preferred tool. I'm using Kubie in my case.

Next, run this command to add the teleport chart to your charts repository:

```bash
helm repo add teleport https://charts.releases.teleport.dev
helm repo update
```

Then, create the namespace. Note the docs mention adding a label to it, which is why we are creating it in advance, vs letting helm create it:

```bash
kubectl create namespace teleport-cluster
kubectl label namespace teleport-cluster 'pod-security.kubernetes.io/enforce=baseline'
```

The next thing you'll be required to do is install a single node teleport-cluster, provision a cert using ACME, and switch to the context of the teleport cluster by running the command below on your CLI:

> Note: As Chainguard provides only :latest tag for public images you cannot use the :latest tag for `teleportVersionOverride` variable as its only accepts semver type of version number. 
> Due to that limitation you should clone this image with semver tag and use it in the helm install command.
> https://github.com/gravitational/teleport/blob/1e92d5e90223fc69ca75d00da4c350808dc56c2a/examples/chart/teleport-cluster/charts/teleport-operator/templates/_helpers.tpl#L38-L40
> Or you could use helm --version X for Teleport version.

```bash
helm install teleport teleport/teleport-cluster \
  --namespace=teleport-cluster \
  --set clusterName=${CLUSTER_NAME?} \
  --set acme=true \
  --set acmeEmail=${EMAIL} \
  --set image=cgr.dev/chainguard/teleport \
  # -set teleportVersionOverride=15.3.7 or --version 15.3.7
```

Don't forget to update the --clusterName with a unique hostname (teleport.example.com) which will serve as the public endpoint to your Kubernetes cluster (we will eventually set this up for DNS later using the teleport-cluster external load balancer IP address) and set the --acmeEmail to use an email address that will be receiving correspondence from the Letsencrypt certificate authority.

For context, the single node teleport-cluster contains:

* **The Teleport Auth** Service which is in charge of issuing certificates & conducting authentication challenges.
* **The Teleport Proxy** service which handles user requests, forwards user credentials to the Auth Service & communicates with Teleport instances that enable access to specific resources in your infrastructure.

### Step 2: Setup DNS for the hostname and IP address
The IP address of the teleport-cluster external load balancer will be used to set up DNS for the hostname you added when you were setting up --clusterName.

To confirm the teleport-cluster is running, run this command:

```bash
kubectl get pod --namespace=teleport-cluster
```

Then run the following command to view the pod's external IP address:

```bash
kubectl get services --namespace=teleport-cluster
```

Copy the external IP address and go over to your DNS provider and create a DNS record for the hostname and external IP.

This will take a couple of minutes or hours to propagate. You can use dig to confirm if the DNS records are propagated and curl to confirm that Teleport is running.

You should be able to access the teleport UI now via:

- https://teleport.example.com

#### Step 3: Create a local user
Even though Teleport allows adding a Single sign-on authentication scheme, it is advisable to create a local user (a Kubernetes role object that can be used to assign roles to your teammates) as it serves as a reliable fallback when an SSO provider is down.

Create a local user by adding the YAML content below into a **local-users.yaml** file. The YAML configuration file below contains data that will create a Kubernetes role object named member.

```yaml
kind: role
version: v5
metadata:
  name: member
spec:
  allow:
    kubernetes_groups: ["system:masters"]
    kubernetes_labels:
      '*': '*'
    rules:
    - resources:
      - '*'
      verbs:
      - '*'
```
Before creating a role with the local-users.yaml file, run this command to get the exact name of teleport-cluster pod and map it to a variable named POD:

```bash
POD=$(kubectl get pod -l app=teleport-cluster --namespace=teleport-cluster -o jsonpath='{.items[0].metadata.name}')
```
Now, create the role by running this command:

```bash
kubectl exec --namespace=teleport --namespace=teleport-cluster -i ${POD?} -- tctl create -f < local-users.yaml
```

Add a user named "joe" to the role by running this command:

```bash
kubectl exec --namespace=teleport -ti ${POD?} -- tctl users add joe --roles=member,access,editor
```

This will generate a link that we can send to the user we just added to give them access to Teleport. Anyone who clicks on the link (https://teleport.example.com) will be directed to the Teleport Welcome page and will need to click on Get Started to trigger the account creation process, add the required information and click the "Create Account" button to access the team's Kubernetes cluster.

#### Step 4: Connect to the Kubernetes cluster
Now, let's assume user `joe` wanted to access the Kubernetes cluster you've just added to Teleport. He'll typically go to the hostname you gave to the cluster (e.g., teleport.example.com). On the web interface, he'll click on the connect button, which will display a list of commands he needs to run to connect to the Kubernetes cluster.

Joe will then run `tsh kube ls` to list the clusters he is connected to via Teleport and then run `tsh kube login teleport.example.com` to connect to the specified cluster. If this works as expected, joe will now be able to access the resources inside the Kubernetes cluster (of course, only the resources she's been given access to by the admin of the K8s cluster).

```bash
KUBECONFIG=$HOME/teleport-kubeconfig.yaml tsh login --proxy=teleport.example.com --user=joe
```

Also, the tsh client tool updates your local kubeconfig to point to your Teleport cluster, so we will assign KUBECONFIG to a temporary value during the installation process. This way, if something goes wrong, you can easily revert to your original kubeconfig:

```bash
$ KUBECONFIG=$HOME/teleport-kubeconfig.yaml kubectl get -n teleport pods
NAME                                      READY   STATUS    RESTARTS   AGE
teleport-cluster-auth-5f8587bfd4-p5zv6    1/1     Running   0          48s
teleport-cluster-proxy-767747dd94-vkxz6   1/1     Running   0          48s
```