FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive 

RUN set -xe \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
            build-essential \
            cmake \
            git \
            curl \
            ca-certificates \
            libjpeg-dev \
            libpng-dev \
        && rm -rf /var/lib/apt/lists/*

ARG PYTHON_VERSION=3.6.5
ENV PATH /opt/conda/bin:$PATH
COPY requirements.txt requirements.txt
RUN set -xe \
        && curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && chmod +x ~/miniconda.sh \
        && ~/miniconda.sh -b -p /opt/conda \
        && rm ~/miniconda.sh \
        && /opt/conda/bin/conda install -y python=$PYTHON_VERSION \
        && /opt/conda/bin/conda install -y pytorch torchvision cudatoolkit=10.2 \
        && /opt/conda/bin/conda clean -ya \
        && pip install --no-cache-dir -r requirements.txt \
        && rm requirements.txt
