docker run --runtime nvidia -it --rm \
    --network host \
    --volume /home/$USER/github:/root/github \
    --volume /home/$USER/.ssh:/root/.ssh \
    --name metis-docker \
    --hostname metis-docker \
    taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04 \
    /usr/bin/zsh
