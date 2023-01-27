#! /bin/bash
# Если возникает ошибка, приведенная ниже, выполнить след команду из папки запуска:
# sed -i 's/\r$//' *
# -bash: ./network_settings.sh: /bin/bash^M: неверный интерпретатор: Нет такого файла или каталога


process_id=$!
echo "PID: $process_id"

echo "-----------> add Student user"
sudo useradd -m student
wait $process_id
echo "-----------> enter Password for Student"
sudo passwd student
wait $process_id

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

echo "-----------> Change layout changing into alt+shift"
# link: "https://qna.habr.com/q/526950"
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']"
echo "-----------> Change layout changing into alt+shift - Success"

echo "-----------> Install SSH"
echo "sudo apt-get install ssh"
echo "PID: $process_id"
sudo apt-get -y install ssh
wait $process_id
sudo systemctl enable sshd
echo "-----------> Install SSH - Success"

echo -e "\033[42m\033-----------> Changing sources.list into Yandex sources.list"
sudo cp -f sources.list /etc/apt/sources.list
wait $process_id
echo -e "\033[42m\033-----------> sources.list into Yandex sources.list is successfully changed"

sudo apt-get update
wait $process_id

echo -e "\033[42m\033-----------> Qt"
sudo apt-get -y install build-essential qtcreator mesa-common-dev qt5-default qt5-doc qt5-doc-html qtbase5-dev qtbase5-dev-tools qtbase5-doc qtbase5-doc-html qtbase5-examples libqt5charts5-dev  qtcharts5-doc qtcharts5-doc-html qtcharts5-examples 
# sudo apt-get -y installlibqt5datavisualization5-dev qtdatavisualization5-doc qtdatavisualization5-examples qtdatavisualization5-doc-html
wait $process_id
sudo apt-get update
wait $process_id
echo -e "\033[42m\033-----------> Qt - Success"

echo -e "\033[42m\033-----------> Libre Office Installation"
# link: "https://itdraft.ru/2018/08/16/kak-ustanovit-libreoffice-6-1-v-ubuntu-18-04-16-04/" 
sudo add-apt-repository -y ppa:libreoffice/ppa
sudo apt-get update
wait $process_id
sudo apt-get -y install libreoffice
wait $process_id
echo -e "\033[42m\033-----------> Libre Office Installation - Success"

echo -e "\033[42m\033-----------> Code Blocks Installation"
# link: "https://ubunlog.com/ru/como-instalar-codeblocks-en-ubuntu-18-04/" 
sudo add-apt-repository -y ppa:damien-moore/codeblocks-stable
sudo apt-get update
wait $process_id
sudo apt-get -y install codeblocks codeblocks-contrib
wait $process_id
echo -e "\033[42m\033-----------> Code Blocks Installation - Success"


echo -e "\033[42m\033-----------> Adobe Acropbat Reader"
# link: "https://linuxways.net/ubuntu/how-to-install-adobe-acrobat-reader-in-ubuntu-20-04/"
sudo apt-get update
wait $process_id
sudo dpkg --add-architecture i386
wait $process_id
sudo apt-get -y install libxml2:i386 libcanberra-gtk-module:i386 gtk2-engines-murrine:i386 libatk-adaptor:i386
wait $process_id
wget -O ~/adobe.deb ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
wait $process_id
sudo dpkg -i /home/tsvs/adobe.deb
wait $process_id
echo -e "\033[42m\033-----------> Adobe Acropbat Reader - Success"

echo -e "\033[42m\033-----------> VSCode"
# link: "https://phoenixnap.com/kb/install-vscode-ubuntu"
sudo apt update
wait $process_id
sudo apt install software-properties-common apt-transport-https wget -y
wait $process_id
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
wait $process_id
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
wait $process_id
sudo apt-get -y install code
wait $process_id
echo -e "\033[42m\033-----------> VSCode - Success"

echo -e "\033[42m\033-----------> Python-PIP"
sudo apt-get -y install python3-pip python-pip
wait $process_id
echo -e "\033[42m\033-----------> Python-PIP - Success"

echo -e "\033[42m\033-----------> Java-JDK"
# link: "https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04"
sudo apt-get -y install default-jdk
wait $process_id
echo -e "\033[42m\033-----------> Java-JDK - Success"

echo -e "\033[42m\033-----------> GIMP"
# link: "https://www.cyberciti.biz/faq/how-to-install-gimp-on-ubuntu-debian-linux/"
sudo apt-get -y install gimp
sudo apt-get -y install gimp-plugin-registry
wait $process_id
echo -e "\033[42m\033-----------> GIMP - Success"

echo -e "\033[42m\033-----------> Git"
sudo apt-get -y install git
wait $process_id
echo -e "\033[42m\033-----------> Git - Success"








# УСТАНАВЛИВАТЬ ПОСЛЕДНИМИ
echo -e "\033[42m\033-----------> Cisco Packet Tracer"
# ВАЖНО! необходимо иметь в каталоге файл CiscoPacketTracer_820_Ubuntu_64bit.deb
sudo chmod 777 CiscoPacketTracer_820_Ubuntu_64bit.deb
wait $process_id
sudo apt -y install ./CiscoPacketTracer_820_Ubuntu_64bit.deb
wait $process_id
echo -e "\033[42m\033-----------> Cisco Packet Tracer - Success"