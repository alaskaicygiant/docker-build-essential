FROM quay.io/alaska/baseimage
MAINTAINER Owen Ouyang <owen.ouyang@live.com>

ENV LOG_DIR="/var/log/docker" \
    TERM=dumb 

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
