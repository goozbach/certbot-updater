#!/bin/sh

echo "this is startup"

mkdir -p /run/nginx
mkdir -p /etc/letsencrypt


certbot certonly --standalone -n --domains rishi.goozbach.net -m derek@goozbach.com --agree-tos
