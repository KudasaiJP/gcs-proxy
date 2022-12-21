#!/usr/bin/env bash
set -eo pipefail

mkdir -p $MNT_DIR

ls -la $MNT_DIR

echo $GOOGLE_APPLICATION_CREDENTIALS

echo "Mounting GCS Fuse."
/bin/gcsfuse -o allow_other --debug_gcs --debug_fuse $BUCKET $MNT_DIR 
echo "Mounting completed."

ls -la $MNT_DIR

mkdir -p $MNT_DIR/about
mkdir -p $MNT_DIR/assets
mkdir -p $MNT_DIR/stickers

ls -la $MNT_DIR

nginx -g "daemon off;"
