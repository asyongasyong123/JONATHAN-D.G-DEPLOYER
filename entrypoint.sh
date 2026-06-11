#!/bin/sh
set -e

# Ibutang ang PORT gikan sa Cloud Run ngadto sa Nginx
sed -i "s/listen .*;/listen ${PORT:-8080};/g" /usr/local/openresty/nginx/conf/nginx.conf

# Sugdi ang Nginx ug Xray
openresty -g 'daemon off;' &
exec xray run -c /etc/xray.json
