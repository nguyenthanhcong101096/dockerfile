FROM alpine

RUN apk update \
    && apk add --no-cache openssh-server openrc curl sudo nano git nginx rsync \
    && apk add --no-cache openssh-client \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel \
    && mkdir /repos /repos-backup

# install docker
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
    && apk add docker@community

# create folder ssh and change password root
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh/ \
    && ssh-keygen -A 
RUN echo "root:password" | chpasswd
ADD authorized_keys /root/.ssh/

# create user app and change password
RUN adduser --disabled-password app
RUN echo "app:password" | chpasswd
RUN mkdir -p /home/app/.ssh
ADD authorized_keys /home/app/.ssh/

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "app ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && echo "app ALL=(ALL:ALL) ALL" >> /etc/sudoers

WORKDIR /root

RUN mkdir scripts
COPY scripts root/scripts
RUN chmod u+x root/scripts/*

EXPOSE 22 80 443

ENTRYPOINT ["sh","-c", "rc-status; rc-service sshd start; crond -f"]
