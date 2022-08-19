docker run -itd --name $1 --network my-bridge -p :22 -p :8140 -p :8141 -h $1 -v /sys/fs/cgroup:/sys/fs/cgroup --privileged=true centos/systemd /usr/sbin/init

docker exec -it $1    yum install  initscripts -y
docker exec -it $1    yum install openssh-server openssh-clients -y
docker exec -it $1    vi /etc/ssh/sshd_config
docker exec -it $1  service sshd restart
docker exec -it $1 passwd

