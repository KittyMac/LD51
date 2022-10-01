FROM swiftarm/swift:5.6.2-ubuntu-focal as builder

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
    apt-get install -y \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libjavascriptcoregtk-4.0-dev \
    libatomic1 \
    unzip

RUN rm -rf /var/lib/apt/lists/*


WORKDIR /root/LD51
COPY ./Package.resolved ./Package.resolved
COPY ./Package.swift ./Package.swift
COPY ./Sources ./Sources
COPY ./Tests ./Tests

RUN swift build --configuration release

FROM swiftarm/swift:5.6.2-ubuntu-focal-slim as app

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true && apt-get -q update && \
    apt-get -q install -y \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libjavascriptcoregtk-4.0-dev \
    libatomic1
    
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /root
COPY --from=builder /root/LD51/.build/release/LD51 .
