#!/bin/bash

# Install Packer
echo "Installing Packer..."
cd /tmp
curl -k -O "https://releases.hashicorp.com/packer/1.8.3/packer_1.8.3_linux_amd64.zip" &> /dev/null
unzip packer_1.8.3_linux_amd64.zip > /dev/null
mv packer /usr/bin
rm -rf packer_1.8.3_linux_amd64.zip

# Install Terraform
echo "Installing Terraform..."
cd /tmp
curl -k -O "https://releases.hashicorp.com/terraform/1.3.3/terraform_1.3.3_linux_amd64.zip" &> /dev/null
unzip terraform_1.3.3_linux_amd64.zip > /dev/null
mv terraform /usr/bin
rm -rf terraform_1.3.3_linux_amd64.zip

# Install AWS CLI
echo "Installing AWS CLI..."
cd /tmp
curl -k -O "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" &> /dev/null
unzip -qq awscli-exe-linux-x86_64.zip > /dev/null
./aws/install
rm -rf awscli-exe-linux-x86_64.zip
