#!/usr/bin/env bash
set -eo pipefail

mkdir -p $MNT_DIR
chown nginx:nginx $MNT_DIR

ls -la $MNT_DIR

echo $GOOGLE_APPLICATION_CREDENTIALS

ls -la /key.json

echo "Mounting GCS Fuse."
/bin/gcsfuse --debug_gcs --debug_fuse $BUCKET $MNT_DIR 
echo "Mounting completed."

ls -la $MNT_DIR

nginx -g "daemon off;"