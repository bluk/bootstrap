#!/bin/bash -eux

xcode-select -p >/dev/null
if [ $? -ne 0 ]; then
  echo "Installing Xcode CLI Tools"
  xcode-select --install
fi

if [[ ! -x /usr/local/bin/brew ]]; then
  echo "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ ! -x /usr/local/bin/ansible ]]; then
  echo "Installing Ansible"
  pip install ansible
fi

ansible-galaxy install -r requirements.yml

ansible-playbook -i inventory main.yml
