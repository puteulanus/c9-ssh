# c9-ssh
Use Cloud9 in docker as a ssh client for host

Useage: 

docker run -v ~/.ssh/authorized_keys:/keys -d -P -v /root:/workspace puteulanus/c9-ssh

Environment:

SSH_IP: IP address of host, default use intranet gateway of docker network
SSH_USER: The user ssh uses to login, default is root
SSH_PORT: The port ssh uses to login, default is 22
