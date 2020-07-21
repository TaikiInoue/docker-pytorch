docker run --runtime nvidia -it --rm \
    --network host \
    --volume /home/inoue/github:/app/github \
    --workdir /app \
    --name torch \
    --hostname torch \
    taikiinoue45/pytorch:10.1-cudnn7-devel-ubuntu18.04 \
    /bin/bash