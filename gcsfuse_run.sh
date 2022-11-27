#!/usr/bin/env bash
set -eo pipefail

ls -la /app
ls -la $MNT_DIR

echo "Mounting GCS Fuse."
/bin/gcsfuse --foreground --debug_gcs --debug_fuse --debug_fs $BUCKET $MNT_DIR 
echo "Mounting completed."

ls -la $MNT_DIR

nginx -g "daemon off;"