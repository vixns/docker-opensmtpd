#
# opensmtpd Dockerfile
#
#

FROM vixns/base
MAINTAINER Stéphane Cottin <stephane.cottin@vixns.com>

ENV OPENSMTPD_VERSION 5.7.3p1-1.1

# Install backported opensmtpd.
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install --no-install-recommends --auto-remove -y opensmtpd=${OPENSMTPD_VERSION} ca-certificates && \
  rm -rf /var/lib/apt/lists/* 

COPY smtpd.conf /etc/smtpd.conf
COPY opensmtpd.sh /usr/local/bin/opensmtpd

EXPOSE 25

ENTRYPOINT ["/usr/local/bin/opensmtpd"]
