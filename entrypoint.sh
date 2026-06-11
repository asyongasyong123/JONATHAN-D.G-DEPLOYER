#!/bin/bash
set -e
xray -config /etc/xray.json &
nginx -g "daemon off; error_log /dev/stdout info;"
