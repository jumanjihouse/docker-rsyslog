FROM alpine:3.9

ARG VERSION

RUN apk add --no-cache \
      rsyslog=${VERSION} \
      rsyslog-hiredis \
      rsyslog-snmp \
      rsyslog-mysql \
      rsyslog-pgsql \
      rsyslog-tls \
      && \
    :
COPY . /
VOLUME /var/run/rsyslog/dev
ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslogd.conf"]

EXPOSE 514/tcp
EXPOSE 514/udp

# These go last to preserve the build cache.
ARG CI_BUILD_URL
ARG BUILD_DATE
ARG VCS_REF
LABEL \
    io.github.jumanjiman.ci-build-url=${CI_BUILD_URL} \
    io.github.jumanjiman.version=${VERSION} \
    io.github.jumanjiman.build-date=${BUILD_DATE} \
    io.github.jumanjiman.vcs-ref=${VCS_REF} \
    io.github.jumanjiman.license="MIT" \
    io.github.jumanjiman.docker.dockerfile="/src/Dockerfile" \
    io.github.jumanjiman.vcs-type="Git" \
    io.github.jumanjiman.vcs-url="https://github.com/jumanjihouse/docker-rsyslog.git"
