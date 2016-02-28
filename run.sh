#!/bin/bash

# Install SSH keys
mkdir -p ~/.ssh
echo $JENKINS_PUBLIC_KEY | sed 's/\\\\n/\n/g' > ~/.ssh/authorized_keys
echo $GITLAB_SSH_PRIVATE_KEY | sed 's/\\\\n/\n/g' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo -e "Host gitlab.u-test-factory.org\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

# Run sshd
/usr/sbin/sshd -D
