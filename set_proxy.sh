#!/bin/bash
assignProxy(){
	PROXY_ENV=(http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY)
	for envar in $PROXY_ENV
	do
		export "$envar=$1"
	done
	export "no_proxy=$2"
	export "NO_PROXY=$2"
	hash git 2> /dev/null 
	if [ $? -eq 0 ]; then # check if git is present
		git config --global http.proxy $1
		git config --global https.proxy $1
	fi
	echo "Proxy settings completed"
}

clrProxy(){
	assignProxy "" # This is what 'unset' does.
}

setProxy(){
	no_proxy="*.iitg.ernet.in, repo.cse.iitg.ernet.in, 202.141.*.*, 172.*.*.*, 192.168.*.*"
	server="172.16.114.197"
	port="3128"
	user="user"
	pass="hercules"	
	#read ‐p "Password: " ‐s pass &&  echo ‐e " "
	proxy_value="http://$user:$pass@:$server:$port"
	no_proxy_value="localhost,127.0.0.1,$no_proxy"
	assignProxy $proxy_value $no_proxy_value
}

