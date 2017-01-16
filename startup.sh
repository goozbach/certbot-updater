#!/bin/sh

echo "this is startup"

mkdir -p /etc/letsencrypt

CERTBOT_DOMAINS=${MYDOMAINS:-rishi.goozbach.net,blog.goozbach.net,gitlab.goozbach.net}
ACCOUNT_EMAIL=${ACCOUNT_EMAIL:-derek@goozbach.com}

CERTBOT_METHOD=${CERTBOT_METHOD:-webroot}
CERTBOT_WEBROOT=${CERTBOT_WEBROOT:-/var/www/html}

case ${CERTBOT_METHOD} in
    webroot)
        CMD_METHOD='--webroot'
        CMD_ARGS="--webroot-path ${CERTBOT_WEBROOT}"
    ;;
    standalone)
        CMD_METHOD='--standalone'
        CMD_ARGS=''
    ;;
    *)
        echo "Unsupported method in CERTBOT_METHOD: ${CERTBOT_METHOD}"
        exit 255
    ;;
esac

while true
do
  certbot certonly ${CMD_METHOD} -n --domains ${CERTBOT_DOMAINS} -m ${ACCOUNT_EMAIL} --agree-tos --expand ${CMD_ARGS}
  sleep 30d
done
