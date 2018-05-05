FROM centos

MAINTAINER Gustav <gustav.uhia@gmail.com>

# copy get-pip.py
COPY ./file/get-pip.py /tmp

# run commands for install ansible
RUN cd /tmp && \
    python get-pip.py && \
    rm -f /tmp/get-pip.py && \
    pip install cryptography paramiko PyYAML jinja2 pyvmomi dnspython netaddr && \
    yum -y update && yum -y install openssh-clients unzip sshpass && yum clean all && \
    curl https://github.com/ansible/ansible/archive/stable-2.4.zip -L -o ansible-stable-2.4.zip && \
    unzip ansible-stable-2.4.zip && \
    cd ansible-stable-2.4 && \
    python setup.py install && \
    cd /tmp && \
    rm -rf /tmp/ansible-stable-2.4*

# copy ansible.cfg
COPY ./file/ansible.cfg /etc/ansible/ansible.cfg

WORKDIR /root
CMD ["/bin/bash"]
