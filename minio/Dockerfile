FROM cgr.dev/chainguard/wolfi-base:latest

# Install Nginx
RUN apk add nginx minio

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R nonroot:nonroot /etc/nginx/ssl/ && \
    mkdir -p /var/lib/nginx && \
    chown -R nonroot:nonroot /var/lib/nginx/ && \
    mkdir -p /var/lib/nginx/tmp && \
    chown -R nonroot:nonroot /var/lib/nginx/tmp/ && \
    mkdir -p /var/log/nginx && \
    chown -R nonroot:nonroot /var/log/nginx/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN mkdir -p /run/nginx && \
    chown -R nonroot:nonroot /run/nginx/ && \
    touch /run/nginx/nginx.pid && \
    chown -R nonroot:nonroot /run/nginx/nginx.pid

RUN mkdir -p /data && \
    chown -R nonroot:nonroot /data

USER nonroot

# Start MinIO and Nginx
ENTRYPOINT ["/bin/sh","/start.sh"]