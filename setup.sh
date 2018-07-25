#!/bin/bash
. fan_lib.sh
# ++++++++++++ Setup eth server script by fan +++++++++++

# COMMANDS
arr1=()
#arr+=("sudo apt-get install software-properties-common")
#arr+=('sudo add-apt-repository -y ppa:ethereum/ethereum')
#arr+=('sudo apt-get update')
#arr+=('sudo apt-get install ethereum')
arr1+=('sudo apt-get install supervisor')
arr1+=('sudo service supervisor restart')

HOME=`eval echo "~$different_user"`
ETH_DATA_DIR='ethdata'
IPADDR_DEF=`hostname --ip-address`

read -p "Please enter ip address for GETH [$IPADDR_DEF]:" ipaddr
if [ "$ipaddr" = "" ]; then	
	ipaddr=$IPADDR_DEF
fi
echo "ip address for GETH:$ipaddr"

mkdir -p "$HOME/$ETH_DATA_DIR";

echo "geth --rinkeby --networkid 4 --rpc --rpcaddr $ipaddr --rpcapi 'admin,debug,miner,shh,txpool,personal,eth,net,web3'  --datadir '$HOME/$ETH_DATA_DIR' --syncmode 'light' console" > "$HOME/geth.sh";

echo "geth attach http://$ipaddr:8545" > "$HOME/attach.sh";

#SUPERVISOR
sudo bash -c 'echo "[program:geth]" > "/etc/supervisor/conf.d/geth.conf"';
sudo bash -c 'echo "command=sh $HOME/geth.sh" >> "/etc/supervisor/conf.d/geth.conf"';
sudo bash -c 'echo "autostart=true" >> "/etc/supervisor/conf.d/geth.conf"';
sudo bash -c 'echo "autorestart=true" >> "/etc/supervisor/conf.d/geth.conf"';

arr2=()
arr2+=('sudo supervisorctl reread')
arr2+=('sudo supervisorctl update')
doCommands "${arr2[@]}"

#doCommands "${arr1[@]}"


# create  geth 


