#!/bin/sh

# Get the current directory
current_dir=$(pwd)

# Get the parent directory
parent_dir=$(dirname "$(pwd)")

# Change to the parent directory
cd "$parent_dir"

# Find all folders ending with "-service" in the parent directory
service_folders=(*-service)

# Namespace name
namespace_name="plog-plog"

# Create the namespace
kubectl create namespace "$namespace_name"

# Loop through the service folders and build Docker images
for service_dir in $service_folders; do
  full_service_name=$(basename "$service_dir")
  service_name="${full_service_name%-service}" 
  echo "Building Docker image for skyish/$service_name..."
  docker build -t "skyish/$service_name:latest" "$service_dir"

  # Push to skyish registry
  docker push "skyish/$service_name:latest"
done

echo "Docker image build completed."
