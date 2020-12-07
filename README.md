rsyslog in a container
======================

Project URL: [https://github.com/jumanjihouse/docker-rsyslog](https://github.com/jumanjihouse/docker-rsyslog)
<br/>
Registry: [https://registry.hub.docker.com/r/jumanjiman/rsyslog/](https://registry.hub.docker.com/r/jumanjiman/rsyslog/)

[![Download size](https://images.microbadger.com/badges/image/jumanjiman/rsyslog.svg)](http://microbadger.com/images/jumanjiman/rsyslog "View on microbadger.com")&nbsp;
[![Version](https://images.microbadger.com/badges/version/jumanjiman/rsyslog.svg)](http://microbadger.com/images/jumanjiman/rsyslog "View on microbadger.com")&nbsp;
[![Source code](https://images.microbadger.com/badges/commit/jumanjiman/rsyslog.svg)](http://microbadger.com/images/jumanjiman/rsyslog "View on microbadger.com")&nbsp;
[![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/rsyslog.svg)](https://registry.hub.docker.com/u/jumanjiman/rsyslog)&nbsp;
[![Circle CI](https://circleci.com/gh/jumanjihouse/docker-rsyslog.svg?style=svg&circle-token=89ad04436cc4005742ec011ac6d4048cc2e2034e)](https://circleci.com/gh/jumanjihouse/docker-rsyslog)

**Table of Contents**

- [Overview](#overview)
- [How-to](#how-to)
  - [Fetch an already-built image](#fetch-an-already-built-image)
  - [Run](#run)
  - [Use systemd for automatic startup](#use-systemd-for-automatic-startup)
  - [Build](#build)
  - [Publish to a private registry](#publish-to-a-private-registry)
- [Contribute](#contribute)
- [Other rsyslog images](#other-rsyslog-images)
- [License](#license)


Overview
--------

This source is used to build an image for
[rsyslog](http://www.rsyslog.com/).
The image contains:

* [rsyslog-x86_64](http://forum.alpinelinux.org/apk/main/x86_64/rsyslog)
* default, minimal configuration that you can easily override

The runtime image is quite small (roughly 8 MB) since it is based on the
[alpine docker image](https://github.com/gliderlabs/docker-alpine),
which is based on [Alpine Linux](https://www.alpinelinux.org/).

I use this image in combination with
[logspout](https://github.com/gliderlabs/logspout)
to forward log messages from containers to a central syslog server.
If a particular docker container *only* logs to syslog,
this rsyslog container provides a way to copy the log messages to
`docker logs`, which gets picked up by logspout.


How-to
------

### Fetch an already-built image

The runtime image is published as `jumanjiman/rsyslog`.

    docker pull jumanjiman/rsyslog


### Run

Run a container from the CLI:

    docker run -d \
      --name rsyslog.service \
      -h $(hostname) \
      jumanjiman/rsyslog

Run a container that *only* logs to syslog:

    docker run -d \
      --name tftp \
      -h tftp.example.com \
      --volumes-from rsyslog.service \
      jumanjiman/tftp-hpa

Now you can tail the logs from the tftp container:

    docker logs -f rsyslog.service


### Use systemd for automatic startup

Review and potentially modify the sample systemd unit file at
[`systemd/rsyslog.service`](systemd/rsyslog.service), then run:

    sudo cp systemd/rsyslog.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl start rsyslog
    sudo systemctl enable rsyslog


### Build

On a docker host, run:

    ci/build
    ci/tag
    ci/test


### Publish to a private registry

You can push the built image to a private docker registry:

    docker tag rsyslog registry_id/your_id/rsyslog
    docker push registry_id/your_id/rsyslog


Contribute
----------

See [`CONTRIBUTING.md`](CONTRIBUTING.md) in this repo.


Other rsyslog images
--------------------

* https://github.com/helderco/docker-rsyslog


License
-------

See [`LICENSE`](LICENSE) in this repo.
