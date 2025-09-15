FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y sudo openssh-server && \
    mkdir /var/run/sshd && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config && \
    echo 'root:1' | chpasswd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

EXPOSE 22 5901

CMD ["/usr/sbin/sshd", "-D"]