# Testing the AWS EFS CSI Driver

This describes how to test our AWS EFS CSI Driver images on a real EKS cluster.

The AWS EFS CSI Driver infrastructure relies on two components, a controller Deployment and a DaemonSet, each of which have use the same image.

The Deployment is "EFS CSI Controller" (`efs-csi-controller`) and the DaemonSet is "EFS CSI Node" (`efs-csi-node`), and we'll test them together.

These components require being run on an EKS cluster to be able to hit metadata servers to impersonate real AWS identities, so these tests can't be automated easily in CI.

First things first, we need to build and publish the images we'll be testing to somewhere public temporarily, and ttl.sh registry is a good place for that.

```shell
apko publish images/aws-efs-csi-driver/configs/latest.apko.yaml ttl.sh/aws/efs-csi-driver
```

The next thing, as a prerequisite, we should set up the driver permissions as it will use the Amazon EFS to manage the volume on user's behalf. To do that, you can refer to the README of the project, [here](https://github.com/kubernetes-sigs/aws-efs-csi-driver#set-up-driver-permission).

Once you set up everything, you can deploy the driver to your cluster by using Helm chart.

```shell
cat <<EOF >> override.yaml
image:
  repository: ttl.sh/aws/efs-csi-driver
  tag: latest

controller:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::$AWS_ACCOUNT_ID:role/efs-csi-role

node:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::$AWS_ACCOUNT_ID:role/efs-csi-role
EOF
```

> Note: You need to replace `$AWS_ACCOUNT_ID` with your AWS account ID. When you follow up the documentation for setting up the IAM Permissions, you should end up having a role `efs-csi-role`, this is the where you specify the IAM role for the Kubernetes ServiceAccounts for the driver.

```shell
helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver/
helm repo update
helm upgrade --install \
    aws-efs-csi-driver \
    --namespace kube-system \
    -f override.yaml \
    aws-efs-csi-driver/aws-efs-csi-driver
```
Now we can proceed with the rest of the steps as normal.

You can follow up the examples documentation of the project, [here](https://github.com/kubernetes-sigs/aws-efs-csi-driver/blob/master/docs/README.md#examples).

To clean up, you can delete your EKS cluster.
