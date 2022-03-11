ARG CUDA_VERSION=11.5.1
ARG CUDNN_VERSION=8
ARG IMGTYPE=runtime
ARG OS=ubuntu20.04
FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-${IMGTYPE}-${OS}
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git python-opencv python3-dev python3-pip python3-tk zlib1g-dev libjpeg62-dev curl ca-certificates && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

COPY requirements.txt /requirements.txt
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip3 --no-cache-dir install -r ./requirements.txt
# Use Agg backend for matplotlib
ENV DISPLAY 0
