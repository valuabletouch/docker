ARG IMAGE_PREFIX

FROM ${IMAGE_PREFIX}/dotnet-runtime-with-r:latest

LABEL maintainer="yasin.akar@vtc.com.tr"

COPY setup.r /tmp

RUN Rscript /tmp/setup.r
