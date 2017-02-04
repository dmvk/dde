FROM debian:jessie

MAINTAINER David Moravek <david.moravek@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

# ADD SOURCES
RUN sed -i 's/^deb\(.*\)$/deb\1\ndeb-src\1/' /etc/apt/sources.list

# INSTALL ESSENTIAL
RUN apt-get update && \
    apt-get install apt-utils build-essential git wget sudo tmux -y

# INSTALL VIM
RUN apt-get install ncurses-dev -y && \
    cd /opt && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    make && \
    make install

# INSTALL GOLANG
ENV GOLANG_URL 'https://storage.googleapis.com/golang/go1.8rc3.linux-amd64.tar.gz'
ENV GOLANG_SHA '0ff3faba02ac83920a65b453785771e75f128fbf9ba4ad1d5e72c044103f9c7a'
RUN cd /opt && \
    wget -O go.tar.gz $GOLANG_URL && \
    echo $GOLANG_SHA go.tar.gz | sha256sum -c - && \
    tar xzvf go.tar.gz && \
    rm go.tar.gz

# CREATE USER AND HOME DIR
ADD home /home/dodee
RUN useradd dodee && \
    chown -R dodee:dodee /home/dodee && \
    echo '%dodee ALL=(ALL:ALL) NOPASSWD:ALL' | tee /etc/sudoers.d/dodee

# CREATE WORKSPACE
RUN mkdir /workspace && \
    chown dodee:dodee /workspace

# SWITCH USER
USER dodee

# INSTALL VIM PLUGINS
RUN mkdir -p ~/.vim/bundle && \
    git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim && \
    vim -i NONE -c VundleInstall -c quitall > /dev/null

# INCEPTION
WORKDIR /workspace
CMD /bin/bash
