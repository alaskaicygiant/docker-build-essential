FROM quay.io/alaska/baseimage
MAINTAINER Owen Ouyang <owen.ouyang@live.com>

ENV LOG_DIR="/var/log/docker" \
    TERM=dumb 

# Enable silent install
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

RUN add-apt-repository "deb http://archive.canonical.com/ trusty partner"
RUN apt-get update
RUN apt-get install -y software-properties-common \
              build-essential \
              gcc \
              g++ \
              g++-multilib \
              git \
              distcc \
              ccache \
              make \
              bc \
              autoconf2.13 \
              bison \
              flex \
              gawk

# Clean up any files used by apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
