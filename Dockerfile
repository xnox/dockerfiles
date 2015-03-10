FROM jenkins
USER root
RUN apt-get update && apt-get install -y sudo make git devscripts rpm yum-utils pep8 pyflakes uuid-runtime python-flake8 python3-flake8 && rm -rf /var/lib/apt/lists/*
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins
USER jenkins
