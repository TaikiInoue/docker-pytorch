cp /tmp/.ssh /root/.ssh -r
cp /tmp/.zshrc /root/.zshrc
cp /tmp/.tmux.conf /root/.tmux.conf
sed -i "s/console, file/file/" /opt/conda/lib/python3.6/site-packages/hydra/conf/hydra/job_logging/default.yaml
sed -i "s/.hydra/hydra/" /opt/conda/lib/python3.6/site-packages/hydra/conf/hydra.yaml
sed -i "s/%F{red}%M@%n%f/%F{blue}%M@%n%f/" /root/.zshrc
mkdir -p /dgx/github
mkdir -p /dgx/data
mkdir -p /dgx/shared/momo
sshfs inoue.momo:/dgx/inoue/github/ /dgx/github
sshfs inoue.momo:/dgx/inoue/data/ /dgx/data
sshfs inoue.momo:/dgx/shared/ /dgx/shared/momo
/usr/bin/zsh
