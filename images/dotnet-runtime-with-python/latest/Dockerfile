FROM mcr.microsoft.com/dotnet/runtime:6.0

LABEL maintainer="yasin.akar@vtc.com.tr"

USER root

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip; \
    pip3 install --no-cache --upgrade pip setuptools; \
    pip3 install --no-cache \
        catboost \
        datetime \
        holidays \
        lightgbm \
        matplotlib \
        numpy \
        openpyxl \
        pandas \
        scikit-learn \
        sktime \
        tbats \
        xgboost; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf /tmp/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.utf8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
