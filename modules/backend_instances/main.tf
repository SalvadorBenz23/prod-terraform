resource "aws_instance" "backend_instance" {
  count           = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = element(var.private_app_subnet_ids, count.index % length(var.private_app_subnet_ids))
  security_groups = [var.security_group_id]
  key_name         = var.key_name

  user_data = <<-EOF
    #!/bin/bash

    # Log file for debugging
    exec > /var/log/user-data.log 2>&1
    set -e

    echo "Starting user-data script"

    # Function to check for network availability
    wait_for_network() {
      until ping -c1 google.com &>/dev/null; do
        echo "Waiting for network..."
        sleep 5
      done
    }

    # Wait for network to be available
    wait_for_network

    echo "Updating package information..."
    sudo apt-get update -y || { echo "Failed to update package information"; exit 1; }

    echo "Installing Apache httpd..."
    sudo apt-get install -y apache2 || { echo "Failed to install Apache httpd"; exit 1; }
    sudo systemctl start apache2
    sudo systemctl enable apache2

    echo "Installing Docker..."
    sudo apt-get install -y docker.io || { echo "Failed to install Docker"; exit 1; }
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker $USER
    sudo chmod 666 /var/run/docker.sock

    echo "Installing kubectl..."
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl || { echo "Failed to install kubectl"; exit 1; }

    echo "Installing minikube..."
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mv minikube /usr/local/bin/minikube || { echo "Failed to install minikube"; exit 1; }

    echo "Installing helm"
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

    echo "Installing git..."
    sudo apt-get install -y git || { echo "Failed to install git"; exit 1; }

    echo "Cloning repo"
    git clone https://github.com/sunnyeyles/DS-Project.git /home/ubuntu/DS-Project || { echo "Err: Failed to clone repo"; exit 1; }

    # Verify the directory structure
    if [ ! -d "/home/ubuntu/DS-Project/server-backend-helm-chart/HELM" ]; then
        echo "Err: HELM directory does not exist"
        exit 1
    fi
    
    echo "Setting up Minikube to start as a non-root user"
    sudo -i -u ubuntu bash << EOF2
    cd /home/ubuntu/DS-Project/server-backend-helm-chart/HELM
    alias kubectl="minikube kubectl --"
    echo "Starting minikube"
    minikube start --driver=docker --force || { echo "Failed to start Minikube"; exit 1; }
    echo "Installing the charts"
    helm install my-release . --values=values-dev.yaml || { echo "Failed to install dev Helm chart"; exit 1; }
    helm install prod-release . --values=values-prod.yaml || { echo "Failed to install prod Helm chart"; exit 1; }
    EOF2

    echo "User-data script completed"
  EOF

  tags = {
    Name = "BackendInstance${count.index + 1}"
  }
}
