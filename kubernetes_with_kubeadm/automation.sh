#!/bin/bash
loc=$(dirname "$0")
cd $(pwd)/$loc

bash roles/change-hostname-and-hosts-files/tasks/main.sh
ansible-playbook roles/install-kubernetes/tasks/main.yml
ansible-playbook roles/create-user/tasks/main.yml
ansible-playbook roles/configure-master-node/tasks/main.yml
ansible-playbook roles/deploy-metrics-server-for-HPA/tasks/main.yml
ansible-playbook roles/join-master/tasks/main.yml
ansible-playbook roles/deploy-app/tasks/main.yml
