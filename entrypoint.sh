#!/bin/sh
set -e

# Direkta nga ilisi ang port sa Nginx config
sed -i "s|listen.*;|listen ${PORT:-8080};|g" /usr/local/openresty/nginx/conf/nginx.conf

# Siguroha nga ang Nginx modungog sa tanang IP
sed -i "s|listen ${PORT:-8080};|listen 0.0.0.0:${PORT:-8080};|g" /usr/local/openresty/nginx/conf/nginx.conf

# Ipakita ang port para makita sa log
echo "Starting services on port: ${PORT:-8080}"

# Sugdi ang Nginx sa foreground
openresty -g 'daemon off;' &

# Sugdi ang Xray
exec xray run -c /etc/xray.json
