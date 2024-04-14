#!/bin/bash

#Inicia dados para conta de acesso ao git local/remoto

read -rp "Informe nome do usuário:" gituser
read -rp "Informe email de autenticação:" gitemail
echo "Iniciando configuração para ${gituser}..."
echo "Usando conta \"${gitemail}\""

# shellcheck disable=SC2034
read -rp "Pressione enter para continuar..." dummy

git config --global user.name \""${gituser}\""

git config --global user.email \""${gitemail}\""

git config --list
