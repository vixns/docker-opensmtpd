#
# opensmtpd Dockerfile
#
#

FROM vixns/base
MAINTAINER Stéphane Cottin <stephane.cottin@vixns.com>

# Install backported opensmtpd.
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install --no-install-recommends --auto-remove -y opensmtpd && \
  rm -rf /var/lib/apt/lists/* 

#open relay, do not link port 25 on public IP !
RUN /bin/echo -e 'listen on 0.0.0.0\naccept from any for any relay' > /etc/smtpd.conf

EXPOSE 25

ENTRYPOINT ["smtpd", "-d", "-P", "mda"]