# ----------------------------------
# OCAP2 Web component Dockerfile
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ghcr.io/ocap2/web

MAINTAINER ARCOMM, <webmaster@arcomm.co.uk>

RUN rm -rf /var/lib/ocap/data \
    /var/lib/ocap/maps \
    /var/lib/ocap/db \
    /etc/ocap/setting.json
RUN ln -s /home/container/data /var/lib/ocap/data
RUN ln -s /home/container/maps /var/lib/ocap/maps
RUN ln -s /home/container/db /var/lib/ocap/db
RUN ln -s /home/container/setting.json /etc/ocap/setting.json

RUN adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]