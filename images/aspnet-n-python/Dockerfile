ARG DOTNET_VERSION=8.0
ARG PYTHON_VERSION=3.11

FROM python:${PYTHON_VERSION}-slim

ARG DOTNET_VERSION

LABEL maintainer="docker@vtcenerji.com"

USER root

COPY requirements.txt /tmp/

RUN set -eux; \
    pip install --no-cache-dir -r /tmp/requirements.txt; \
    rm -rf /tmp/*

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        locales \
        wget; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /tmp/*

RUN set -eux; \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen; \
    locale-gen en_US.utf8; \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN set -eux; \
    wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh; \
    chmod +x /tmp/dotnet-install.sh; \
    /tmp/dotnet-install.sh --channel ${DOTNET_VERSION} --version latest --runtime aspnetcore --install-dir /usr/share/dotnet; \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet; \
    rm -rf /tmp/*

ENTRYPOINT []

CMD []
