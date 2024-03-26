
# kind
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.11.1/kind-$(uname)-amd64"
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# create k8s cluster

cat > jenkins-config.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  apiServerAddress: "192.168.31.229" # your_vm_ip
  apiServerPort: 58350
EOF

kind create cluster --config jenkins-config.yaml

kubectl cluster-info --context kind-kind
kubectl get nodes
kubectl get all --namespace=kube-system

#kind delete cluster
