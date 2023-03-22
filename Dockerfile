FROM debian:bullseye-slim

LABEL org.opencontainers.image.authors="Jonathan Ilias-Pillet <ismael@chouppy.net>"

ENV LANG fr_FR.utf8

ARG DEBIAN_FRONTEND=noninteractive

RUN \
apt-get update && \
apt-get install -y locales tzdata && \
localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8 && \
apt-get install -y tini \
                   wireguard iproute2 openresolv iputils-ping iputils-arping && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* 

COPY start_wireguard.sh /usr/local/bin

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/start_wireguard.sh"]

