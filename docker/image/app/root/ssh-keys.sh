#!/bin/bash

mkdir -p /root/.ssh

ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

echo "$(echo "$SSH_PRIVATE_KEY" | base64 --decode)" > /root/.ssh/id_rsa

chmod 400 /root/.ssh/id_rsa
