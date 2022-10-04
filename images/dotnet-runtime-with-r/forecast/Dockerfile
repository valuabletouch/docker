ARG IMAGE_PREFIX

FROM ${IMAGE_PREFIX}/dotnet-runtime-with-r:latest

LABEL maintainer="yasin.akar@vtc.com.tr"

RUN set -eux; \
    Rscript -e 'install.packages(pkgs = c("dplyr", "forecast", "keras", "lubridate", "nnfor", "recipes"), repos = c("https://cran.r-project.org", "https://cloud.r-project.org"), dependencies = c("Depends", "Imports", "LinkingTo"), INSTALL_opts = c("--clean", "--no-lock", "--no-staged-install", "--no-multiarch", "--no-test-load", "--without-keep.source", "--no-help", "--no-docs", "--no-html", "--no-demo"))'; \
    Rscript -e 'keras::install_keras(envname = "tf")'; \
    Rscript -e 'sessionInfo()'; \
    Rscript -e 'installed.packages(fields = c("Package", "Version"))'; \
    rm -rf /tmp/*
