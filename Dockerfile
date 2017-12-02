FROM puteulanus/c9-core

RUN yum install -y openssh-clients net-tools
RUN sed -i 's/BASH + " -l"/"ssh -t REMOTE_IP_ADDR \\"clear;$SHELL\\""/' /usr/src/c9sdk/node_modules/vfs-local/localfs.js
ADD init.sh /init.sh

ENV SSH_USER root
VOLUME /root/.ssh/authorized_keys

CMD bash /init.sh
