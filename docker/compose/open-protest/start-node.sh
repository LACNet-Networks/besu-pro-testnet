#!/bin/bash

#Enter Repository
cd /root/lacchain/besu-networks/docker/compose/open-protest

#Modify docker-compose-writer.yml
#Environment Variables
if [ -f permission.txt ];

then
    echo " permission exists."
else
	nombrepc=`hostname`
    ip=`curl ifconfig.me/ip`
  
    email=""
    read -p "Enter your contact email: " email
    #changing the ip BESU_P2P_HOST
    sed -i "s/<PUBLIC IP>/$ip/" docker-compose-writer.yml

    #changing theip PUBLIC_IP
    sed -i "s/<Public ip>/$ip/" docker-compose-writer.yml

    #changing the name the pc NODE_NAME
    sed -i "s/<Name Node>/$nombrepc/" docker-compose-writer.yml

    #changing the e-mail of the technical contact NODE_EMAIL
    sed -i "s/<e-mail of the technical contact>/$email/" docker-compose-writer.yml

    sed -i "s/'^\w+@[a-z]{5,7}\.[a-z]{2,3}\.?[a-z]{2,3}?$'/$email/" docker-compose-writer.yml

fi


#Accessing directory WRITER1
DIR=writer1
if [ -d "$DIR" ];
then
    echo "$DIR directory exists."
else
	mkdir $DIR
fi

cd $DIR

#Give folder permissions DATA
DIR_DATA=data
if [ -d "$DIR_DATA" ];
then
    echo "$DIR_DATA directory exists."
else
	mkdir $DIR_DATA
    chmod -R 667 data
fi


#Accessing directory
cd ..

#Deploy node
docker-compose -f docker-compose-writer.yml up -d

if [ -f permission.txt ];
then
    echo " permission exists."
else
	sleep 30;

    ENODE=`curl -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' http://localhost:4545 | grep enode`

    sleep 1;

    ADDRES=`curl -X POST --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":53}' http://127.0.0.1:4545 | grep result`


    #create file info

    touch permission.txt

    echo "$ENODE">permission.txt
    echo "$ADDRES" >>permission.txt
fi