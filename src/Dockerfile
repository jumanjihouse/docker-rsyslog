FROM gliderlabs/alpine:latest
RUN apk-install rsyslog
COPY rsyslog.conf /etc/
VOLUME /dev
VOLUME /var/log
ENTRYPOINT ["rsyslogd"]
CMD ["-n"]
# Run this image:
# docker run -d -v /tmp/syslogdev:/dev --name rsyslog rsyslog
# http://jpetazzo.github.io/2014/08/24/syslog-docker/
