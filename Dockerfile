FROM alpine:3.8

ENV DOMAIN="" \
    ALLOWED_SENDERS="" \
    ALLOWED_RECIPIENTS="" \
    RELAY=false \
    RELAY_HOST="" \
    RELAY_PORT=0 \
    RELAY_USERNAME="anonymous" \
    RELAY_PASSWORD="anonymous"

RUN apk --no-cache add postfix postfix-pcre rsyslog curl ca-certificates dumb-init && \
    rm -rf /etc/postfix

COPY fs/ /

RUN chown -R root:root /etc/postfix && \
    chown -R postfix:postdrop /var/spool/postfix && \
    chown root:root /var/spool/postfix /var/spool/postfix/pid && \
    chmod 2755 /var/spool/postfix && \
    chmod 0755 /var/spool/postfix/pid

EXPOSE 25
ENTRYPOINT ["/init"]
