# 🔐 FileMaker Server Certificate Generator

This script will generate a certificate for FileMaker Server, along with a renewal routine using `certbot` to automatically renew the certificate and update it in FileMaker Server.

## Requirements

- FileMaker Server 2023 or later
- Ubuntu 22.04 or later

## Installation

1. Clone the repository on your target server.
   ```bash
   git clone https://github.com/icoseuk/fms-certificate-generator.git
   ```
1. Replace the variable values in the following files with your own:
    - [setup.sh](setup.sh)
    - [hooks/post/propagate-to-filemaker.sh](hooks/post/propagate-to-filemaker.sh)
1. Run `sudo sh ./setup.sh` to install the necessary dependencies and set up the certificate.

## Run manually

If you need to run the scripts manually after installing (e.g. after a manual renewal), just run:
```bash
# Stop the FileMaker Server
sudo sh /etc/letsencrypt/renewal-hooks/pre/stop-filemaker-server.sh

# Inject the new certificate.
sudo sh /etc/letsencrypt/renewal-hooks/post/propagate-to-filemaker.sh
```
