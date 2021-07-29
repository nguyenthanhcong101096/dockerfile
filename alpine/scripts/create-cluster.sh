#!/bin/bash
service docker start
curl -sfL https://get.k3s.io | sh -s - --docker
cat /var/lib/rancher/k3s/server/node-token
