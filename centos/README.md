## Run container centos

```
docker run -ti --privileged=true --tmpfs /run -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d -p 22:22 congttl/centos
```
