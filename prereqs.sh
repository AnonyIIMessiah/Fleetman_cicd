#!/usr/bin/env bash

# This script will install EKS prerequisites on Amazon Linux or Amazon Linux 2
# * kubectl
# * aws-iam-authenticator
# * AWS CLI

set -e

mkdir -p $HOME/bin
echo 'export PATH=$HOME/bin:$PATH' >>~/.bashrc


# eksctl
if ! type eksctl >/dev/null 2>&1; then
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
	mv /tmp/eksctl $HOME/bin
	echo 'eksctl installed'
else
	echo 'eksctl already installed'
fi

# kubectx/kubens
if ! type kubectx >/dev/null 2>&1; then
	git clone https://github.com/ahmetb/kubectx /opt/kubectx
	ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
	ln -s /opt/kubectx/kubens /usr/local/bin/kubens
	echo 'kubectx installed'
else
	echo 'kubectx already installed'
fi

# Test if AWS credentials exist
aws sts get-caller-identity