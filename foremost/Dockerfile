FROM eg5846/ubuntu:xenial

RUN \
  apt-get update  && \
  apt-get install -y --no-install-recommends foremost && \
  apt-get clean


COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

