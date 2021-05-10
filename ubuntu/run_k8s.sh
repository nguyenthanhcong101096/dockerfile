#!/bin/bash

sudo systemctl daemon-reload

systemctl start docker.service

sudo systemctl restart kubelet

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=Swap --ignore-preflight-errors=SystemVerification --ignore-preflight-errors=FileContent--proc-sys-net-bridge-bridge-nf-call-iptables

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
