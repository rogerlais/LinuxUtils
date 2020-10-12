#!/bin/bash

#Corrige necessiade de autenticação para acesso ao shared folder do virtualbox


if[ -not $1 ]; then
	echo "Informe nome de usuário para realizar mapeamento direto de recurso do hospedeiro"
	exit
fi

sudo adduser $1 vboxsf