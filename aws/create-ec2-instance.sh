#!/bin/bash

loc=$(dirname "$0")
cd $(pwd)/$loc

choice=y

if [ -s roles/create-ec2-instance/vars/main.yml ]
then
  cat roles/create-ec2-instance/vars/main.yml
  echo "Do you want to update?(y/n)"
  read choice
fi

case "$choice" in
y)
echo "Enter Name:"
read name

echo "Enter AMI:"
read ami

echo "Enter Intance Type:"
read type

echo "Enter Number of Instances:"
read count

echo "Enter Subnet ID:"
read subnet

echo "Enter Security Group:"
read sgn

echo "Enter keypair name:"
read keypair

cat >> roles/create-ec2-instance/vars/main.yml << VARS
---

name: $name
ami: $ami
type: $type
count: $count
subnet: $subnet
sgn: $sgn
keypair: $keypair
VARS
;;
*)
ansible-playbook aws_admin.yml
;;
esac
