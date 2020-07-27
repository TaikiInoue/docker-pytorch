docker run --runtime nvidia -it --rm --privileged \
    --network host \
    --volume /home/$USER/.ssh:/tmp/.ssh \
    --workdir /dgx \
    --name metis-docker \
    --hostname metis-docker \
    taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04
