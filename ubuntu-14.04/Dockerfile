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

USER root
RUN chown snowy.snowy /home/snowy/.zshrc-local
RUN echo snowy ALL=NOPASSWD: ALL > /etc/sudoers.d/snowy
RUN rm -rf /tmp/build

USER snowy
CMD /bin/zsh -l
