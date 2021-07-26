FROM centos

ENV container docker

# install common packages
RUN yum install -y openssh-server openssh-clients \
    && yum install -y sudo \
    && yum install -y nano \
    && yum install -y curl \
    && yum install git -y \
    && yum -y install initscripts \
    && yum clean all \
    && systemctl enable sshd.service

# create folder ssh and change password root
RUN mkdir -p .ssh
ADD authorized_keys /root/.ssh/
RUN echo "root:password" | chpasswd

# create user app and change password
RUN ssh-keygen -A && adduser app && echo "app:password" | chpasswd
RUN mkdir -p .ssh
ADD authorized_keys /home/app/.ssh/
RUN rm -rf /run/nologin

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "app ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && echo "app ALL=(ALL:ALL) ALL" >> /etc/sudoers

EXPOSE 22 80 443

USER root

CMD ["/usr/sbin/sshd", "-D"]
