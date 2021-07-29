#!/bin/bash
service docker start
curl -sfL https://get.k3s.io | K3S_URL=https://master:6443 K3S_TOKEN=K101a87ed195bd96ce2cdcada4089a6f27c095e09e949979610e54bf15a627c1750::server:ecaeb8ad4bb9b37aa49eb6170926b732 sh -s - --docker
