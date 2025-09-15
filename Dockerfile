FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y sudo openssh-server && \
    mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
    echo 'root:1' | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]