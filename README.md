rsyslog in a container
======================

Project URL: [https://github.com/jumanjihouse/docker-rsyslog](https://github.com/jumanjihouse/docker-rsyslog)

Registry: [https://registry.hub.docker.com/u/jumanjiman/rsyslog/](https://registry.hub.docker.com/u/jumanjiman/rsyslog/)


Overview
--------

This source is used to build an image for
[rsyslog](http://www.rsyslog.com/).
The image contains:

* [rsyslog-x86_64](http://forum.alpinelinux.org/apk/main/x86_64/rsyslog)
* default, minimal configuration that you can easily override

The runtime image is quite small (roughly 8 MB) since it is based on the
[gliderlabs/alpine docker image](https://github.com/gliderlabs/docker-alpine),
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
      --name rsyslog \
      -h $(hostname) \
      -v /tmp/syslogdev:/log \
      jumanjiman/rsyslog


### Use systemd for automatic startup

Review and potentially modify the sample systemd unit file at
[`systemd/rsyslog.service`](systemd/rsyslog.service), then run:

    sudo cp systemd/rsyslog.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl start rsyslog
    sudo systemctl enable rsyslog


### Build

On a docker host, run:

    script/build
    script/test


### Publish to a private registry

You can push the built image to a private docker registry:

    docker tag rsyslog registry_id/your_id/rsyslog
    docker push registry_id/your_id/rsyslog


Contribute
----------

See [`CONTRIBUTING.md`](CONTRIBUTING.md) in this repo.


License
-------

See [`LICENSE`](LICENSE) in this repo.
