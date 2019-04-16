#!/bin/bash
#Shell Script que adiciona e commita alterações
#Created by : Jhonatas Rodrigues de Barros
#========================================

declare -A CORES
CORES=(
	["WHITE"]='\033[01;39m'
	["YELLOW"]='\033[01;33m'
	["GREEN"]='\033[01;32m'
	["RED"]='\033[01;31m'
	["FINAL"]='\033[00;37m'
)
# Limpando
clear
# Checagem de commits 
git status ${1}
# lendo item a ser commitado
COMMIT=$(git add ${1})
if [ $? -eq 0 ]
then
    clear
    echo -e "${CORES['GREEN']}Arquivo adicionado!${CORES['FINAL']}"
    # COMMITS
    echo -e ${CORES['WHITE']}
        read -p "Digite o número da sua issue (1, 2..):" ISSUE
    echo -e ${CORES['FINAL']}

    echo -e ${CORES['WHITE']}
        read -p "Digite a mensagem de commit :" MESSAGE
    echo -e ${CORES['FINAL']}
        git commit -m "#${ISSUE} ${MESSAGE}"
else
    echo -e "${CORES['WHITE']}Não foi possível adicionar o arquivo ${CORES['RED']}'${1}'${CORES['FINAL']}"
fi   
# Limpando 

#
