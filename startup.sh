#!/bin/sh

echo "this is startup"

mkdir -p /etc/letsencrypt

while true
do
  certbot certonly --standalone -n --domains rishi.goozbach.net -m derek@goozbach.com --agree-tos
  sleep 30d
done
