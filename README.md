# Dockerfile

### 1. Ubuntu container
```
# create volume on machine
mkdir data_container

# run container
docker run -d --privileged=true -v data_container:/var/data_host -p 22:22 -p 80:80 congttl/ubuntu:latest

# ssh to ubuntu
ssh -i key.pem app@localhost
```
