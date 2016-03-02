FROM alpine:3.3
RUN apk add --no-cache rsyslog
COPY . /
VOLUME /var/run/rsyslog/dev
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]
