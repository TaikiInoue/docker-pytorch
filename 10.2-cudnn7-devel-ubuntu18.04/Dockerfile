FROM nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
WORKDIR /root


COPY apt_requirements.txt apt_requirements.txt
COPY .zshrc .zshrc
COPY .tmux.conf .tmux.conf
RUN set -xe \
        && apt-get update -y \
        && apt-get install -y --no-install-recommends $(cat apt_requirements.txt) \
        && rm -rf /var/lib/apt/lists/* \
        && rm apt_requirements.txt \
        && git config --global user.email "taikiinoue45@gmail.com" \
        && git config --global user.name "TaikiInoue"


ARG PYTHON_VERSION=3.6.5
ENV PATH /opt/conda/bin:$PATH
ENV PATH /usr/local/cuda-10.2/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/cuda-10.2/lib64:$LD_LIBRARY_PATH
ENV PYTHONPATH /dgx/github/STAD:$PYTHONPATH

COPY pip_requirements.txt pip_requirements.txt
RUN set -xe \
        && curl -o ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && chmod +x ~/miniconda.sh \
        && ~/miniconda.sh -b -p /opt/conda \
        && rm ~/miniconda.sh \
        && /opt/conda/bin/conda install -y python=$PYTHON_VERSION \
        && /opt/conda/bin/conda install pytorch torchvision cudatoolkit=10.2 -c pytorch \
        && /opt/conda/bin/conda clean -ya \
        && pip install --no-cache-dir -r pip_requirements.txt \
        && pip install --no-cache-dir --upgrade hydra-core \
        && rm pip_requirements.txt


COPY entrypoint.sh entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
