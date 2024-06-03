FROM chainguard/wolfi-base:latest

# Install Nginx
RUN apk add nginx minio

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /etc/nginx/ssl/ /var/lib/nginx/tmp /var/log/nginx /run/nginx && \
    chown -R nonroot:nonroot /etc/nginx/ssl/ /var/lib/nginx/ /var/log/nginx/ /run/nginx/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN touch /run/nginx/nginx.pid && \
    chown -R nonroot:nonroot /run/nginx/nginx.pid

RUN mkdir -p /data && \
    chown -R nonroot:nonroot /data

USER nonroot

# Start MinIO and Nginx
ENTRYPOINT ["/bin/sh","/start.sh"]