# This debug image is built off of the latest mail image. To be safe, the mail:latest image should always be built before
# building this image.
FROM mail:latest

ENV MAILHOG_VERSION=v1.0.0

RUN apk --no-cache add curl ca-certificates \
    && \
    curl -L https://github.com/mailhog/MailHog/releases/download/${MAILHOG_VERSION}/MailHog_linux_amd64 > /usr/local/bin/mailhog \
    && \
    chmod +x /usr/local/bin/mailhog \
    && \
    apk --no-cache --purge del curl

# Enable local relay.
ENV RELAY_ENABLED=true \
    RELAY_HOST=127.0.0.1 \
    RELAY_PORT=1025 \
    RELAY_LOGIN=login \
    RELAY_PASSWORD=password

# Copy in additional file system changes.
COPY /debug/fs/ /
