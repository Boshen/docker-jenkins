FROM jenkins/jenkins:lts

ARG USER_JENKINS=jenkins
ARG USER_ROOT=root
ARG GROUP_DOCKER=docker
ARG GROUP_DOCKER_GID=1001

USER ${USER_ROOT}

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN addgroup -gid ${GROUP_DOCKER_GID} ${GROUP_DOCKER} \
        && addgroup ${USER_JENKINS} ${GROUP_DOCKER}

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common vim

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update  -qq \
    && apt-get install docker-ce-cli -y

RUN rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER ${USER_JENKINS}

COPY docker-socket.sh /

# keep people logged in for 24 hours and 12 hours of inactivity
ENV JENKINS_OPTS --sessionTimeout=1440 --sessionEviction=43200

ENTRYPOINT ["/docker-socket.sh"]
