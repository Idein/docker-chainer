ARG CUDA_VERSION=9.1 CUDNN_VERSION=7
FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel

ARG CHAINER_VERSION=4.1.0
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git python-opencv python3-dev python3-pip python3-tk zlib1g-dev libjpeg62-dev curl && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip3 --no-cache-dir install cupy==${CHAINER_VERSION} chainer==${CHAINER_VERSION} pandas chainercv==0.10.0\
    Pillow progressbar2 tqdm joblib matplotlib Sphinx scipy opencv-python scikit-learn h5py scikit-image xmltodict\
    git+https://github.com/yasuyuky/chainer-ya-utils

# Use Agg backend for matplotlib
ENV DISPLAY 0
