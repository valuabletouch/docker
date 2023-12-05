ARG IMAGE_PREFIX

FROM ${IMAGE_PREFIX}/rabbitmq:latest

LABEL maintainer="docker@vtcenerji.com"

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

RUN rabbitmq-plugins enable --offline rabbitmq_web_mqtt
