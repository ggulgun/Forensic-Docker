FROM ubuntu:14.04.3


RUN apt-get update && apt-get install -y \
  scalpel 
  

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

