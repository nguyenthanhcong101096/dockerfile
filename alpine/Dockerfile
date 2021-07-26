FROM alpine:3.8

RUN apk update && \
    apk add --no-cache openssh openrc tzdata sudo bash git

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

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
