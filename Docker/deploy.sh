#!/bin/sh

# Namespace name
namespace_name="plog-plog"

# Create the namespace
kubectl create namespace "$namespace_name"
echo "Namespace $namespace_name created."


# Loop through all YAML files in the current directory and apply them
for file in *.yaml; do
  if [ -f "$file" ]; then
    echo "Applying $file to namespace $namespace_name"
    kubectl apply -f "$file" --namespace "$namespace_name"
    echo ""
  fi
done

# Apply secrets.yaml to the namespace
echo "Applying secrets.yaml to namespace $namespace_name"
kubectl apply -f secrets.yaml --namespace "$namespace_name"
echo ""

# Apply configmap.yaml to the namespace
echo "Applying configmap.yaml to namespace $namespace_name"
kubectl apply -f config-map.yaml --namespace "$namespace_name"
echo ""

kubectl config set-context --current --namespace=$namespace_name

echo "All YAML files in the current directory applied successfully"
echo "Lets Start Plogathon today!"
echo ""

kubectl get all

