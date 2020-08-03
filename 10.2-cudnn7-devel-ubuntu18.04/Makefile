
build:
		docker build -t taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04 .

run:
		docker run --runtime nvidia -it --rm --privileged \
			--network host \
			--volume /home/inoue/.ssh:/tmp/.ssh:ro \
			--volume /home/inoue/.zshrc:/tmp/.zshrc:ro \
			--volume /home/inoue/.tmux.conf:/tmp/.tmux.conf:ro \
			--workdir /dgx \
			--name metis-docker \
			--hostname metis-docker \
			taikiinoue45/pytorch:10.2-cudnn7-devel-ubuntu18.04
