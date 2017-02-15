#!/usr/bin/env bash

systemctl stop firewalld
systemctl disable firewalld

tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum update -y
yum install tmux git docker-engine -y
systemctl enable docker.service
systemctl restart docker

git clone https://github.com/kubernetes/kube-deploy

curl -O https://storage.googleapis.com/kubernetes-release/release/v1.4.3/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/bin/kubectl

mkdir -p /var/www

echo "<h1>Example replication controler v1</h1>" > /var/www/index.html

# export IP_ADDRESS=
# export MASTER_IP=

# i=0;while true; do echo $i;curl http://192.168.100.5:31646;i=$((i + 1)); done; 


