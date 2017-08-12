FROM ubuntu:trusty
MAINTAINER Vinicius Tinti <viniciustinti@gmail.com>

RUN apt-get update
RUN apt-get install -y git-core
RUN apt-get install -y build-essential gperf flex bison libncurses5-dev libncursesw5-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y binutils-arm-none-eabi gcc-arm-none-eabi gdb-arm-none-eabi libnewlib-arm-none-eabi
RUN apt-get install -y git texinfo libgmp-dev libmpfr-dev libmpc-dev gettext libtool autoconf pkg-config libftdi-dev libusb-1.0-0-dev python-yaml
RUN apt-get install -y wget

RUN apt-get clean

RUN useradd -ms /bin/bash build
RUN su build

RUN git clone https://bitbucket.org/nuttx/apps.git /home/build/apps
RUN git clone https://bitbucket.org/nuttx/nuttx.git /home/build/nuttx
RUN cd /home/build/nuttx; \
    git submodule update --init

RUN mkdir /home/build/nuttx/misc
RUN git clone https://bitbucket.org/nuttx/buildroot.git /home/build/nuttx/misc/buildroot
RUN git clone https://bitbucket.org/nuttx/tools.git /home/build/nuttx/misc/tools

RUN cd /home/build/nuttx/misc/tools/kconfig-frontends; \
    ./configure --enable-mconf -prefix=/usr; \
    make; \
    make install

WORKDIR /home/build

RUN chown -R build:build /home/build/*

CMD [ "sudo","-u","build","-H","/bin/bash" ]
