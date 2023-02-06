FROM alpine:3.9

RUN \
  apk add wget ca-certificates --update-cache && \
  wget -q -O - https://github.com/jayvynsong/testlink-code/archive/inprogress.tar.gz | tar zxf - && \
  mkdir -p /var && \
  mv testlink-* /mnt/testlink && \
  rm -rf testlink* && \
  chmod 777 -R /mnt/testlink/gui/templates_c && \
  mkdir -p /mnt/testlink/logs && \
  mkdir -p /mnt/testlink/upload_area && \
  chmod 777 -R /mnt/testlink/logs && \
  chmod 777 -R /mnt/testlink/upload_area

ADD *.php /mnt/testlink/

ENTRYPOINT tail -f /dev/null

# VOLUME /var/testlink
