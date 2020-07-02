FROM nvcr.io/nvidia/tensorrt:20.03-py3
ENV DEBIAN_FRONTEND=noninteractive 

RUN set -xe \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
            sudo \
            build-essential \
            cmake \
            git \
            curl \
            ca-certificates \
            libjpeg-dev \
            libpng-dev \
        && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN set -xe \
        && pip install --no-cache-dir -r requirements.txt \
        && pip install --no-cache-dir hydra-core --upgrade \
        && rm requirements.txt

RUN set -xe \
        && git clone https://github.com/NVIDIA-AI-IOT/torch2trt \
        && cd torch2trt \
        && sudo python setup.py install \
        && cd .. \
        && sudo rm -rf torch2trt