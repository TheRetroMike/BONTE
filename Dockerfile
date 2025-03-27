FROM ubuntu:20.04
RUN apt-get update -y
RUN apt-get install wget build-essential unzip -y
WORKDIR /opt/
RUN wget https://github.com/bontecoin/BONTE/releases/download/v1.0.1/bonte-linux1.0.1.zip
RUN unzip bonte-linux1.0.1.zip
RUN mv bontecoind /usr/bin
RUN mv bontecoin-cli /usr/bin
RUN rm bonte*
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/bontecoind -printtoconsole
