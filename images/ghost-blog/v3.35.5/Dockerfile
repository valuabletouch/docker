# https://docs.ghost.org/faq/node-versions/
# https://github.com/nodejs/LTS
# https://github.com/TryGhost/Ghost/blob/3.3.0/package.json#L38
FROM node:12-buster-slim AS setup

ENV NODE_ENV production

ENV GOSU_VERSION 1.12

ENV GHOST_CLI_VERSION 1.14.1
ENV GHOST_VERSION 3.35.5

ENV GHOST_APP_PATH /var/lib/ghost
ENV GHOST_CONTENT_PATH /var/lib/ghost/content

WORKDIR $GHOST_APP_PATH

USER root

# Grab gosu for easy step-down from root
# https://github.com/tianon/gosu/releases
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends ca-certificates dirmngr gnupg wget mariadb-server; \
    \
    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
    wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
    wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
    \
    # Verify the signature
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
    command -v gpgconf && gpgconf --kill all || :; \
    \
    chmod +x /usr/local/bin/gosu; \
    # Verify that the binary works
    gosu --version; \
    gosu nobody true

RUN yarn global add "ghost-cli@$GHOST_CLI_VERSION"

RUN chown -R node "$GHOST_APP_PATH"

RUN set -eux && \
    gosu node ghost install "$GHOST_VERSION" \
        --no-prompt \
        --no-stack \
        --no-setup \
        --no-start \
        --dir "$GHOST_APP_PATH" \
        --db mysql \
        --dbhost localhost \
        --dbname ghost && \
    \
    gosu node ghost config \
        --ip 0.0.0.0 \
        --port 8080 \
        --no-prompt \
        --url http://localhost:8080 && \
    \
    gosu node ghost config \
        paths.contentPath "$GHOST_CONTENT_PATH"

FROM node:12-buster-slim

LABEL maintainer="yasin.akar@vtc.com.tr"

USER root

ENV NODE_ENV production

ENV GHOST_APP_PATH /var/lib/ghost
ENV GHOST_CONTENT_PATH /var/lib/ghost/content

WORKDIR $GHOST_APP_PATH

COPY --from=setup "$GHOST_APP_PATH" "$GHOST_APP_PATH"

# Need to save initial content for pre-seeding empty volumes
RUN mv "$GHOST_CONTENT_PATH" "$GHOST_APP_PATH/content.setup"

COPY docker-entrypoint.sh /usr/local/bin

VOLUME $GHOST_CONTENT_PATH

EXPOSE 8080

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node", "current/index.js"]
