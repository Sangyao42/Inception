#!/bin/bash
ln -sf /etc/nginx/sites-available/mynginx.conf /etc/nginx/sites-enabled/default

MYCONFIG=/etc/nginx/sites-available/mynginx.conf

envsubst '${CERTSN}' < $MYCONFIG > "$MYCONFIG.tmp" && mv "$MYCONFIG.tmp" "$MYCONFIG"
envsubst '${DOMAIN_NAME}' < $MYCONFIG > "$MYCONFIG.tmp" && mv "$MYCONFIG.tmp" "$MYCONFIG"

nginx -g "daemon off;"