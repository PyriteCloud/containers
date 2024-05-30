#!/bin/bash
nginx -g 'daemon off;' &
echo "Nginx Started"
/opt/bitnami/scripts/minio/entrypoint.sh
exec "$@"
