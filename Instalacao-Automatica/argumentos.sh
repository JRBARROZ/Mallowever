#!/bin/bash
#Shell Script que instala alguns componentes básicos para pós formatação do sistema
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
VERSION=$(uname -m)
CAMINHO=${HOME}/Downloads/SUBL
case $1 in
	help) clear
echo -e "${CORES['WHITE']} 
====================================

${CORES['WHITE']}- Bem vindo ao MallowEver 1.1 X_X
${CORES['WHITE']}- Para executar você precisará do programa (${CORES['RED']}Make${CORES['WHITE']}) Instalado (${CORES['GREEN']}sudo apt-get install make${CORES['WHITE']}) Execute com (${CORES['RED']}make opção${CORES['WHITE']}). Bom uso Jovem Padawan :)

${CORES['WHITE']}- > ${CORES['YELLOW']}Opções Disponíveis: ${CORES['WHITE']}<        
${CORES['WHITE']}- (${CORES['RED']}php${CORES['WHITE']}) ${CORES['GREEN']}Para instalar o php e suas dependências ${CORES['WHITE']}<---
${CORES['WHITE']}- (${CORES['RED']}base${CORES['WHITE']}) ${CORES['GREEN']}Pacote básico para todo o linux, ferramentas essenciais ${CORES['WHITE']}<---
${CORES['WHITE']}- (${CORES['RED']}python${CORES['WHITE']})${CORES['GREEN']} Para instalar o python e suas dependências ${CORES['WHITE']}<---
${CORES['WHITE']}- (${CORES['RED']}sublime${CORES['WHITE']}) ${CORES['GREEN']}Para instalar o sublime que é um editor de código leve e gratuito para devs ${CORES['WHITE']}<---
${CORES['WHITE']}- (${CORES['RED']}phpmyadmin${CORES['WHITE']}) ${CORES['GREEN']}Para usuários que preferem manipular o banco de dados através da interface gráfica ${CORES['WHITE']}<---	
+ (VV -\033[05;31m NEW \033[00;37m${CORES['WHITE']}- VV)
${CORES['WHITE']}- (${CORES['RED']}deep${CORES['WHITE']})${CORES['GREEN']} Para instalar o Tor ${CORES['GREEN']}com o objetivo de ter acesso a DeepWeb e links úteis ${CORES['WHITE']}<---

${CORES['WHITE']}===================================

${CORES['WHITE']}-${CORES['WHITE']} Created by : ${CORES['RED']}Jhonatas Rodrigues de Barros
${CORES['WHITE']}- ${CORES['WHITE']}Email : ${CORES['RED']}jhonsnoow32@gmail.com
${CORES['WHITE']}----> Mallow Forever X_X <----
${CORES['WHITE']}----> Alone, Happier, ${CORES['RED']}Love You <3 ${CORES['WHITE']}<---

${CORES['WHITE']}===================================
	"
;;

	php)
	
	sudo apt-get install php7.*
	sudo apt-get install php-common php-mbstring php-xml php-zip	
;;

 	sublime)
		if [[ ! -d ${CAMINHO} ]];
		
		then
			
			cd ${HOME}/Downloads/ && mkdir SUBL && cd SUBL
			wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
			sudo apt-get install apt-transport-https
			echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
			sudo apt-get update
			sudo apt-get install sublime-text
			subl
			
		else

			echo ${CAMINHO}
			echo "Pasta VSCODE já Existe :)"
			cd ${CAMINHO} && wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
			sudo apt-get install apt-transport-https
                        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
                        sudo apt-get update
                        sudo apt-get install sublime-text		
			subl
		fi	


;;
	base)
		sudo apt-get install make
		sudo apt-get install curl -y
		sudo apt-get install vlc -y
		sudo apt-get install composer -y

		sudo apt-get update 
		sudo apt-get install mysql-server -y
		clear
		sudo apt-get install mysql-workbench -y
		sudo mysql_secure_installation
		#Caso der merda, sudo mysql -u root -p 
		#ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'; flush privileges;
		

		sudo apt-get update
                sudo apt-get install apache2 -y

		sudo apt-get install virtualbox
;;
	python)

		sudo apt-get update
		sudo apt-get install python3-minimal -y
		python3 -V
		sudo apt install python-minimal -y
		python --version
		python -V
		ls -l /usr/bin/python
		sudo ln -sf /usr/bin/python3.6 /usr/bin/python
		python -V
		


;;

	phpmyadmin)
		if [[ -n $(dpkg -l | grep php) ]];
		
		then
			sudo apt-get update -y
			sudo apt-get install phpmyadmin -y	
		echo -e "${CORES['WHITE']}=================================
        
-${CORES['GREEN']} Seu PHPMyadmin foi instalado com sucesso! <--
                
