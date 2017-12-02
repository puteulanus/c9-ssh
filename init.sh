#!/bin/bash

if [ ! -f "/root/.ssh/id_rsa.pub" ];then
  echo "Creating SSH Key..."
  ssh-keygen -t rsa -b 4096 -C "c9ssh@delete.later" -N '' -f /root/.ssh/id_rsa -q
  cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
  REMOTE_IP=$(SSH_IP:-$(route -n | awk '/UG[ \t]/{print $2}'))
  ssh -o StrictHostKeyChecking=no ${SSH_USER:-root}@$REMOTE_IP echo
  sed -i "s/REMOTE_IP_ADDR/$REMOTE_IP/" /usr/src/c9sdk/node_modules/vfs-local/localfs.js
fi

/root/.c9/node/bin/node server.js -l $C9_IP -p $C9_PORT -w $WORKSPACE_DIR -a $USERNAME:$PASSWORD --packed 
