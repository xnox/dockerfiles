FROM jenkins
USER root
RUN sed 's/http.debian.net/ftp.us.debian.org/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -s -y ppa:xnox/indigo && sed 's/jessie/trusty/' -i /etc/apt/sources.list.d/* && rm -rf /var/lib/apt/lists/*
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 157951FE4031D287
RUN apt-get update && apt-get install -y sudo make git devscripts rpm yum-utils pep8 pyflakes uuid-runtime python-flake8 python3-flake8 libtap-formatter-junit-perl koji-1 python-openssl && rm -rf /var/lib/apt/lists/*
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins
USER jenkins
