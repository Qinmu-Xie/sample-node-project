#!/bin/bash
docker push qinmux/sample-node

ssh ubuntu@54.222.179.18 << EOF
sudo docker pull qinmux/sample-node:latest
sudo docker stop web || true
sudo docker rm web || true
sudo docker rmi qinmux/sample-node:current || true
sudo docker tag qinmux/sample-node:latest qinmux/sample-node:current
sudo docker run -d --restart always --name web -p 3000:3000 qinmux/sample-node:current
EOF
