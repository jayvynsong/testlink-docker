FROM openresty/openresty:alpine-fat

RUN \
  apk update && \
  apk add \
    --virtual build-deps \
    make gcc musl-dev \
    pcre-dev openssl-dev zlib-dev ncurses-dev readline-dev \
    curl perl  git lua-dev luajit-dev python3 && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  git clone --recursive --depth 1 https://github.com/jayvynsong/lua-resty-waf.git /tmp/lua-resty-waf && \
  cd /tmp/lua-* && \
  make lua-aho-corasick lua-resty-htmlentities libinjection decode && \
  make install && \
  ln -s /usr/local/openresty/bin/openresty /usr/local/bin/nginx && \
  cd / && \
  rm -rf /tmp/lua-* && \
  apk del build-deps && \
  rm -rf /var/cache/apk/*

ADD nginx.conf /usr/local/openresty/nginx/conf/
ADD default.conf /etc/nginx/conf.d/
