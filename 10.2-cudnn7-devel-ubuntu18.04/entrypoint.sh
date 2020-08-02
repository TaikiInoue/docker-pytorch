sed -i "s/console, file/file/" /opt/conda/lib/python3.6/site-packages/hydra/conf/hydra/job_logging/default.yaml
cp -r /tmp/.ssh /root/.ssh
mkdir -p /dgx/github
mkdir -p /dgx/data
mkdir -p /dgx/shared/momo
sshfs inoue.momo:/dgx/inoue/github/ /dgx/github
sshfs inoue.momo:/dgx/inoue/data/ /dgx/data
sshfs inoue.momo:/dgx/shared/ /dgx/shared/momo
/usr/bin/zsh
