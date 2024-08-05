FROM chainguard/wolfi-base:latest

ARG FLUTTER_VERSION=3.22.1
ARG FLUTTER_CHANNEL=stable
ENV FLUTTER_HOME=/usr/bin/flutter

ENV BUILDX_ARCH="linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}"

RUN apk add --no-cache \
    curl git unzip zip gnutar xz bash build-base ca-certificates

ENV PATH="$PATH:${FLUTTER_HOME}/bin"
ENV PATH="$PATH:${FLUTTER_HOME}/bin/cache/dart-sdk/bin"

RUN git clone --depth 1 --branch ${FLUTTER_CHANNEL} https://github.com/flutter/flutter.git ${FLUTTER_HOME}

RUN git config --global --add safe.directory ${FLUTTER_HOME}

RUN flutter config --no-analytics
RUN flutter precache --web

ENTRYPOINT [ "flutter" ]
CMD ["doctor", "-v"]