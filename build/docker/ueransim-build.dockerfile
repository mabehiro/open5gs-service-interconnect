FROM ubuntu:jammy

MAINTAINER Motohiro Abe <motohiro@gmail.com>

# Build cmake image

RUN apt-get update && \
apt-get -yq dist-upgrade && \
apt-get --no-install-recommends -qqy install git libssl-dev make gcc g++ libsctp-dev lksctp-tools iproute2 && \
git config --global http.sslverify false && \
git clone https://gitlab.kitware.com/cmake/cmake && \
cd cmake && \
./bootstrap && make && make install

# Build ueran with the cmake

FROM ubuntu:jammy

COPY --from=0 /usr/local/bin/ /usr/local/bin/
COPY --from=0 /usr/local/share/ /usr/local/share/

RUN apt-get update && \
   apt-get -yq dist-upgrade && \
   apt-get --no-install-recommends -qqy install git make gcc g++ libsctp-dev lksctp-tools iproute2  && \
   git config --global http.sslverify false && \
   git clone https://github.com/aligungr/UERANSIM  && \
   cd UERANSIM && \
   make

# Install ueran

FROM ubuntu:jammy

COPY --from=1 UERANSIM UERANSIM

USER root

RUN apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get --no-install-recommends -qqy install git make gcc g++ libsctp-dev lksctp-tools iproute2 iputils-ping dnsutils

WORKDIR /UERANSIM/build
