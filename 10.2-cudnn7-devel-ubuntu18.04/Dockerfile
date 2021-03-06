FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
WORKDIR /root


COPY requirements_apt.txt requirements_apt.txt
RUN set -xe \
        && apt update -y \
        && apt install -y --no-install-recommends $(cat requirements_apt.txt) \
        && rm -rf /var/lib/apt/lists/* \
        && rm requirements_apt.txt \
        && git config --global user.email "taikiinoue45@gmail.com" \
        && git config --global user.name "TaikiInoue"


RUN set -xe \
        && wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list \
        && apt update -y \
        && apt install dvc


ARG PYTHON_VERSION=3.6.5
ENV PATH /opt/conda/bin:$PATH
ENV PATH /usr/local/cuda-10.2/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda-10.2/lib64:$LD_LIBRARY_PATH
ENV PYTHONPATH /dgx/github/iSegmentation:$PYTHONPATH

COPY requirements_pip.txt requirements_pip.txt
RUN set -xe \
        && curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && chmod +x ~/miniconda.sh \
        && ~/miniconda.sh -b -p /opt/conda \
        && rm ~/miniconda.sh \
        && /opt/conda/bin/conda install -y python=$PYTHON_VERSION \
        && /opt/conda/bin/conda install pytorch torchvision cudatoolkit=10.2 -c pytorch \
        && /opt/conda/bin/conda clean -ya \
        && pip install --no-cache-dir -r requirements_pip.txt \
        && pip install --no-cache-dir --upgrade hydra-core \
        && rm requirements_pip.txt


COPY entrypoint.sh entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
