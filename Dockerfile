FROM alpine

RUN apk add --no-cache openssl ca-certificates opensmtpd \
&& mkdir -p /var/spool/smtpd && chmod 711 /var/spool/smtpd
WORKDIR /var/spool/smtpd

COPY smtpd.conf /etc/smtpd/smtpd.conf

EXPOSE 25

CMD ["smtpd", "-d", "-P", "mda"]
