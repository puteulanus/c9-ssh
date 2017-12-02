FROM puteulanus/c9-core

ENV SSH_USER root

RUN yum install -y openssh-clients net-tools
RUN sed -i "s/BASH + \" -l\"/\"ssh -t $SSH_USER@REMOTE_IP_ADDR \\\\\"clear\;\$SHELL\\\\\"\"/" /usr/src/c9sdk/node_modules/vfs-local/localfs.js
ADD init.sh /init.sh

VOLUME /root/.ssh/authorized_keys

CMD bash /init.sh
