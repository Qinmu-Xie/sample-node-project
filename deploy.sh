#!/bin/bash
docker build -t qinmux/sample-node .
docker push qinmux/sample-node

docker pull qinmux/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi qinmux/sample-node:current || true
docker tag qinmux/sample-node:latest qinmux/sample-node:current
docker run -d --restart always --name web -p 3000:3000 qinmux/sample-node:current
