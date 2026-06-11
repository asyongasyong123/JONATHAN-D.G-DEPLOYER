#!/bin/sh
set -e
sed -i "s/\${PORT:-8080}/$PORT/g" /usr/local/openresty/nginx/conf/nginx.conf
openresty -g 'daemon off;' &
exec xray run -c /etc/xray.json
