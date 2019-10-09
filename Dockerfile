FROM alpine:3.1

RUN apk add --update bash sed curl gzip tar \
    && rm -rf /var/cache/apk/*
RUN curl -L -O https://github.com/osrg/gobgp/releases/download/v2.9.0/gobgp_2.9.0_linux_amd64.tar.gz
RUN tar -xzvf gobgp_2.9.0_linux_amd64.tar.gz
RUN mkdir /root/gobgp
RUN mv gobgp /root/gobgp/gobgp
RUN mv gobgpd /root/gobgp/gobgpd
RUN chmod +x /root/gobgp/gobgp
RUN chmod +x /root/gobgp/gobgpd
COPY ./gobgpd.conf.template /root/gobgp/gobgpd.conf.template
COPY ./entrypoint.sh /root/gobgp/entrypoint.sh
COPY ./startup.sh /root/gobgp/startup.sh
COPY ./setup.sh /root/gobgp/setup.sh
RUN chmod +x /root/gobgp/entrypoint.sh
RUN chmod +x /root/gobgp/startup.sh
RUN chmod +x /root/gobgp/setup.sh
ENTRYPOINT /root/gobgp/entrypoint.sh
