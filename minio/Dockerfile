FROM bitnami/minio:latest

USER root

# Install Nginx
RUN apt-get update -y && \
    apt-get install nginx -y

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R 1001:1001 /etc/nginx/ssl/ && \
    mkdir -p /var/lib/nginx && \
    chown -R 1001:1001 /var/lib/nginx/ && \
    mkdir -p /var/log/nginx && \
    chown -R 1001:1001 /var/log/nginx/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN touch /var/run/nginx.pid && \
    chown -R 1001:1001 /var/run/nginx.pid /run/nginx.pid

USER 1001

# Start MinIO and Nginx
ENTRYPOINT [ "/start.sh" ] 
CMD [ "/opt/bitnami/scripts/minio/run.sh" ]