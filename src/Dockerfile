FROM alpine:3.10.1

RUN apk upgrade --no-cache && \
    apk add --no-cache \
      rsyslog \
      rsyslog-hiredis \
      rsyslog-snmp \
      rsyslog-mysql \
      rsyslog-pgsql \
      rsyslog-tls \
      && \
    :
COPY . /
VOLUME /var/run/rsyslog/dev
ENTRYPOINT ["/usr/sbin/entrypoint"]

EXPOSE 514/tcp
EXPOSE 514/udp
