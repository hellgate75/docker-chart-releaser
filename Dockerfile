FROM ubuntu:19.10

ARG GO_RELEASER_VERSION

ENV RELEASER_VERSION=${GO_RELEASER_VERSION}

WORKDIR /root

COPY install-app.sh /root/
COPY ./docker-entrypoint.sh /

RUN chmod +x /root/install-app.sh &&\
  bash "/root/install-app.sh" &&\
  rm -f /root/install-app.sh &&\
  chmod +x /docker-entrypoint.sh

ENV RELEASER_VERSION=""

ENTRYPOINT ["/docker-entrypoint.sh"]
