ARG IMAGE_PREFIX

FROM ${IMAGE_PREFIX}/rabbitmq:latest

LABEL maintainer="yasin.akar@vtc.com.tr"

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

RUN rabbitmq-plugins enable --offline rabbitmq_web_mqtt
