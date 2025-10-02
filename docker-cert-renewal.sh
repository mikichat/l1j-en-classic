#!/bin/bash

# Run Certbot to renew certificates
echo "Attempting to renew certificates..."
docker compose run --rm certbot renew --deploy-hook "/usr/local/bin/docker-reload-nginx.sh"

# Check if renewal was successful
if [ $? -ne 0 ]; then
    echo "Certbot renewal failed."
    exit 1
fi

echo "Certbot finished. If certificates were renewed, Nginx was reloaded."
exit 0
