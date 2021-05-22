FROM centos

ENV container docker

RUN yum install -y openssh-server openssh-clients \
    && yum install -y sudo \
    && yum install -y nano \
    && yum install -y curl \
    && yum install git -y \
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

CMD ["/usr/sbin/sshd", "-D"]
