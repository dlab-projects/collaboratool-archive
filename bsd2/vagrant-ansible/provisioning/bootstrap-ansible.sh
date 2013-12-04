#!/bin/bash

echo Starting $0

apt-get update && \
apt-get -y install python-dev python-setuptools libyaml-dev && \
easy_install pip && \
pip install paramiko PyYAML jinja2 ansible && \
cd /vagrant && \
ansible-playbook -vv -i inventory-localhost provisioning/ana_env.yml
