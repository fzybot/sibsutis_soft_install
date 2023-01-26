#! /bin/bash

process_id=$!
echo "PID: $process_id"

# sudo sh -c "echo '  ethernets:\n    enp4s0:\n      dhcp4: no\n      addresses:\n        - 10.23.$1.$2/16\n      gateway4: 10.23.0.1\n      nameservers:\n        addresses: [8.8.8.8, 8.8.4.4]' >> /etc/netplan/01-network-manager-all.yaml "
# wait $process_id
# echo "PID: $process_id"
# echo "Exit status: $?"

# sudo netplan apply
# wait $process_id

# echo "----------->"
# echo "sudo apt update"
# echo "PID: $process_id"
# sudo apt update
# wait $process_id

# echo "----------->"
# echo "sudo apt-get install ssh"
# echo "PID: $process_id"
# sudo apt-get -y install ssh
# wait $process_id
# sudo systemctl enable sshd

# echo "----------->"
# echo "Status sshd"
# systemctl status sshd

# echo -e "\033[42m\033-----------> Changing sources.list into Yandex sources.list"
# sudo cp -f sources.list /etc/apt/sources.list
# wait $process_id
# echo -e "\033[42m\033-----------> sources.list into Yandex sources.list is successfully changed"

# sudo apt-get update
# wait $process_id

# echo -e "\033[42m\033-----------> Qt"
# sudo apt-get -y install build-essential qtcreator mesa-common-dev qt5-default qt5-doc qt5-doc-html qtbase5-dev qtbase5-dev-tools qtbase5-doc qtbase5-doc-html qtbase5-examples libqt5charts5-dev  qtcharts5-doc qtcharts5-doc-html qtcharts5-examples 
# # sudo apt-get -y installlibqt5datavisualization5-dev qtdatavisualization5-doc qtdatavisualization5-examples qtdatavisualization5-doc-html
# wait $process_id
# sudo apt-get update
# wait $process_id
# echo -e "\033[42m\033-----------> Qt successfully installed"

