FROM rabbitmq:3.13-management

LABEL maintainer="docker@vtcenerji.com"

RUN rabbitmqctl enable_feature_flag all

RUN rabbitmq-plugins enable --offline rabbitmq_prometheus

RUN rabbitmq-plugins enable --offline rabbitmq_peer_discovery_consul
