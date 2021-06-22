FROM ubuntu:18.04

RUN apt-get -y update \
    && apt-get install sudo -y \
    && apt-get install git -y \
    && apt-get install nano -y \
    && apt-get install locales -y \
    && apt-get install curl -y \
    && apt-get install openssh-server -y \
    && apt-get install unzip -y \
    && apt-get install openssh-client -y

RUN mkdir /var/run/sshd

# create folder ssh and change password root
RUN echo "root:password" | chpasswd
RUN mkdir -p .ssh
ADD authorized_keys /root/.ssh/

# create user app
RUN ssh-keygen -A && adduser app && echo "app:password" | chpasswd
ADD authorized_keys /home/app/.ssh/

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
    && echo "app ALL=(ALL:ALL) ALL" >> /etc/sudoers

# install docker
RUN apt-get update \
    && apt-get install apt-transport-https ca-certificates curl software-properties-common -y \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" \
    && apt-get update \
    && apt-get install docker-ce -y \
    && sudo usermod -aG docker app \
    && su - app \
    && id -nG

# install awscli
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && sudo ./aws/install

# install kubectl
RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.8/2020-09-18/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin

RUN sudo -S -k locale-gen en_US en_US.UTF-8 \
    && echo 'export LC_ALL="en_US.UTF-8"' >> ~/.bashrc

USER root

EXPOSE 22 80 443 8080 3000 50000

CMD ["/usr/sbin/sshd", "-D"]
