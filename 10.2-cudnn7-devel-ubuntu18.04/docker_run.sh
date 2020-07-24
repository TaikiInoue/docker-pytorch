docker run --runtime nvidia -it --rm \
    --network host \
    --volume ~/github:/app/github \
    --volume /home/inoue/.ssh:/root/.ssh \
    --volume /home/inoue/.zshrc:/root/.zshrc \
    --workdir /app \
    --name torch \
    --hostname torch \
    taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04 \
    /bin/bash
