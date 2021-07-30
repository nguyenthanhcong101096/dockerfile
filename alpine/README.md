# Dockerfile

### 1. Ubuntu with ssh
```
# run container
docker run -d --name alpine -p 443:443 -p 80:80 -p 22:22 --privileged congttl/alpine
# ssh to alpine
ssh -i key.pem app@localhost
```
