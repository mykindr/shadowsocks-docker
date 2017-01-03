# shadowsocks-docker

FROM ubuntu:14.04.3
MAINTAINER Musalut <Verwalter@live.de>
RUN apt-get update && \
    apt-get install -y python-pip libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git

RUN pip install shadowsocks

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
ADD ss-docker.sh /usr/local/bin/ss-docker.sh
ADD shadowsocks.json /etc/shadowsocks.json
RUN chmod +x /usr/local/bin/ss-docker.sh
RUN chmod +x /usr/local/bin/net_speeder
RUN chmod +x /etc/shadowsocks.json

# Configure container to run as an executable
CMD ["/etc/shadowsocks/shadowsocks/server.py","-c","/etc/shadowsocks.json"]
