#! /bin/bash

process_id=$!
echo "PID: $process_id"

sudo sh -c "echo '  ethernets:\n    enp4s0:\n      dhcp4: no\n      addresses:\n        - 10.23.$1.$2/16\n      gateway4: 10.23.0.1\n      nameservers:\n        addresses: [8.8.8.8, 8.8.4.4]' >> /etc/netplan/01-network-manager-all.yaml "
wait $process_id
echo "PID: $process_id"
echo "Exit status: $?"

sudo netplan apply
wait $process_id

echo "----------->"
echo "sudo apt update"
echo "PID: $process_id"
sudo apt update
wait $process_id

echo "----------->"
echo "sudo apt-get install ssh"
echo "PID: $process_id"
sudo apt-get -y install ssh
wait $process_id
sudo systemctl enable sshd

echo "----------->"
echo "Status sshd"
systemctl status sshd

