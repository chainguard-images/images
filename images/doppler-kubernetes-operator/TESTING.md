# TESTING.md

## Create a local cluster with kind

Using kind you can create your local cluster

```shell
kind create cluster
```

## Using Helm
You can install the latest Helm chart with:
```shell
helm repo add doppler https://helm.doppler.com
helm install --generate-name doppler/doppler-kubernetes-operator
```

You can upgrade using the latest helm chart. It's important to note that the CRD is not automatically updated if you just perform a simple helm upgrade. As such, be sure you follow this process:

```shell
helm repo update
helm pull doppler/doppler-kubernetes-operator --untar
kubectl apply -f doppler-kubernetes-operator/crds/all.yaml
```

## Doppler Service Token

Generate a Doppler Service Token and use it in this command to create your Doppler token secret:

```shell
kubectl create secret generic doppler-token-secret \
  --namespace doppler-operator-system \
  --from-literal=serviceToken=dp.st.dev.XXXX
```

If you have the Doppler CLI installed, you can generate a Doppler Service Token from the CLI and create the Doppler token secret in one step:

Note: This command will generate a Personal Token, which has the same access permissions as your user. If you're on the Developer plan or just doing a quick test to see how this works, that should be fine. However, if you're on the Team plan or higher and this is for an actual deployment, we recommend using a Service Account token instead.

```shell
kubectl create secret generic doppler-token-secret \
  --namespace doppler-operator-system \
  --from-literal=serviceToken=$(doppler configs tokens create doppler-kubernetes-operator --plain)
```

## Doppler Token Secret
Next, we'll create a DopplerSecret that references your Doppler token secret and defines the location of the managed secret.

```yaml
# dopplersecret.yaml
apiVersion: secrets.doppler.com/v1alpha1
kind: DopplerSecret
metadata:
  name: dopplersecret-test
  namespace: doppler-operator-system
spec:
  tokenSecret:
    name: doppler-token-secret
  managedSecret:
    name: doppler-test-secret
    namespace: default
    type: Opaque
```
To add the secret to your cluster 

```shell
kubectl apply -f dopplersecret.yaml
```

Check that the associated Kubernetes secret has been created:

```shell
kubectl describe secrets --selector=secrets.doppler.com/subtype=dopplerSecret
```

## Deployment

The envFrom field will populate a container's environment variables using the secret's Key-Value pairs:

```yaml
# deployment-envfrom.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: doppler-test-deployment-envfrom
  annotations:
    secrets.doppler.com/reload: 'true'
spec:
  replicas: 2
  selector:
    matchLabels:
      app: doppler-test
  template:
    metadata:
      labels:
        app: doppler-test
    spec:
      containers:
        - name: doppler-test
          image: alpine
          command:
            - /bin/sh
            - -c
            # Print all non-Kubernetes environment variables
            - apk add --no-cache tini > /dev/null 2>&1 &&
              echo "### This is a simple deployment running with this env:" &&
              printenv | grep -v KUBERNETES_ &&
              tini -s tail -f /dev/null
          imagePullPolicy: Always
          envFrom:
            - secretRef:
                name: doppler-test-secret # Kubernetes secret name
          resources:
            requests:
              memory: '250Mi'
              cpu: '250m'
            limits:
              memory: '500Mi'
              cpu: '500m'

```

```shell
kubectl apply -f config/samples/deployment-envfrom.yaml
```

Once the Deployment has completed, you can view the logs of the test container:

```shell
kubectl logs -lapp=doppler-test --tail=-1
```
