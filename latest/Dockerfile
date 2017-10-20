FROM alpine:3.6

ENV S6_VERSION=1.20.0.0 \
    DOMAIN="" \
    ALLOWED_SENDERS="" \
    ALLOWED_RECIPIENTS="" \
    SUBJECT_PREPEND="" \
    SUBJECT_APPEND="" \
    RELAY_ENABLED=false \
    RELAY_HOST="" \
    RELAY_PORT=0 \
    RELAY_LOGIN="" \
    RELAY_PASSWORD=""

RUN set -x && apk --no-cache add postfix postfix-pcre rsyslog curl ca-certificates \
    && \
    curl -L https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-amd64.tar.gz | tar -xzf - -C / \
    && \
    rm -rf /etc/postfix \
    && \
    apk del --no-cache --purge curl

COPY /latest/fs/ /

EXPOSE 25
ENTRYPOINT ["/init"]
