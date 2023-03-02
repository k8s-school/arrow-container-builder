FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

ENV ARROW_VERSION 11.0.0-1

RUN apt-get update -y && \
    apt-get install -y bash build-essential ca-certificates cmake git lsb-release wget && \
    wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
    apt-get install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
    apt-get update && \
    apt-get install -y -V libarrow-dev=$ARROW_VERSION && \
    apt-get install -y -V libarrow-glib-dev=$ARROW_VERSION && \
    apt-get install -y -V libarrow-dataset-dev=$ARROW_VERSION && \
    apt-get install -y -V libarrow-flight-dev=$ARROW_VERSION && \
    apt-get install -y -V libparquet-dev=$ARROW_VERSION && \
    rm -rf /var/lib/apt/lists/*

