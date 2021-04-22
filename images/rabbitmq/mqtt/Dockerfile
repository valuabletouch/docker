FROM rabbitmq:management

LABEL maintainer="yasin.akar@vtc.com.tr"

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

RUN rabbitmq-plugins enable --offline rabbitmq_web_mqtt

RUN rabbitmq-plugins enable --offline rabbitmq_prometheus

RUN rabbitmq-plugins enable --offline rabbitmq_peer_discovery_consul
