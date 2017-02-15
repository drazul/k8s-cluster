# How to set up your own kubernetes cluster

## k8s-meetup for Agile-CR

In this repository you can find a Vagrant file to setup 2 centos7 VM provisioned with a basic configuration to mount to easily Kubernetes cluster over docker.

## Files
 * On doc folder you can find a PDF file used on speech on Agile CR group
 * On resources you can find a k8s config files for some resources used on speech

## Instructions

1. Create several VM with vagrant or mount your own infrastructure

2. Install and configure docker engine

3. Clone https://github.com/kubernetes/kube-deploy

4. Export your IP as 'export IP_ADDRESS=X.X.X.X' on all nodes
..* On master node execute master.sh on kube-deploy/docker-multinode
..* On worker node export master IP as 'export MASTER_IP=X.X.X.X' and execute worker.sh on kube-deploy/docker-multinode

5. Now you can use config files on resources folder


## Demo

 * You can create a secret with:
...kubectl create secret generic nginx-website --from-file=./index.html

 * You can create a replication controller with:
...kubectl create -f nginx-replication-controller-v1.yaml

 * You can update you replication controller with:
...kubectl rolling-update nginx-replication-controller-v1 -f nginx-replication-controller-v2.yaml
....**Note:** During the update 1. a new replication controller will be started, 2. both replication controllers will be working some minutes and 3. old replication controller will be stopped.


