docker run --runtime nvidia -it --rm \
    --network host \
    --volume /home/inoue/github:/app/github \
    --workdir /app \
    --name tensorrt \
    --hostname tensorrt \
    taikiinoue45/pytorch:tensorrt \
    /bin/bash