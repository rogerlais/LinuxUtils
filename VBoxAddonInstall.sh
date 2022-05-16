#!/bin/bash

#atualiza o ambiente atual
sudo apt update
sudo apt upgrade

#kernel headers para compilação dos módulos
sudo apt install build-essential dkms linux-headers-$(uname -r)

#caso haja problemas com o pacote linux-headers-$(uname -r)
#Tente executar a linha abaixo
sudo apt-get install linux-image-amd64 linux-headers-amd64

#Modo alternativo
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
cd /mnt/cdrom
sudo sh ./VBoxLinuxAdditions.run --nox11

#Geralmente inviavel abaixo
#sudo rcvboxadd setup

#Exibe se há addon instalado
lsmod | grep vboxguest

sudo /usr/sbin/VBoxService --version

#!Insere a conta atual no grupo de montadores/RW 
sudo usermod -aG vboxusers $USER
sudo usermod -aG vboxsf $USER

#todo: o link abaixo versa sobre o caso do kali-linux possuir diferencas
#https://stackoverflow.com/questions/54336626/how-to-create-virtualbox-shared-folder-between-windows-host-and-ubuntu18-04-gues