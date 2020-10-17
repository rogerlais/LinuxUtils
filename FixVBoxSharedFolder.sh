#!/bin/bash

#Corrige necessiade de autenticação para acesso ao shared folder do virtualbox


if [ -not $1 ]
then
	read -p "Informe nome de usuário para realizar mapeamento direto de recurso do hospedeiro: " grantUser
	if [ ${grantUser} == "" ]; then
		exit
	fi
else
	grantUser=${1}
fi

echo "Inserido ${grantUser} ao grupo de permissões para pastas compartilhados do VirtualBox"
sudo adduser ${grantUser} vboxsf