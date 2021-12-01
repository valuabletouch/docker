FROM cassandra:latest

LABEL maintainer="yasin.akar@vtc.com.tr"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN set -eux; \
    apt-get update; \
    apt-get install -y gettext-base; \
    rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

RUN chmod +x /custom-entrypoint.sh

RUN chown -R cassandra:cassandra /etc/cassandra

ENTRYPOINT ["/custom-entrypoint.sh"]

CMD ["cassandra", "-f"]
