FROM docker:dind

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base

RUN pip install awscli

ADD awsconfig.sh /root
RUN chmod +x /root/awsconfig.sh

ENTRYPOINT ["/root/awsconfig.sh"]
