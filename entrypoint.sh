#!/bin/sh
set -e

# Ibutang ang port sa config
sed -i "s/\${PORT:-8080}/$PORT/g" /etc/xray.json
sed -i "s/\${PORT:-8080}/$PORT/g" /usr/local/openresty/nginx/conf/nginx.conf

# Sugdi ang serbisyo
openresty -g 'daemon off;' &
exec xray run -c /etc/xray.json
