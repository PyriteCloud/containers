#!/bin/sh
nginx -g 'daemon off;' &
echo "Nginx Started"
minio "$@"
