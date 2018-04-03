FROM nvidia/cuda:8.0-cudnn6-devel

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    git python3-dev python3-pip python3-tk zlib1g-dev libjpeg62-dev && \
    curl -fsL https://raw.githubusercontent.com/milq/milq/master/scripts/bash/install-opencv.sh | bash && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN pip3 --no-cache-dir install --upgrade pip setuptools && \
    pip3 --no-cache-dir install cupy==2.5.0 chainer==3.4.0 pandas chainercv==0.8.0\
    Pillow progressbar2 tqdm joblib matplotlib Sphinx scipy opencv-python scikit-learn h5py scikit-image\
    git+https://github.com/yasuyuky/chainer-ya-utils

# Use Agg backend for matplotlib
ENV DISPLAY 0
