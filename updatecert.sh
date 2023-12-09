#!/bin/bash

# set variable from .env
. .env

# check param
echo "Mail Address: ${MAIL_ADDRESS}"
echo "Server FQDN: ${$SERVER_FQDN}"

certDir=$(pwd)/cert

sudo iptables -D DOCKER-USER -i ens4 -j JPFILTER

docker container run -i --rm \
  -v ${certDir}:/etc/letsencrypt \
  -p 80:80 \
  certbot/certbot:latest \
  certonly \
    --keep-until-expiring \
    --email $MAIL_ADDRESS \
    --agree-tos \
    --rsa-key-size 4096 \
    -a standalone \
    -d $SERVER_FQDN

sudo iptables -I DOCKER-USER -i ens4 -j JPFILTER
