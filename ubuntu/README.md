# Dockerfile

### 1. Ubuntu with ssh
```
# create volume on machine
mkdir data_container

# run container
docker run -d --name ubuntu--privileged -v data_container:/path -p 22:22 -p 80:80 congttl/ubuntu

# ssh to ubuntu
ssh -i key.pem app@localhost
```

### 1. Ubuntu with docker, k8s, ...

**run docker**
```
docker run -d --name k8s -p 80:80 -p 22:22 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro congttl/ubuntu:k8s
```

**run k8s**
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --ignore-preflight-errors=Swap --ignore-preflight-errors=SystemVerification --ignore-preflight-errors=FileContent--proc-sys-net-bridge-bridge-nf-call-iptables

kubectl taint node master.xtl node-role.kubernetes.io/master-
```

**run docker**
```
sudo swapoff -a

systemctl daemon-reload

sudo systemctl start docker
```