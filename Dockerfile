FROM alpine

MAINTAINER Gustav <gustav.uhia@gmail.com>

# run commands for install ansible
RUN apk add --no-cache python2 curl gcc make libffi-dev python2-dev musl-dev openssl-dev && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    rm -f get-pip.py && \
    pip install 'ansible>2.5,<2.6' && \
    apk del --purge gcc make && \
    rm -rf /root/.cache/pip

# copy ansible.cfg
COPY ./file/ansible.cfg /etc/ansible/ansible.cfg

WORKDIR /root
CMD ["/bin/sh"]
