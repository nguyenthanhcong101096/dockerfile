# Dockerfile

### 1. Ubuntu with ssh
```
# create volume on machine
mkdir data_container

# run container
docker run -d --name ubuntu -p 80:80 -p 22:22 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro congttl/ubuntu
# ssh to ubuntu
ssh -i key.pem app@localhost
```
