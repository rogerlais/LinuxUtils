#Inicia dados para conta de acesso ao git local/remoto

read -p "Informe nome do usuário:" gituser
read -p "Informe email de autenticação:" gitemail
echo "Iniciando configuração para ${gituser}..."
echo "Usando conta \""${gitemail}\"""

read -p "Pressione enter para continuar..." dummy

git config --global user.name \""${gituser}\""

git config --global user.email \""${gitemail}\""

git config --list
