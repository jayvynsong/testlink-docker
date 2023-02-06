FROM alpine:3.9

RUN \
  mkdir -p /mnt/testlink/

ADD ./testlink-code/* /mnt/testlink/
ADD *.php /mnt/testlink/

ADD ./start_src_container.sh /start_src_container.sh
RUN chmod +x /start_src_container.sh

CMD ["/start_src_container.sh"]
