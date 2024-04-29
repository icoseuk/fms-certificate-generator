#!/bin/bash

DOMAIN_NAME="fms.example.org"
ADMIN_USER="admin"
ADMIN_PASS="password"

# Copy the certificate files to a temporary directory.
rm -rf "/tmp/$DOMAIN_NAME/"
mkdir "/tmp/$DOMAIN_NAME/"
cp "/etc/letsencrypt/live/$DOMAIN_NAME/"* "/tmp/$DOMAIN_NAME/"
 
# Import the certificate into FileMaker Server.
fmsadmin certificate import "/tmp/$DOMAIN_NAME/cert.pem" \
    --keyfile "/tmp/$DOMAIN_NAME/privkey.pem" \
    --intermediateCA "/tmp/$DOMAIN_NAME/fullchain.pem" \
    -u $ADMIN_USER \
    -p $ADMIN_PASS \
    -y

# Restart the FileMaker Server.
service fmshelper --full-restart