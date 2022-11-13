FROM mcr.microsoft.com/dotnet/aspnet:7.0

LABEL maintainer="yasin.akar@vtc.com.tr"

USER root

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ed \
        less \
        locales \
        vim-tiny \
        wget \
        coreutils \
        autoconf \
        linux-headers-amd64 \
        make \
        cmake \
        ca-certificates \
        libssl-dev \
        libcurl4-openssl-dev \
        fonts-texgyre \
        libopenblas0-pthread \
        littler \
        r-base \
        r-base-dev \
        r-recommended \
        r-cran-littler \
        python3-dev \
        python3-pip \
        python3-venv; \
    pip install --no-cache --upgrade pip setuptools; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /tmp/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.utf8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
