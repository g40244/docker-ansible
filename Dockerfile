FROM centos

MAINTAINER Gustav <gustav.uhia@gmail.com>

# run commands for install ansible
RUN cd /tmp && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm -f /tmp/get-pip.py && \
    pip install 'ansible>2.4,<2.5' && \
    yum -y update && yum -y install openssh-clients sshpass && yum clean all

# copy ansible.cfg
COPY ./file/ansible.cfg /etc/ansible/ansible.cfg

WORKDIR /root
CMD ["/bin/bash"]
