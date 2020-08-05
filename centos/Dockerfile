FROM centos:8

RUN yum install -y sudo shadow-utils procps wget
RUN yum install -y openssh-server openssh-clients
RUN yum install -y nano
RUN yum install -y curl
RUN yum -y install initscripts && yum clean all

RUN systemctl enable sshd.service

RUN mkdir -p .ssh
ADD authorized_keys /root/.ssh/

RUN echo "root:password" | chpasswd

RUN rm /run/nologin
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin no" >> /etc/ssh/sshd_config
RUN echo "app ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN echo "app ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN ssh-keygen -A
RUN adduser app
RUN echo "app:password" | chpasswd

USER app
WORKDIR /home/app

RUN mkdir -p .ssh
ADD authorized_keys /home/app/.ssh/

EXPOSE 22 80 443 8080 3000

USER root

CMD ["/sbin/sshd", "-D"]