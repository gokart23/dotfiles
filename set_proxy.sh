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
		git config --global https.proxy $3
	fi
	echo "Proxy settings completed"
}

clrProxy(){
	assignProxy "" # This is what 'unset' does.
}

setProxy(){
	if [[ $PROXY_MODE -ne 0 ]]; then

	no_proxy="*.iitg.ernet.in, repo.cse.iitg.ernet.in, 202.141.*.*, 172.*.*.*, 192.168.*.*"
	echo "setProxy: Command for setting proxy environment variables"
	echo "Usage: setProxy <server> <port> <user> <pwd>"
	if [[ $# -ne 0 ]]; then
		server=$1
		port=$2
		user=$3
		pass=$4
	else
		server="172.16.117.170"
		port="3128"
		user="user"
		pass="guardian"	
	fi
	#read ‐p "Password: " ‐s pass &&  echo ‐e " "
	proxy_value="http://$user:$pass@$server:$port"
	secure_p_val="https://$user:$pass@$server:$port"
	no_proxy_value="localhost,127.0.0.1,$no_proxy"
	assignProxy $proxy_value $no_proxy_value $secure_p_val
	echo "Proxy set to $server:$port"

	fi

	echo "Established PROXY_MODE $PROXY_MODE"
}

