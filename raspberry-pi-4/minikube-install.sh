#useradd -s /bin/bash -d /home/sander/ -m -G sander
#passwd sander
#su - sander
#passwd -l ubuntu

apt update
apt upgrade -y
apt autoremove
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER
newgrp docker
newgrp sander
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-arm64
install minikube-linux-arm64 /usr/local/bin/minikube
apt-get update && apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
swapoff -a
minikube config set driver docker
minikube config set memory 6544
minikube config set cpus 4
#minikube start
cp minikube.service /etc/systemd/system/
systemctl enable minikube
#systemctl start minikube
echo REBOOT-REBOOT-REBOOT