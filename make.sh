#!/bin/bash

if [ "x$(id -u)" != 'x0' ]; then
    echo 'Error: this script can only be executed by root'
    exit 1
fi

#function StartTheProcess()
#{
	read -r -p "What is your IPv6 prefix? eg:(2604:180:2:11c7) " vPrefix
	read -r -p "VPS IP: " vIp
	read -r -p "Quantity IP for generate: " vCount
	read -r -p "IP who get access to this Proxies: " vIp2
	

	wget --no-check-certificate https://raw.github.com/h1777/3proxy-socks/master/3proxyinstaller.sh
	chmod +x 3proxyinstaller.sh
	./3proxyinstaller.sh
	sleep 20
	cd /etc/3proxy
	ulimit -u unlimited -n 999999 -s 16384
	
	wget https://raw.githubusercontent.com/sameerlike141/ipv6proxies-3proxy/master/3proxycfg.sh
	wget https://raw.githubusercontent.com/sameerlike141/ipv6proxies-3proxy/master/Genips.sh
	chmod 0755 Genips.sh
	chmod 0755 3proxycfg.sh
	
	sed -i "s/1.4.8.8/$vIp2/g" /root/3proxy/3proxycfg.sh
	sed -i "s/i127.0.0.1/i$vIp/g" /root/3proxy/3proxycfg.sh
	
#	//extend file limits
	echo '* hard nofile 999999' >> /etc/security/limits.conf
	echo '* soft nofile 999999' >> /etc/security/limits.conf
	
	echo $vPrefix > v_prefix.txt
        echo $vCount > v_count.txt

 	 rm -rf 0.8.12.tar.gz  3proxy-0.8.12
	 history -c
  #}
