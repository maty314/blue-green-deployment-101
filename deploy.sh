#!/bin/bash

# This script checks the currently active version of the application.
# Based on the current version, it deploys the other version.

# Checks current version
response=$(curl -s http://localhost)

# Based on the current version, this script copies the nginx configuration with the other version's hostname
# and sends a HUP signal to nginx to reload the configuration.
if [[ $response == *"Green Version Active"* ]]; then
    echo "The active version is: Green. Deploying Blue."
    docker cp ./nginx/blue_conf/nginx.conf blue-green-deployment-101_nginx_1:/etc/nginx/conf.d/nginx.conf
    docker kill --signal=HUP blue-green-deployment-101_nginx_1
elif [[ $response == *"Blue Version Active"* ]]; then
    echo "The active version is: Blue. Deploying Green."
    docker cp ./nginx/green_conf/nginx.conf blue-green-deployment-101_nginx_1:/etc/nginx/conf.d/nginx.conf
    docker kill --signal=HUP blue-green-deployment-101_nginx_1
else
    echo "Could not determine the active version."
fi

