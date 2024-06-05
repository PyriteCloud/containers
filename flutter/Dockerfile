FROM chainguard/wolfi-base:latest

ARG FLUTTER_VERSION=3.22.1
ARG FLUTTER_CHANNEL=stable

ENV BUILDX_ARCH="linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}"

RUN apk add --no-cache \
    curl git unzip zip gnutar xz mesa-gl bash cmake \
    ca-certificates

# Download and unzip PocketBase
ADD https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_${BUILDX_ARCH}.tar.xz /tmp/flutter.tar.xz

RUN tar -xf /tmp/flutter.tar.xz -C /usr/bin/

ENV PATH="$PATH:/usr/bin/flutter/bin"
ENV PATH="$PATH:/usr/bin/flutter/bin/cache/dart-sdk/bin"

RUN git config --global --add safe.directory /usr/bin/flutter

RUN flutter config --no-analytics
RUN flutter precache --web

ENTRYPOINT [ "flutter" ]
CMD ["doctor", "-v"]