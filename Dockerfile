FROM jenkins
USER root
RUN sed 's/http.debian.net/ftp.us.debian.org/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -s -y ppa:xnox/indigo && sed 's/jessie/trusty/' -i /etc/apt/sources.list.d/xnox*
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 157951FE4031D287
RUN apt-get update && apt-get install -y sudo make git devscripts rpm yum-utils pep8 pyflakes uuid-runtime python-flake8 python3-flake8 libtap-formatter-junit-perl koji-1 python-openssl mock build-essential dh-autoreconf pkg-config systemd rubygems sqlite3 qemu-kvm qemu-system-x86 qemu-utils libxml2-utils rsync
RUN echo 'jenkins ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkins
RUN addgroup mock
RUN adduser jenkins mock
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
RUN apt-get install locales
RUN apt-get dist-upgrade -y
RUN gem install asciidoctor
RUN gem install coderay
USER jenkins
