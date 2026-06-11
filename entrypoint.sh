cat > entrypoint.sh <<EOF
#!/bin/sh

/usr/local/bin/xray run -c /etc/xray.json &

sleep 3

exec /usr/local/openresty/bin/openresty -g 'daemon off;'
EOF

chmod +x entrypoint.sh
