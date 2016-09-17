#!/bin/bash
docker push qinmux/sample-node

ssh ubuntu@54.222.179.18 << EOF
docker pull qinmux/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi qinmux/sample-node:current || true
docker tag qinmux/sample-node:latest qinmux/sample-node:current
docker run -d --restart always --name web -p 3000:3000 qinmux/sample-node:current
EOF
