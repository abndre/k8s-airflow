function docker {
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    sudo apt-get update
    sudo apt install -y docker-ce
    sudo gpasswd -a vagrant docker
}

function docker_compose {
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

function python_pip {
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository universe
    sudo apt-get update
    sudo apt-get install -y python-setuptools
    sudo apt install -y python3-pip
    sudo -H pip3python install --upgrade pip
}

function install_kind {
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
}

function install_k8s {
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
}

function install_helm {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
}

function install_atalhos {
    source <(kubectl completion bash)
    echo "source <(kubectl completion bash)" >> ~/.bashrc 
}

function helm_airflow { 
    helm repo add apache-airflow https://airflow.apache.org
    helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace
}

echo "setup ubuntu"
python_pip
docker
docker_compose
install_kind
install_k8s
install_helm
install_atalhos
echo "end"