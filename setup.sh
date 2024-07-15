#!/bin/bash

DOMAIN_NAME="fms.example.org"

# Install certbot.
sudo apt-get install snapd
sudo snap install --classic certbot

# Stop the FileMaker Server, to allow certbot to bind to port 80.
sudo service fmshelper stop

# Create a new certificate.
sudo certbot certonly --standalone -d $DOMAIN_NAME

# Grant read and execute access to others for the directory.
sudo chmod o+rx hooks/pre/stop-filemaker-server.sh
sudo chmod o+rx hooks/post/propagate-to-filemaker.sh

# Run the post-hook script to propagate the certificate to FileMaker Server once the certificate is renewed.
sudo hooks/post/propagate-to-filemaker.sh $DOMAIN_NAME $ADMIN_USER $ADMIN_PASS

# Copy files to the LetsEncrypt's renewal hooks directory.
sudo cp \
    hooks/pre/stop-filemaker-server.sh \
    /etc/letsencrypt/renewal-hooks/pre/stop-filemaker-server.sh
sudo cp \
    hooks/post/propagate-to-filemaker.sh \
    /etc/letsencrypt/renewal-hooks/post/propagate-to-filemaker.sh