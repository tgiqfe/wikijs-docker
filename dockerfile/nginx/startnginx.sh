#!/bin/sh

# Resolve environment variables in configuration files.
envsubst \
    '$PATH_SERVERCRT $PATH_SERVERKEY $PATH_CLIENTCRT $URL_WIKIJS' < \
    /etc/nginx/conf.d/wikijs.template > \
    /etc/nginx/conf.d/wikijs.conf

# Delete template config file.
rm -f /etc/nginx/conf.d/wikijs.template

nginx -g "daemon off;"
