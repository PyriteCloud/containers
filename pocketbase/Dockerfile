FROM chainguard/wolfi-base:latest as builder

ARG TARGET_ARCH=amd64
ARG PB_VERSION=0.22.13

ENV BUILDX_ARCH="linux_${TARGET_ARCH}"

RUN apk add --no-cache \
    unzip \
    ca-certificates

# Download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_${BUILDX_ARCH}.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

FROM chainguard/static:latest

COPY --from=builder --chown=nonroot:nonroot /pb /pb

# uncomment to copy the local pb_migrations dir into the image
# COPY ./pb_migrations /pb/pb_migrations

# uncomment to copy the local pb_hooks dir into the image
# COPY ./pb_hooks /pb/pb_hooks

EXPOSE 8090

# Set pocketbase as entrypoint
ENTRYPOINT ["/pb/pocketbase"]

# Start PocketBase
CMD ["serve", "--http=0.0.0.0:8090"]