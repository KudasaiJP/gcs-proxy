FROM nginx:1.23.2-alpine

RUN set -xe && \
    apk add sudo bash fuse && \
    apk add --no-cache --virtual .build-deps go && \
    go install github.com/googlecloudplatform/gcsfuse@latest && \
    apk del .build-deps

RUN mv /root/go/bin/gcsfuse /bin/gcsfuse

ENV MNT_DIR /mnt/gcs

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY ./gcsfuse_run.sh ./gcsfuse_run.sh
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /app/gcsfuse_run.sh

CMD ["/app/gcsfuse_run.sh"]