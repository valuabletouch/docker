FROM rabbitmq:management

LABEL maintainer="docker@vtcenerji.com"

RUN rabbitmq-plugins enable --offline rabbitmq_prometheus

RUN rabbitmq-plugins enable --offline rabbitmq_peer_discovery_consul

RUN rabbitmq-plugins enable rabbitmq_federation rabbitmq_federation_management
