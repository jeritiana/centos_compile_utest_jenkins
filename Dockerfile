FROM flobo/centos_compile_utest:6
MAINTAINER The U-TEST Team

ENV JENKINS_PUBLIC_KEY="define" \
    GITLAB_SSH_PRIVATE_KEY="define"

RUN yum install -y openssh-server
RUN useradd -ms /bin/bash jenkins

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
