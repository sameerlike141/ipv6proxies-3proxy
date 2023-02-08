echo daemon
echo maxconn 20
echo nserver 2001:4860:4860:0:0:0:0:8888
echo nserver 2001:4860:4860:0:0:0:0:8844
echo nscache6 65536
echo nscache 65536
echo stacksize 6000
echo timeouts 1 5 30 60 180 1800 15 60
echo setgid 65535
echo setuid 65535
echo flush
echo #allow admin


# HTTP(S) прокси
#echo "auth iponly"
#echo "allow * sameer"



echo "Enter username:"
read username

echo "Enter password:"
read password

echo "users $username:CL:$password"
echo "flush"
echo "allow * * * *"


echo "Enter starting port number:"
read start_port

echo "Enter the port range:"
read port_range

echo "Enter the path of the ip.list file:"
read filepath

port=$start_port
count=1

for i in `cat $filepath`; do
    echo "socks -6 -n -a -p$port -i$i -e$i"
    ((port+=1))
    ((count+=1))
    if [ $count -eq $port_range ]; then
        exit
    fi
done
