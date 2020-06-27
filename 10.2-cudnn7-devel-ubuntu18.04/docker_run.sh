docker run --runtime nvidia -it --rm \
    --network host \
    --volume /home/inoue/github:/app/github \
    --workdir /app \
    --name pytorch \
    --hostname pytorch \
    taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04 \
    /bin/bash