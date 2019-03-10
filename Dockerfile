ARG UBUNTU_VERSION=16.04

ARG ARCH=
ARG CUDA=10.0
FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04

RUN apt-get update -y && apt-get install -yq \
        wget build-essential gcc zlib1g-dev \
        libbz2-dev \
        libc6-dev \
        libexpat1-dev \
        libffi-dev \
        libgdbm-dev \
        liblzma-dev \
        libncursesw5-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev 

WORKDIR /root/
RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz \
        && tar zxf Python-3.6.0.tgz \
        && cd Python-3.6.0 \
        && ./configure --with-openssl=/usr/lib --enable-optimizations\
        && make altinstall

ENV PYTHONIOENCODING "utf-8"
