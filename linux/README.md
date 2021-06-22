# Dockerfile

### 1. Ubuntu with ssh
```
# run container
docker run -d --name linux -p 80:80 -p 22:22 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro congttl/linux
# ssh to linux
ssh -i key.pem app@localhost
```
