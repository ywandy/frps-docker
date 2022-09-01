FROM alpine:3.8
MAINTAINER yewei <yewei_andy@163.com>

WORKDIR /
ENV FRP_VERSION 0.44.0

RUN set -x && \
	wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
	tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
	cd frp_${FRP_VERSION}_linux_amd64 && \
	mkdir /frp && \
	mv frps /frps && \
    mv frps.ini /frp/frps.ini && \
	cd .. && \
	rm -rf *.tar.gz && \
	rm -rf frp_${FRP_VERSION}_linux_amd64

VOLUME /frp

CMD /frps -c /frp/frps.ini
