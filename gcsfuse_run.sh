#!/usr/bin/env sh
set -eo pipefail

mkdir -p $MNT_DIR
chown nginx:nginx $MNT_DIR

echo "Mounting GCS Fuse."
/root/go/bin/gcsfuse --debug_gcs --debug_fuse $BUCKET $MNT_DIR 
echo "Mounting completed."

ls -la $MNT_DIR

nginx -g "daemon off;"