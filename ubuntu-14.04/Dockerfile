FROM ubuntu:14.04

RUN locale-gen en_US.UTF-8
ADD build-packages.sh /tmp/build/
RUN /tmp/build/build-packages.sh

RUN useradd -m -s /bin/zsh snowy
USER snowy
WORKDIR /home/snowy
ENV HOME /home/snowy
RUN git clone --recursive https://github.com/shanegibbs/shanegibbs-dots.git /home/snowy/.shanegibbs-dots
RUN /home/snowy/.shanegibbs-dots/setup.sh

ADD zshrc-local /home/snowy/.zshrc-local

ENV SRCDIR /home/snowy/src

ADD build-llvm.sh /tmp/build/
RUN /tmp/build/build-llvm.sh

ADD build-flex.sh /tmp/build/
RUN /tmp/build/build-flex.sh

ADD build-bison.sh /tmp/build/
RUN /tmp/build/build-bison.sh

ADD build.sh /usr/local/bin/build
ADD ssh.key /home/snowy/.ssh/id_rsa
ADD ssh.key.pub /home/snowy/.ssh/authorized_keys

USER root
RUN rm -rf /tmp/build
# to pre-seed zsh completion
RUN ln -s /home/snowy/build/src/bin/snowy /usr/local/bin/snowy
RUN ln -s /home/snowy/build/src/bin/snowy-default /usr/local/bin/snowy-default

RUN apt-get install -y openssh-server
RUN chown snowy.snowy /home/snowy/.zshrc-local
RUN chown snowy.snowy -R /home/snowy/.ssh
RUN chmod 600 /home/snowy/.ssh/*
RUN echo snowy ALL=NOPASSWD: ALL > /etc/sudoers.d/snowy
RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

USER snowy
ENTRYPOINT [ "/bin/zsh", "-c" ]
CMD [ "/bin/zsh", "-l" ]
