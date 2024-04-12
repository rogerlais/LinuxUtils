#!/bin/bash

#test if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

# Para sistemas baseados em Debian (como Ubuntu)
apt-get update
apt-get install xrdp

systemctl start xrdp

systemctl enable xrdp

echo "Agora, abra o firewall para a porta 3389 deve ser liberado"
read -p "Pressione [Enter] para continuar..."
#Abaixo exemplo para sistemas baseados em Debian com iptables
#iptables -A INPUT -p tcp --dport 3389 -j ACCEPT
#iptables-save | sudo tee /etc/sysconfig/iptables
