ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}-slim

LABEL maintainer="docker@vtcenerji.com"

USER root

RUN DEBIAN_FRONTEND=noninteractive \
    set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        locales; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /tmp/*

RUN set -eux; \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen; \
    locale-gen en_US.utf8; \
    update-locale LANG=en_US.UTF-8

ENV \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

ENV \
    # Configure web servers to bind to port 80 when present
    ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true

RUN DEBIAN_FRONTEND=noninteractive \
    set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        \
        # .NET dependencies
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu-dev \
        libssl3 \
        libstdc++6 \
        zlib1g; \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /tmp/*

ENV DOTNET_VERSION=7.0.14
ENV ASPNET_VERSION=7.0.14

RUN set -eux; \
    wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh; \
    chmod +x /tmp/dotnet-install.sh; \
    /tmp/dotnet-install.sh --channel 7.0 --version latest --runtime aspnetcore --install-dir /usr/share/dotnet; \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet; \
    rm -rf /tmp/*

ENTRYPOINT []

CMD []
