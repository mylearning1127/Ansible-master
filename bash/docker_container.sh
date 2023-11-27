#!/bin/bash

docker network create -d bridge --subnet=10.254.0.0/16 my-bridge

for i in `cat list`; do

docker run -itd --name $i --network my-bridge -p :22 -p :8140 -p :8141 -h $i -v /sys/fs/cgroup:/sys/fs/cgroup --privileged=true centos/systemd /usr/sbin/init

docker exec -it $i    yum install  initscripts -y
docker exec -it $i    yum install openssh-server openssh-clients -y
docker exec -it $i    sed -i '/PermitRootLogin/d' /etc/ssh/sshd_config
docker exec -it $i    sed -i '10i\PermitRootLogin yes' /etc/ssh/sshd_config
docker exec -it $i    sed -i '/PasswordAuthentication/d' /etc/ssh/sshd_config
docker exec -it $i    sed -i '11i\PasswordAuthentication yes' /etc/ssh/sshd_config
docker exec -it $i    service sshd restart
docker exec -it $i    echo -e "passwd\npasswd" | passwd

done


