FROM centos

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum install -y sudo shadow-utils procps wget \
    && rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum install -y openssh-server openssh-clients \
    && yum install -y nano \
    && yum install -y curl \
    && yum -y install initscripts \
    && yum clean all \
    && systemctl enable sshd.service

RUN mkdir -p .ssh
ADD authorized_keys /root/.ssh/

RUN echo "root:password" | chpasswd

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && echo "PermitRootLogin no" >> /etc/ssh/sshd_config \
    && echo "app ALL=NOPASSWD: ALL" >> /etc/sudoers
    #&& echo "app ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN ssh-keygen -A \
    && adduser app \
    && echo "app:password" | chpasswd

USER app
WORKDIR /home/app

RUN mkdir -p .ssh
ADD authorized_keys /home/app/.ssh/

EXPOSE 22 80 443 8080 3000

USER root

CMD ["/usr/sbin/init"]