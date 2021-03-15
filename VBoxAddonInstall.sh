#!/bin/bash

#atualiza o ambiente atual
sudo apt update
sudo apt upgrade

#kernel headers para compilação dos módulos
sudo apt install build-essential dkms linux-headers-$(uname -r)

sudo rcvboxadd setup

#Exibe se há addon instalado
lsmod | grep vboxguest

sudo /usr/sbin/VBoxService --version

#Modo alternativo
#sudo mkdir -p /mnt/cdrom
#sudo mount /dev/cdrom /mnt/cdrom
#cd /mnt/cdrom
#sudo sh ./VBoxLinuxAdditions.run --nox11


#!Insere a conta atual no grupo de montadores/RW 
sudo usermod -aG vboxusers $USER
sudo usermod -aG vboxsf $USER