#!/bin/sh

echo "this is startup"

mkdir -p /etc/letsencrypt

while true
do
  certbot certonly --webroot -n --domains rishi.goozbach.net,blog.goozbach.net,gitlab.goozbach.net -m derek@goozbach.com --agree-tos --expand --webroot-path /var/www/html
  sleep 30d
done
