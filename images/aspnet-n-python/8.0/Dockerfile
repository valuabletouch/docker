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
    # UID of the non-root user 'app'
    APP_UID=1654 \
    # Configure web servers to bind to port 8080 when present
    ASPNETCORE_HTTP_PORTS=8080 \
    ASPNETCORE_URLS=http://+:8080 \
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
        libgcc-s1 \
        libicu70 \
        libssl3 \
        libstdc++6 \
        tzdata \
        zlib1g; \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /tmp/*

# Create a non-root user and group
RUN set -eux; \
    groupadd \
        --gid=$APP_UID \
        app \
    && useradd -l \
        --uid=$APP_UID \
        --gid=$APP_UID \
        --create-home \
        app

ENV DOTNET_VERSION=8.0.0
ENV ASPNET_VERSION=8.0.0

RUN set -eux; \
    wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh; \
    chmod +x /tmp/dotnet-install.sh; \
    /tmp/dotnet-install.sh --channel 8.0 --version latest --runtime aspnetcore --install-dir /usr/share/dotnet; \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet; \
    rm -rf /tmp/*

ENTRYPOINT []

CMD []