${CORES['WHITE']}-${CORES['RED']} Infelizmente não podemos acessar o arquivo de configuração.

${CORES['WHITE']}-${CORES['WHITE']} Para resolver o problema navegue até : 
        
-${CORES['YELLOW']} /etc/apache2/apache2.conf 
        
${CORES['WHITE']}-${CORES['WHITE']} Adicione a seguinte linha ao final do arquivo :
        
-${CORES['YELLOW']} Include /etc/phpmyadmin/apache.conf
        
${CORES['WHITE']}-${CORES['WHITE']} Agora Reinicie o apache :
        
-${CORES['YELLOW']} /etc/init.d/apache2 restat  
        
${CORES['WHITE']}==========================================
                
                "
		else

			echo -e "${CORES['RED']}Instale o PHP antes de instalar o PHPMyadmin :)"
		fi

;;
	java) sudo apt install default-jdk -y
		sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update
		sudo apt-get install oracle-java8-installer -y
		cd ${HOME}/Downloads/ && wget https://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-linux.sh
		bash ./netbeans-8.0.2-linux.sh
		;;
	deep)
		if [[ ${VERSION} == 'x86_64' ]]; then

			if [[ ! -d ${HOME}/Downloads/tor  ]]; 

			then
				mkdir ${HOME}/Downloads/tor/ && cd ${HOME}/Downloads/tor/
			else
				cd ${HOME}/Downloads/tor/
				echo -e "${CORES['RED']}DIRETÓRIO JÁ EXISTE${CORES['GREEN']}"	
			fi
 			wget –no-check-certificate 'https://www.torproject.org/dist/torbrowser/8.5a8/tor-browser-linux64-8.5a8_pt-BR.tar.xz'
			wget –no-check-certificate 'https://www.dropbox.com/s/w3lj24im1y2856z/Listas%20de%20URLs.zip?dl=1' -O urls.zip
			cd ${HOME}/Downloads/tor/ && tar -xvJf tor-browser-linux64-8.5a8_pt-BR.tar.xz && unzip 'urls.zip'
			echo -e "${CORES['WHITE']}=================================="
			echo -e "${CORES['GREEN']}                                     -"
			read -p "Você deseja executar o tor agora?[s/n]: " RESPONSE
			echo -e "${CORES['WHITE']}-                                     -"
			echo -e "=================================="
			if [[ ${RESPONSE} == 's' ]]; then
				cd 'tor-browser_pt-BR' && ./start-tor-browser.desktop
				echo -e "${CORES['GREEN']}Tor baixado com sucesso!"
			else
				echo -e "${CORES['GREEN']}Tor baixado com sucesso!"
			fi

		else
			if [[ ! -d ${HOME}/Downloads/tor  ]]; 

			then
				mkdir ${HOME}/Downloads/tor/ && cd ${HOME}/Downloads/tor/
			else
				cd ${HOME}/Downloads/tor/
				echo -e "${CORES['RED']}DIRETÓRIO JÁ EXISTE${CORES['GREEN']}"	
			fi
			cd && cd Downloads/ && mkdir tor && cd tor
			wget –no-check-certificate 'https://www.torproject.org/dist/torbrowser/8.5a8/tor-browser-linux32-8.5a8_pt-BR.tar.xz'
			wget –no-check-certificate 'https://www.dropbox.com/s/w3lj24im1y2856z/Listas%20de%20URLs.zip?dl=1' -O urls.zip
			cd ${HOME}/Downloads/tor/ && tar -xvJf tor-browser-linux32-8.5a8_pt-BR.tar.xz && unzip 'urls.zip'
			echo -e "${CORES['WHITE']}=================================="
			echo -e "${CORES['GREEN']}                                     "
			read -p "Você deseja executar o tor agora?[s/n]: " RESPONSE
			echo -e "${CORES['WHITE']}                                     "
			echo -e "=================================="
			if [[ ${RESPONSE} == 's' ]]; then
				cd 'tor-browser_pt-BR' && ./start-tor-browser.desktop
				echo -e "${CORES['GREEN']}Tor baixado com sucesso!"
			else
				echo -e "${CORES['GREEN']}Tor baixado com sucesso!"
			fi
		fi
	

	;;
	docker)
		bash ./docker.sh
	;;
	*) 
			
		echo -e "${CORES['WHITE']}========================================================================================"
		echo -e "${CORES['WHITE']} -                                                                                  -"
		echo -e "${CORES['GREEN']} A opção "${CORES['RED']}${@#}${CORES['GREEN']}" não é válida, para consultar opções válidas utilize a clausula${CORES['YELLOW']} (help)"
		echo -e "${CORES['WHITE']} -                                                                                  -"
		echo -e "${CORES['WHITE']}========================================================================================"
esac

