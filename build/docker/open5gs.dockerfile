FROM ubuntu:jammy

MAINTAINER Motohiro Abe <motohiro@gmail.com>

# open5gs v2.7.0
# 02-23-2024

RUN apt-get update && \
   apt-get -yq dist-upgrade && \
   apt-get --no-install-recommends -qqy install python3-pip python3-setuptools python3-wheel ninja-build build-essential \
   flex bison git cmake libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev \
   libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson && \
   git clone --recursive https://github.com/open5gs/open5gs && \   
   cd open5gs && meson build --prefix=/ && ninja -C build && cd build && ninja install

WORKDIR /
