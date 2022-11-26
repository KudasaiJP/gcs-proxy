#!/usr/bin/env sh
set -eo pipefail

mkdir -p $MNT_DIR

echo "Mounting GCS Fuse."
/root/go/bin/gcsfuse --debug_gcs --debug_fuse $BUCKET $MNT_DIR 
echo "Mounting completed."

# exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app &
# 
# wait -n
nginx -g "daemon off";