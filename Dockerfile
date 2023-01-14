FROM debian:bullseye-slim

LABEL author="Radel"

RUN adduser --quiet --system --home /var/lib/haproxy --no-create-home --shell /bin/false --uid 20001 --group rdhaproxy

RUN apt-get update \
  && apt-get -y install  coreutils haproxy \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 443

CMD ["/usr/sbin/haproxy","-f","/etc/haproxy/haproxy.cfg"]
