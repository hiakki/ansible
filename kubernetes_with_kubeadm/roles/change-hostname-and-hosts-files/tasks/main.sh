#!/bin/bash
IFS=',' read -r -a hostnames <<< $(cat inventory | grep ansible_host | awk {'print $1'} | tr '\n' ,)

loc=$(dirname "$0")
cd $(pwd)/$loc

for hostname in ${hostnames[@]}
do
  echo $hostname
  ansible-playbook --extra-vars "n=$hostname" main.yml
done
