# Xinference

Xorbits Inference(Xinference) is a powerful and versatile library designed to serve language, speech recognition, and multimodal models.

## Prerequisites

This example assumes that you have a Kubernetes cluster installed and running, and that you have installed the kubectl command line tool and helm somewhere in your path. Please see the [getting started](https://kubernetes.io/docs/setup/)  and [Installing Helm](https://helm.sh/docs/intro/install/) for installation instructions for your platform.

Also, this example requires kubeblocks installed and running. Here is the steps to install kubeblocks, please replace "`$kb_version`" with the version you want to use.
```bash
# Add Helm repo
helm repo add kubeblocks https://apecloud.github.io/helm-charts
# If github is not accessible or very slow for you, please use following repo instead
helm repo add kubeblocks https://jihulab.com/api/v4/projects/85949/packages/helm/stable

# Update helm repo
helm repo update

# Get the versions of KubeBlocks and select the one you want to use
helm search repo kubeblocks/kubeblocks --versions
# If you want to obtain the development versions of KubeBlocks, Please add the '--devel' parameter as the following command
helm search repo kubeblocks/kubeblocks --versions --devel

# Create dependent CRDs
kubectl create -f https://github.com/apecloud/kubeblocks/releases/download/v$kb_version/kubeblocks_crds.yaml
# If github is not accessible or very slow for you, please use following command instead
kubectl create -f https://jihulab.com/api/v4/projects/98723/packages/generic/kubeblocks/v$kb_version/kubeblocks_crds.yaml

# Install KubeBlocks
helm install kubeblocks kubeblocks/kubeblocks --namespace kb-system --create-namespace --version="$kb_version"
```
Enable xinference
```bash
# Add Helm repo
helm repo add kubeblocks-addons https://apecloud.github.io/helm-charts
# If github is not accessible or very slow for you, please use following repo instead
helm repo add kubeblocks-addons https://jihulab.com/api/v4/projects/150246/packages/helm/stable
# Update helm repo
helm repo update

# Enable xinference
helm upgrade -i kb-addon-xinference kubeblocks-addons/xinference --version $kb_version -n kb-system
```
- Create K8s Namespace `demo`, to keep resources created in this tutorial isolated:

  ```bash
  kubectl create ns demo
  ```

## Examples

### [Create](cluster.yaml)
Create a xinference cluster with specified cluster definition
```bash
kubectl apply -f examples/xinference/cluster.yaml
```

### [Vertical scaling](verticalscale.yaml)
Vertical scaling up or down specified components requests and limits cpu or memory resource in the cluster
```bash
kubectl apply -f examples/xinference/verticalscale.yaml
```

### [Restart](restart.yaml)
Restart the specified components in the cluster
```bash
kubectl apply -f examples/xinference/restart.yaml
```

### [Stop](stop.yaml)
Stop the cluster and release all the pods of the cluster, but the storage will be reserved
```bash
kubectl apply -f examples/xinference/stop.yaml
```

### [Start](start.yaml)
Start the stopped cluster
```bash
kubectl apply -f examples/xinference/start.yaml
```

### Delete
If you want to delete the cluster and all its resource, you can modify the termination policy and then delete the cluster
```bash
kubectl patch cluster -n demo xinference-cluster -p '{"spec":{"terminationPolicy":"WipeOut"}}' --type="merge"

kubectl delete cluster -n demo xinference-cluster
```
