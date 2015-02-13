FROM jenkins
USER root
RUN apt-get update && apt-get install -y sudo make git devscripts && rm -rf /var/lib/apt/lists/*
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins
USER jenkins
